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

	up = UserProfile.create!(
		address: addr,
		password: Faker::Internet.password,
		profile_img_url: Faker::Avatar.image,
		user: u
		)

	p = Payment.create!(
		user_profile: up,
		card_last_four_digit: [Faker::Number.digit,Faker::Number.digit, Faker::Number.digit,Faker::Number.digit].join(""),
		billing_address:addr
		)
	
	up.payments << p
	#byebug
	u.user_profile = up
	u.save!

end
20.times do
	addr = [Faker::Address.street_address,Faker::Address.city,Faker::Address.state,Faker::Address.zip].join("")
	up = UserProfile.all.sample
	p = Payment.create!(
		user_profile: up,
		card_last_four_digit: [Faker::Number.digit,Faker::Number.digit, Faker::Number.digit,Faker::Number.digit].join(""),
		billing_address:addr
		)
	up.payments << p
end
users = User.all

3.times do
	ca = Category.create!(
		name: Faker::Book.genre
		)
end
topCat = Category.all

10.times do
	tc = topCat.sample
	ca = Category.create!(
		name: Faker::Book.genre
		)
	ca.supercategory = tc
	ca.save
	tc.subcategories << ca
end
secondCat = Category.all - topCat

50.times do
	sc = secondCat.sample
	ca = Category.create!(
		name: Faker::Book.genre,
		supercategory: sc
		)
	sc.subcategories << ca
end
thirdCat = Category.all - secondCat - topCat

10.times do
	br = Brand.create!(
		name: Faker::Company.name
		)
end
brands = Brand.all
100.times do
	br= brands.sample
	ct = thirdCat.sample
	p = Product.create!(
		name: Faker::Commerce.product_name,
		product_img: Faker::Avatar.image,
		price: Faker::Commerce.price,
		nutrition: Faker::Lorem.paragraph,
		brand: br,
		category: ct
		)
	br.products << p
	ct.products << p
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
		payment_method: re.user_profile.payments.sample,
		transaction_id: Faker::Number.number(4)
		)
end

10.times do
	sm = SuperMarket.create!(
		name: Faker::Company.name
		)
	ps = products.sample(50)
	sm.products = ps
	ps.each do |p|
		p.super_markets << sm
	end
end


users.each do |u|
	3.times do
		sl = Shoplist.create!(
			requester: u,
			supermarket: Faker::App.name,
			expire_time: Faker::Time.between(DateTime.now - 30, DateTime.now),
			total_price: Faker::Number.decimal(2),
			actual_price: 0,
			status: "not start"
			) 
		5.times do
			ProductItem.create!(
				product: products.sample,
				quantity: 1,
				is_bought: false,
				shoplist: sl
				)
		end
	end
end

puts "Seed finished"