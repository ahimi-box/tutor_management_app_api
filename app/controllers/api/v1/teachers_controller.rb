class Api::V1::TeachersController < ApplicationController
  
  def index
    teachers = Teacher.eager_load(:subjects).where(admin: nil).order(id: "DESC")
    render json: teachers.to_json(include:[:subjects], methods: [:teacher_icon_url], status: 200)
  end

  def update
    teacher = Teacher.find(params[:id])
    subject = Subject.where(teacher_id: params[:id])
    subjectitems = subject.map{|subject1| subject1.subject} 
      # データベース内リセット   
    subjectitems.each do |subjectitem|
      subj = Subject.find_by(subject: subjectitem, teacher_id: params[:id])
      subj.destroy
    end
    if teacher.update(teacher_params)
      subject_params.each do |i, item|
        item.each do |item2|
          subject = Subject.new(subject: item2, teacher_id: params[:id])
          subject.save
        end
      end
      render json: teacher.to_json(include: :subjects, methods: [:teacher_icon_url]), status: 200
    else
      render json: teacher, status: 500
    end
  end

  def destroy
    teacher = Teacher.find(params[:id])
    # 中間テーブル削除
    teacher.students.each do |t_id|
      teacher.students.destroy(t_id)
    end
    if teacher.destroy
      render json: teacher, status: 200
    else
      render json: teacher, status: 500
    end
  end


  private

  def teacher_params
    params.permit(:id, :name, :email, :introduction, :teacher_icon)
  end

  def subject_params
    params.permit(subject: [])
  end

end
