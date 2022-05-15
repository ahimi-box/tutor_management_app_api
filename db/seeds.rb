# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# table_names = %w(
#   teachers
#   students
#   teacher_students
#   subjects
#   academic_abilities
#   notices
#   inquiries
#   rooms
#   messages
# )
table_names = %w(
  teachers
  students
  teachers_students
  subjects
)

table_names.each do |table_name|
  path = Rails.root.join("db/seeds/#{Rails.env}/#{table_name}.rb")

#   # ファイルが存在しない場合はdevelopmentディレクトリを読み込む
  path = path.sub(Rails.env, "development") unless File.exist?(path)

  puts "#{table_name}..."
  require path
 end



# Teacher.create(name: '管理者', email: 'teacher-admin@email.com',
#             password: 'password', teacher: true, admin: true)

# Teacher.create(name: '先生1', email: 'teacher@email.com',
#             password: 'password', teacher: true)

# Student.create(name: '生徒1', email: 'sample@email.com',
#             password: 'password')

# Subject.create(subject: '国語', teacher_id: 2)
# Subject.create(subject: '算数', teacher_id: 2)
# Subject.create(subject: '国語', teacher_id: 3)
# Subject.create(subject: '算数', teacher_id: 3)
# Subject.create(subject: '国語', teacher_id: 4)
# Subject.create(subject: '算数', teacher_id: 4)