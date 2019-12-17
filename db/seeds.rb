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

Category.create(name: "Coffee")
Category.create(name: "Buffet")
Category.create(name: "Luxurious")
Category.create(name: "Snacks")
Category.create(name: "Bar/Pub")

admin = Admin.new
admin.email = "admin@admin.com"
admin.password = '123456'
admin.password_confirmation = "123456"
admin.save!

res1 = Category.find(rand(1..5)).restaurants.build(name: "Giảng Cafe - Cafe Trứng Sữa",
  address: "Ngõ 39 Nguyễn Hữu Huân, Quận Hoàn Kiếm, Hà Nội", phone: "0912345678",
  deadline: Time.now + rand(4).months,
  description: "Quán có mặt tiền và lối vào khá nhỏ trên đường Nguyễn_Hữu_Huân. Nhưng bên trong quán có không gian thoáng lắm, có 2 tầng. Vị cà phê thơm, vị bé vừa phải. Có trứng nhưng không hề có mùi tanh, mà uống vào tất cả hòa quyện, cảm giác khó diễn tả lắm. Điểm 10 cho chất lượng")
res1.save!
res1.res_images.create(remote_image_url: "https://images.foody.vn/res/g1/9247/prof/s576x330/foody-mobile-45564654-jpg-313-636127521466786573.jpg")
10.times do |v|
  user = User.find(rand(2..20))

  comment = user.comments.build
  comment.content = "Đồ rất ngon, nhân viên phục vụ rất nhiệt tình. 10 điểm!"
  comment.restaurant = res1
  comment.save!

  vote = user.votes.build
  vote.star_num = rand(1..5)
  vote.restaurant = res1
  vote.save!
end
vote_num = res1.votes.average(:star_num).to_f
res1.update_attribute(:vote_num, vote_num)

res2 = Category.find(rand(1..5)).restaurants.build(name: "Phố Ngon 37 - Indochina Plaza",
  address: "Tầng 5, IPH, 239 Xuân Thủy, Quận Cầu Giấy, Hà Nội", phone: "0912345678",
  deadline: Time.now + rand(4).months,
  description: "Hôm nay mùng 1 . Đại gia đình nhà mình có tìm đến phố ngon 37 để dùng bữa. Phải nói món ăn ở đây ngon. Nv phục vụ rất nhiệt tình. Món ăn rất phong phú. Mình nghe nói nhà hàng sắp ra nhiều món mới nữa. Lên mình và gia đình mình ăn mãi mà không sợ ngán rồi. Phải nói là điểm mười cho chất lượng.!")
res2.save!
res2.res_images.create(remote_image_url: "https://images.foody.vn/res/g1/6959/s180x180/foody-pho-ngon-37-37th-street-993-637100333649281851.jpg")
10.times do |v|
  user = User.find(rand(2..20))

  comment = user.comments.build
  comment.content = "Đồ rất ngon, nhân viên phục vụ rất nhiệt tình. 10 điểm!"
  comment.restaurant = res2
  comment.save!

  vote = user.votes.build
  vote.star_num = rand(1..5)
  vote.restaurant = res2
  vote.save!
end
vote_num = res2.votes.average(:star_num).to_f
res2.update_attribute(:vote_num, vote_num)

res3 = Category.find(rand(1..5)).restaurants.build(name: "Eatwell - Healthy Food",
  address: "1 Ngách 5 Ngõ 20 Nguyễn Chánh,  Quận Cầu Giấy, Hà Nội", phone: "0912345678",
  deadline: Time.now + rand(4).months,
  description: "Hôm nay mùng 1 . Đại gia đình nhà mình có tìm đến phố ngon 37 để dùng bữa. Phải nói món ăn ở đây ngon. Nv phục vụ rất nhiệt tình. Món ăn rất phong phú. Mình nghe nói nhà hàng sắp ra nhiều món mới nữa. Lên mình và gia đình mình ăn mãi mà không sợ ngán rồi. Phải nói là điểm mười cho chất lượng.!")
