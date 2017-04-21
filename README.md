# README

#TITLE: Customised T-shirt application

# Live Demo:
[link for The T-shirt App]https://tshirt-app.herokuapp.com/

# Overview
"Customised T-shirt shop" is an e-commerce web application that offers customers the ability to purchase t-shirts with a custom print. Customer are able to select from a range of t-shirt colours and prints in any combination. Users can simply drag and drop and resize the print images on the t-shirt to preview the design. Customers are also able to create a secure account - this not only allows customers to maintain a history of their online purchases but to also upload their own prints to use.

## User profile summary
When customers create an online account - a personalised profile page is generated. The "Your Profile" page displays user's uploaded prints and history of all submitted customer orders.

## Features
* User and sessions functions
- User account creation and login and logout system
- User authentication and validation before proceeding to order
- Includes User profile summary  - 'Your Profile' page displays customer own created designs on t-shirt and order details and history.

* T-shirt design function
- Includes predesign images or user uploaded images
- Draggable and resizable feature to place design on t-shirt
- Homepage and predesign images drag and drop function is accessible for public. User click on the thumbnail image to place and resize on the t-shirt template.

* T-shirt colour option
- Click to select colour, with t-shirt colour updated with selected colour

* Image uploader - Cloudinary
- This function is executed through an AJAX request to Cloudinary
- User must create an account or sign in to access this function

* E-commerce functions
- Shopping cart and order functions built
- Cart featured on the navigation bar, with item quantities updated after each item is added to cart
- Update quantity, delete items in cart functions available
- Empty cart function built to allow for delete of entire shopping cart

* Stripe payment gateway
- Integration of Stripe credit card payment system once delivery details are supplied

## Specifications
* Ruby version 5.0.2
- ruby 2.4.0p0 (2016-12-24 revision 57164)
* Use of Ruby on Rails
* Include separate HTML / CSS / JavaScript / Rails files
* Use of Semantic UI for styling
* Use of Stripe payment gateway for eCommerce functionalities
* Use of Font Awesome for icons
* Database creation
- Database created through PostgreSQL with 6 data models

* System dependencies

* Configuration
- Heroku web server

* Database creation
- PostgreSQL

* Database initialization
- Run seed file at initial launch of project

* How to run the test suite
- Use of default testing credit card details to test in development
- Credit Card number - 4242 4242 4242 4242 / Expiry date - any date in the future / CCV - any 3 digits

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
