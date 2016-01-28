# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

10.times do
	u = User.create!(
		gt_id: Faker::Internet.user_name,
		email: Faker::Internet.free_email,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name
		)
	addr = [Faker::Address.street_address,Faker::Address.city,Faker::Address.state,Faker::Address.zip].join("")
	p = Payment.create!(
		user: u,
		card_last_four_digit: [Faker::Number.digit,Faker::Number.digit, Faker::Number.digit,Faker::Number.digit].join(""),
		billing_address:addr
		)

	UserProfile.create!(
		address: addr,
		password: Faker::Internet.password,
		profile_img_url: Faker::Avatar.image,
		payment: p,
		user: u
		)


end
users = User.all

100.times do
	Product.create!(
		name: Faker::Commerce.product_name,
		product_img: Faker::Avatar.image,
		price: Faker::Commerce.price
		)
end
products = Product.all

50.times do
	re = users.sample
	he = users.sample
	sl = Shoplist.create!(
		requester: re,
		helper: he,
		supermarket: Faker::App.name,
		expire_time: Faker::Time.between(DateTime.now - 30, DateTime.now),
		total_price: Faker::Number.decimal(2),
		actual_price: Faker::Number.decimal(2),
		status: "Complete"
		)
	5.times do
		ProductItem.create!(
			product: products.sample,
			quantity: 1,
			is_bought: true,
			shoplist: sl
			)
	end

	PaymentTransaction.create!(
		requester: re,
		helper: he,
		payment_time: Faker::Time.between(DateTime.now - 30, DateTime.now),
		amount: Faker::Commerce.price,
		payment_method: re.user_profile.payment,
		transaction_id: Faker::Number.number(4)
		)
end

puts "Seed finished"