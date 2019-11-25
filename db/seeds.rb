# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
20.times do |u|
  user = User.new
  user.username = "User"+u.to_s
  user.email = "user"+u.to_s+"@user.com"
  user.password = '123456'
  user.password_confirmation = "123456"
  user.skip_confirmation!
  user.save!
end

20.times do |r|
  restaurant = Restaurant.new
  restaurant.name = "Restaurant " + r.to_s
  restaurant.address = "Thanh Xuan, Ha Noi"
  restaurant.phone = 1234567890
  restaurant.description = "description of restaurant " + r.to_s
  restaurant.deadline = Time.now + rand(4).months
  10.times do |v|
    vote = User.find(rand(1..20)).votes.build
    vote.star_num = rand(1..5)
    vote.restaurant = restaurant
    vote.save!
  end
  restaurant.vote_num = restaurant.votes.average(:star_num).to_f
  restaurant.save!
  10.times do |c|
    comment = restaurant.comments.build
    comment.content = "Comment " + c.to_s
    comment.user_id = rand(1..20)
    comment.save!
  end

  5.times do |r_i|
    res_images = restaurant.res_images.create(image: "https://images.foody.vn/res/g96/953948/prof/s640x400/foody-upload-api-foody-mobile-avar166-190906143554.jpg")
  end
end

admin = Admin.new
admin.email = "admin@admin.com"
admin.password = '123456'
admin.password_confirmation = "123456"
admin.save!