res3.save!
res3.res_images.create(remote_image_url: "https://images.foody.vn/res/g70/692705/prof/s576x330/foody-mobile-linh-jpg.jpg")
10.times do |v|
  user = User.find(rand(2..20))

  comment = user.comments.build
  comment.content = "Đồ rất ngon, nhân viên phục vụ rất nhiệt tình. 10 điểm!"
  comment.restaurant = res3
  comment.save!

  vote = user.votes.build
  vote.star_num = rand(1..5)
  vote.restaurant = res3
  vote.save!
end
vote_num = res3.votes.average(:star_num).to_f
res3.update_attribute(:vote_num, vote_num)

res4 = Category.find(rand(1..5)).restaurants.build(name: "Cơm Sườn 44 - Sài Đồng",
  address: "44 Ngõ 42 Sài Đồng, Quận Long Biên, Hà Nội", phone: "0912345678",
  deadline: Time.now + rand(4).months,
  description: "Hôm nay mùng 1 . Đại gia đình nhà mình có tìm đến phố ngon 37 để dùng bữa. Phải nói món ăn ở đây ngon. Nv phục vụ rất nhiệt tình. Món ăn rất phong phú. Mình nghe nói nhà hàng sắp ra nhiều món mới nữa. Lên mình và gia đình mình ăn mãi mà không sợ ngán rồi. Phải nói là điểm mười cho chất lượng.!")
res4.save!
res4.res_images.create(remote_image_url: "https://images.foody.vn/res/g24/239924/prof/s576x330/foody-upload-api-foody-mobile-com-suon-44-jpg-181228161338.jpg")
10.times do |v|
  user = User.find(rand(2..20))

  comment = user.comments.build
  comment.content = "Đồ rất ngon, nhân viên phục vụ rất nhiệt tình. 10 điểm!"
  comment.restaurant = res4
  comment.save!

  vote = user.votes.build
  vote.star_num = rand(1..5)
  vote.restaurant = res4
  vote.save!
end
vote_num = res4.votes.average(:star_num).to_f
res4.update_attribute(:vote_num, vote_num)

res5 = Category.find(rand(1..5)).restaurants.build(name: "Kem Hokkaido",
  address: "38C Hai Bà Trưng,  Quận Hoàn Kiếm, Hà Nội", phone: "0912345678",
  deadline: Time.now + rand(4).months,
  description: "Quán kem nhật bản mà mình rất thích đây nè. Trời sang đông rồi, mặc dù bị ho nhưng vẫn thích đi ăn kem. Mê nhất là vị matcha, vị thơm dịu mùi trà xanh, béo béo ngậy ngậy, mà kem mịn màng ăn thích ghê luôn ấy. Không gian quán đẹp, sạch sẽ, decor đơn giản ấm áp. Các bạn nhân viên tư vấn khá nhiệt tình, dễ thương và lễ phép, làm kem cũng nhanh và chuyên nghiệp lắm đó")
res5.save!
res5.res_images.create(remote_image_url: "https://images.foody.vn/res/g75/740456/prof/s576x330/foody-upload-api-foody-mobile-japon-jpg-180511183741.jpg")
10.times do |v|
  user = User.find(rand(2..20))

  comment = user.comments.build
  comment.content = "Đồ rất ngon, nhân viên phục vụ rất nhiệt tình. 10 điểm!"
  comment.restaurant = res5
  comment.save!

  vote = user.votes.build
  vote.star_num = rand(1..5)
  vote.restaurant = res5
  vote.save!
end
vote_num = res5.votes.average(:star_num).to_f
res5.update_attribute(:vote_num, vote_num)

