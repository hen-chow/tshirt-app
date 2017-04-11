# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Begin processing seed file"

User.destroy_all
Product.destroy_all
Design.destroy_all
Order.destroy_all
LineItem.destroy_all
Cart.destroy_all

user_1 = User.create(name:'Jin', email:'jin@wdi.com', password:'pass000')
user_2 = User.create(name:'Diego', email:'diego@wdi.com', password:'pass000')
user_3 = User.create(name:'Peach', email:'peach@wdi.com', password:'pass000')
user_4 = User.create(name:'Jared', email:'jared@wdi.com', password:'pass000')
user_5 = User.create(name:'Hen', email:'hen@wdi.com', password:'pass000')

product_1 = Product.create(colour:'white', size:'S', price:20.99, stock_level:50, img_src:'/assets/tshirt_templ.png', thumbnail:'/assets/white_thumbnail.jpg')
product_2 = Product.create(colour:'white', size:'M', price:22.99, stock_level:50, img_src:'/assets/tshirt_templ.png', thumbnail:'/assets/white_thumbnail.jpg')
product_3 = Product.create(colour:'white', size:'L', price:20.99, stock_level:50, img_src:'/assets/tshirt_templ.png', thumbnail:'/assets/white_thumbnail.jpg')
product_4 = Product.create(colour:'blue', size:'S', price:20.99, stock_level:50, img_src:'/assets/blue.png', thumbnail:'/assets/blue_thumbnail.jpg')
product_5 = Product.create(colour:'blue', size:'M', price:22.99, stock_level:50, img_src:'/assets/blue.png', thumbnail:'/assets/blue_thumbnail.jpg')
product_6 = Product.create(colour:'blue', size:'L', price:20.99, stock_level:50, img_src:'/assets/blue.png', thumbnail:'/assets/blue_thumbnail.jpg')
product_7 = Product.create(colour:'red', size:'S', price:20.99, stock_level:50, img_src:'/assets/red.png', thumbnail:'/assets/red_thumbnail.jpg')
product_8 = Product.create(colour:'red', size:'M', price:22.99, stock_level:50, img_src:'/assets/red.png', thumbnail:'/assets/red_thumbnail.jpg')
product_9 = Product.create(colour:'red', size:'L', price:20.99, stock_level:50, img_src:'/assets/red.png', thumbnail:'/assets/red_thumbnail.jpg')
product_10 = Product.create(colour:'yellow', size:'S', price:20.99, stock_level:50, img_src:'/assets/yellow.png', thumbnail:'/assets/yellow_thumbnail.jpg')
product_11 = Product.create(colour:'yellow', size:'M', price:22.99, stock_level:50, img_src:'/assets/yellow.png', thumbnail:'/assets/yellow_thumbnail.jpg')
product_12 = Product.create(colour:'yellow', size:'L', price:20.99, stock_level:50, img_src:'/assets/yellow.png', thumbnail:'/assets/yellow_thumbnail.jpg')

design_1 = Design.create(name:'des1', colour:'bw', length:'300', width:'300', img_src:'/assets/des1.png', predesign:'true', user_id:user_1.id)
design_2 = Design.create(name:'des2', colour:'bw', length:'300', width:'300', img_src:'/assets/des2.png', predesign:'true', user_id:user_2.id)
design_3 = Design.create(name:'des3', colour:'fullcolour', length:'300', width:'300', img_src:'/assets/des3.png', predesign:'true', user_id:user_3.id)
design_4 = Design.create(name:'des4', colour:'bw', length:'300', width:'300', img_src:'/assets/des4.png', predesign:'false', user_id:user_4.id)
design_5 = Design.create(name:'des5', colour:'fullcolour', length:'300', width:'300', img_src: '/assets/des5.png', predesign:'false', user_id:user_5.id)

order_1 = Order.create(user_id:user_1.id, delivery_cost:10, delivery_address: 'George Street Sydney')
order_2 = Order.create(user_id:user_2.id, delivery_cost:5, delivery_address: 'Phillip Street Sydney')
order_3 = Order.create(user_id:user_3.id, delivery_cost:10, delivery_address: 'George Street Sydney')
order_4 = Order.create(user_id:user_4.id, delivery_cost:10, delivery_address: 'Market Street Sydney')
order_5 = Order.create(user_id:user_5.id, delivery_cost:10, delivery_address: 'Pitt Street Sydney')

cart_1 = Cart.create(user_id:user_1.id)
cart_2 = Cart.create(user_id:user_2.id)
cart_3 = Cart.create(user_id:user_3.id)
cart_4 = Cart.create(user_id:user_4.id)
cart_5 = Cart.create(user_id:user_5.id)


lineItem_1 = LineItem.create(product_id:product_1.id, design_id:design_1.id, qty:3, order_id:order_1.id, cart_id: cart_1.id )
lineItem_2 = LineItem.create(product_id:product_2.id, design_id:design_2.id, qty:1, order_id:order_2.id, cart_id: cart_2.id)
lineItem_3 = LineItem.create(product_id:product_3.id, design_id:design_3.id, qty:3, order_id:order_3.id, cart_id: cart_3.id)
lineItem_4 = LineItem.create(product_id:product_4.id, design_id:design_4.id, qty:3, order_id:order_4.id, cart_id: cart_4.id)
lineItem_5 = LineItem.create(product_id:product_5.id, design_id:design_5.id, qty:1, order_id:order_5.id, cart_id: cart_5.id)


puts "Seed file now completed"
