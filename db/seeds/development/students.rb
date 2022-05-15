10.times do |n|
  name = "生徒#{n+1}"
  email = "student-#{n+1}@email.com"
  password = "password"
  post_code = "144-0047"
  address = "東京都大田区萩中"
  from = Time.parse("2011/04/02")
  to = Time.parse("2017/04/01")
  birthday = Random.rand(from..to)
  # teacher_id = n+1
  Student.create!(name: name,
                  email: email,
                  password: password,
                  password_confirmation: password,
                  post_code: post_code,
                  address: address,
                  birthday: birthday,
                  # teacher_id: teacher_id,
                  # teacher: false
                  )
end
# 10.times do |n|
#   name = "生徒#{(n+10)+1}"
#   email = "student-#{(n+10)+1}@email.com"
#   password = "password"
#   post_code = "144-0047"
#   address = "東京都大田区萩中"
#   from = Time.parse("2010/04/02")
#   to = Time.parse("2016/04/01")
#   birthday = Random.rand(from..to)
#   # teacher_id = n+1
#   Student.create!(name: name,
#                   email: email,
#                   password: password,
#                   password_confirmation: password,
#                   post_code: post_code,
#                   address: address,
#                   birthday: birthday,
#                   # teacher_id: teacher_id,
#                   # teacher: false
#                   )
# end

puts "students = #{Student.count}"