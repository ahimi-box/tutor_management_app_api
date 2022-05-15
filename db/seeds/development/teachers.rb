10.times do |n|
  name = "先生#{n+1}"
  email = "teacher-#{n+1}@email.com"
  introduction = "初めまして！先生#{n+1}といいます。生徒に合わせ教え方を変えて勉強が楽しい！と思ってもらえるように笑顔を絶やさず丁寧に教えます！"
  # student_id = n+1
  password = "password"
  Teacher.create!(name: name,
                  email: email,
                  introduction: introduction,
                  # student_id: student_id,
                  password: password,
                  password_confirmation: password,
                  teacher: true
                  )
end

Teacher.create(name: '管理者',
                email: 'teacher-admin@email.com',
                password: 'password',
                teacher: true,
                admin: true
                )

 puts "teachers = #{Teacher.count}"