res6 = Category.find(rand(1..5)).restaurants.build(name: "Buffet Poseidon - Seafood Bbq",
  address: "Hồ Gươm Plaza, 102 Trần Phú,  Quận Hà Đông, Hà Nội", phone: "0912345678",
  deadline: Time.now + rand(4).months,
  description: "Tuy lúc đầu mình đến tìm chỗ đỗ xe hơi khó vì là cuối tuần nên đông khách.
Ở đây có rất rất rất nhiều đồ ăn. Từ món khai vị, món chính đến tráng miệng. Lựa chọn thoải mái. Nhìn món nào cũng hấp dẫn. Tuy nhiên hãy ăn uống có ý thức hơn, tránh để đồ ăn thừa trên bàn nhiều.Nhân viên phục vụ rất tốt. Liên tục đến dọn bàn nên cảm thấy rất sạch sẽ.")
res6.save!
res6.res_images.create(remote_image_url: "https://images.foody.vn/res/g95/946532/prof/s576x330/foody-upload-api-foody-mobile-foody-upload-api-foo-191114092043.jpg")
10.times do |v|
  user = User.find(rand(2..20))

  comment = user.comments.build
  comment.content = "Đồ rất ngon, nhân viên phục vụ rất nhiệt tình. 10 điểm!"
  comment.restaurant = res6
  comment.save!

  vote = user.votes.build
  vote.star_num = rand(1..5)
  vote.restaurant = res6
  vote.save!
end
vote_num = res6.votes.average(:star_num).to_f
res6.update_attribute(:vote_num, vote_num)

res7 = Category.find(rand(1..5)).restaurants.build(name: "SugarKing - Đường Nâu Đài Loan",
  address: "4 Thượng Đình,  Quận Thanh Xuân, Hà Nội", phone: "0912345678",
  deadline: Time.now + rand(4).months,
  description: "Nhìn chung khá nhiều trân châu, tc dẻo ngon, quấy đều lên thì ăn vừa, không bị ngọt khé như những nơi khác. Trà sữa mình gọi 70 đường uống vừa miệng chứ không bị ngọt quá, có vị trà nhưng không nhiều.Tóm lại với mức giá đã giảm thì uống rất ổn, sẽ quay lại.")
res7.save!
res7.res_images.create(remote_image_url: "https://images.foody.vn/res/g91/902497/prof/s576x330/foody-upload-api-foody-mobile-sugar-190405160909.jpg")
10.times do |v|
  user = User.find(rand(2..20))

  comment = user.comments.build
  comment.content = "Đồ rất ngon, nhân viên phục vụ rất nhiệt tình. 10 điểm!"
  comment.restaurant = res7
  comment.save!

  vote = user.votes.build
  vote.star_num = rand(1..5)
  vote.restaurant = res7
  vote.save!
end
vote_num = res7.votes.average(:star_num).to_f
res7.update_attribute(:vote_num, vote_num)

res8 = Category.find(rand(1..5)).restaurants.build(name: "SugarKing - Đường Nâu Hàn Quốc",
  address: "4 Thượng Đình, Quận Đống Đa, Hà Nội", phone: "0912345678",
  deadline: Time.now + rand(4).months,
  description: "Nhìn chung khá nhiều trân châu, tc dẻo ngon, quấy đều lên thì ăn vừa, không bị ngọt khé như những nơi khác. Trà sữa mình gọi 70 đường uống vừa miệng chứ không bị ngọt quá, có vị trà nhưng không nhiều.Tóm lại với mức giá đã giảm thì uống rất ổn, sẽ quay lại.")
res8.save!
res8.res_images.create(remote_image_url: "https://images.foody.vn/res/g91/902497/prof/s576x330/foody-upload-api-foody-mobile-sugar-190405160909.jpg")
10.times do |v|
  user = User.find(rand(2..20))

  comment = user.comments.build
  comment.content = "Đồ rất ngon, nhân viên phục vụ rất nhiệt tình. 10 điểm!"
  comment.restaurant = res8
  comment.save!

  vote = user.votes.build
  vote.star_num = rand(1..5)
  vote.restaurant = res8
  vote.save!
end
vote_num = res8.votes.average(:star_num).to_f
res8.update_attribute(:vote_num, vote_num)

res9 = Category.find(rand(1..5)).restaurants.build(name: "Linh Chi Bánh Đa Trộn & Miến Trộn",
  address: "6 Ngõ 118 Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội", phone: "0912345678",
  deadline: Time.now + rand(4).months,
  description: "Mình gọi quán là bánh đa trộn THPT Cầu Giấy vì lí do rất đơn giản: nằm ngay đầu ngõ cách trường THPT Cầu Giấy không xa, và bởi thế nên có thể coi đây là tụ điểm của học sinh trường Cầu Giấy :)) Ăn sáng, ăn trưa lê la ngon - bổ - rẻ là những tiêu chí hấp dẫn đầu tiên.
Gọi là quán thì có phần không đúng, bởi thực chất chỉ là một gánh hàng vỉa hè - không biển hiệu không thực đơn, có thêm vài bàn ghế nhựa cho khách ngồi. Ấy vậy nhưng quán vẫn rất đông, tấp nập nườm nượp liên tục, đặc biệt trong khung giờ tan học buổi trưa thì đông không kịp ngơi tay. Bởi đông như vậy nên phát sinh ra một số hạn chế như để xe lộn xộn, không có chỗ ngồi (mình và đứa bạn đã phải đứng đợi, rình xem bàn nào ăn xong nhấc mông ra một cái là ngồi vào ngay không có mất chỗ :))), bị quên mất lượt phục vụ dù cô chú bán hàng luôn chân luôn tay.
Tất cả các suất ở đây, bao gồm Bánh đa trộn / Miến trộn / Bánh đa nước / Miến nước đều có chung mức giá rất hạt dẻ, phù hợp với đối tượng học sinh sinh viên: 20,000đ cho một bát đầy ụ. Đảm bảo ăn sẽ no")
res9.save!
res9.res_images.create(remote_image_url: "https://images.foody.vn/res/g21/203743/prof/s576x330/foody-mobile-banh-da-tron-jpg-629-636228432363298860.jpg")
10.times do |v|
  user = User.find(rand(2..20))

  comment = user.comments.build
  comment.content = "Đồ rất ngon, nhân viên phục vụ rất nhiệt tình. 10 điểm!"
  comment.restaurant = res9
  comment.save!

  vote = user.votes.build
  vote.star_num = rand(1..5)
  vote.restaurant = res9
  vote.save!
