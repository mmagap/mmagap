# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vids = %w[http://www.youtube.com/watch?v=aMtQjnsoD8c http://www.youtube.com/watch?v=DKUkC4Gj0zU http://www.youtube.com/watch?v=d6Vqp6UveIU]
tags = %w[rugby workout gym beverage random computer]
(1..10).each do |i|
  v = Video.create(title: "My video #{i}",
                    video_link: vids.sample,
                    user_id: User.first.id,
                    category: Video::CATEGORIES.sample)
  v.update_attribute(:created_at, (DateTime.now - rand(45).days))
end

User.all.each do |user|
  user.student_teacher_profile = StudentTeacherProfile.find_or_create_by_user_id for_teaching_amount: '', on_leant_amount: '', to_learn: '', to_teach: '', user_id: user.id
end
