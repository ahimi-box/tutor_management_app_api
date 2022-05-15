# frozen_string_literal: true

class Teacher < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  has_many :teachers_students, dependent: :destroy
  has_many :students, through: :teachers_students 
  has_many :subjects, dependent: :destroy
  has_one_attached :teacher_icon
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  

  def teacher_icon_url
    teacher_icon.attached? ? url_for(teacher_icon) : nil
  end
end