end
vote_num = res9.votes.average(:star_num).to_f
res9.update_attribute(:vote_num, vote_num)

res10 = Category.find(rand(1..5)).restaurants.build(name: "Gogi House - Nướng Hàn Quốc",
  address: "TTTM Aeon Mall Long Biên, 27 Cổ Linh, P. Long Biên,  Quận Long Biên,", phone: "0912345678",
  deadline: Time.now + rand(4).months,
  description: "Đồ ăn rất ngon, nv và quản lý rất nhiệt tình. Đặc biệt là các bạn bếp có tay nghề và mắt thẩm mỹ rất chuyên nghiệp. Hứa hẹn sẽ còn quay lại đây rất nhiệt tình để ủng hộ nhà hàng và trải nghiệm những phút giây thư giãn bên gia đình và người thân.
Đồ ăn rất ngon, nv và quản lý rất nhiệt tình. Đặc biệt là các bạn bếp có tay nghề và mắt thẩm mỹ rất chuyên nghiệp. Hứa hẹn sẽ còn quay lại đây rất nhiệt tình để ủng hộ nhà hàng và trải nghiệm những phút giây thư giãn bên gia đình và người thân")
res10.save!
res10.res_images.create(remote_image_url: "https://images.foody.vn/res/g89/884376/prof/s576x330/foody-upload-api-foody-mobile-1-190123103542.jpg")
10.times do |v|
  user = User.find(rand(2..20))

  comment = user.comments.build
  comment.content = "Đồ rất ngon, nhân viên phục vụ rất nhiệt tình. 10 điểm!"
  comment.restaurant = res10
  comment.save!

  vote = user.votes.build
  vote.star_num = rand(1..5)
  vote.restaurant = res10
  vote.save!
end
vote_num = res10.votes.average(:star_num).to_f
res10.update_attribute(:vote_num, vote_num)

res_all = Restaurant.all
res_all.each do |r|
  10.times do |f|
    food = r.foods.build
    food.name = "food" + f.to_s
    food.price = 15000
    food.remote_image_url = "https://images.foody.vn/res/g89/884376/prof/s576x330/foody-upload-api-foody-mobile-1-190123103542.jpg"
    food.save!
  end
end
