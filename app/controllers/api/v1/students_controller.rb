class Api::V1::StudentsController < ApplicationController

  def index
    students = Student.includes(:teachers_students).order(id: "DESC")
    render json: students.to_json(include: :teachers_students), status: 200
  end

  def update
    student = Student.find(params[:id])
    if student.update(student_params)
      render json: student.to_json(include: :teachers_students), status: 200
    else
      render json: student, status: 500
    end
  end

  def destroy
    student = Student.find(params[:id])
    # 中間テーブル削除
    student.teachers.each do |t_id|
      student.teachers.destroy(t_id)
    end
    if student.destroy
      render json: student, status: 200
    else
      render json: student, status: 500
    end
  end

  private

  def teachers_students_params
    params.permit(teacher_id: [])
  end

  def student_params
    params.permit(:id, :name, :email, :post_code, :address, :birthday, teacher_ids: [])
  end

end
