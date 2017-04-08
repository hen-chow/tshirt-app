# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Begin processing seed file"

User.create(name:'Jin', email:'jin@wdi.com', password:'pass123')
User.create(name:'Diego', email:'diego@wdi.com', password:'pass456')
User.create(name:'Peach', email:'peach@wdi.com', password:'pass000')
User.create(name:'Jared', email:'jared@wdi.com', password:'pass123')
User.create(name:'Hen', email:'hen@wdi.com', password:'pass000')

Product.create(colour:'white', size:'S', price:20.99, stock_level:50)
Product.create(colour:'white', size:'M', price:22.99, stock_level:50)
Product.create(colour:'white', size:'L', price:20.99, stock_level:50)
Product.create(colour:'blue', size:'S', price:20.99, stock_level:50)
Product.create(colour:'blue', size:'M', price:22.99, stock_level:50)
Product.create(colour:'blue', size:'L', price:20.99, stock_level:50)
Product.create(colour:'red', size:'S', price:20.99, stock_level:50)
Product.create(colour:'red', size:'M', price:22.99, stock_level:50)
Product.create(colour:'red', size:'L', price:20.99, stock_level:50)
Product.create(colour:'yellow', size:'S', price:20.99, stock_level:50)
Product.create(colour:'yellow', size:'M', price:22.99, stock_level:50)
Product.create(colour:'yellow', size:'L', price:20.99, stock_level:50)

Design.create(name:'des1', colour:'bw', length:'300', width:'300', img_src:'', predesign:'true', user_id:'1')
Design.create(name:'des2', colour:'bw', length:'300', width:'300', img_src:'', predesign:'true', user_id:'2')
Design.create(name:'des3', colour:'fullcolour', length:'300', width:'300', img_src:'', predesign:'true', user_id:'3')
Design.create(name:'des4', colour:'bw', length:'300', width:'300', img_src:'', predesign:'false', user_id:'4')
Design.create(name:'des5', colour:'fullcolour', length:'300', width:'300', img_src:'', predesign:'false', user_id:'5')

Order.create(user_id:'1', delivery_cost:10, delivery_address: 'George Street Sydney', cart_id:'1')
Order.create(user_id:'2', delivery_cost:5, delivery_address: 'Phillip Street Sydney', cart_id:'2')
Order.create(user_id:'3', delivery_cost:10, delivery_address: 'George Street Sydney', cart_id:'3')
Order.create(user_id:'4', delivery_cost:10, delivery_address: 'Market Street Sydney', cart_id:'4')
Order.create(user_id:'5', delivery_cost:10, delivery_address: 'Pitt Street Sydney', cart_id:'5')

LineItem.create(product_id:'1', design_id:'1', qty:3, cart_id:'1')
LineItem.create(product_id:'2', design_id:'2', qty:1, cart_id:'2')
LineItem.create(product_id:'3', design_id:'1', qty:3, cart_id:'3')
LineItem.create(product_id:'4', design_id:'3', qty:3, cart_id:'4')
LineItem.create(product_id:'5', design_id:'4', qty:1, cart_id:'5')


Cart.create(user_id:'1' order_id:'1')
Cart.create(user_id:'2' order_id:'2')
Cart.create(user_id:'3' order_id:'3')
Cart.create(user_id:'4' order_id:'4')
Cart.create(user_id:'5' order_id:'5')




puts "Seed file now completed"
