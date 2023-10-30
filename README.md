# README

# Cash Register Application

This is a Ruby-based cash register application designed to meet the needs of a simple point-of-sale system. It allows users to add products to a cart and compute the total price, taking into account various pricing rules.

# Features

- Browse a list of available products.
- Add products to the shopping cart.
- View the shopping cart to review added items and their prices.
- Adjust the quantity of products in the cart.
- Automatically calculate prices based on pricing rules.
- Total prices calculated for all cart items.
- Redirect between the product listing page and the shopping cart.

## Getting Started

### Prerequisites

The setups steps expect following tools installed on the system.

- Ruby 3.2.2
- Ruby on Rails 7.1.1
- MySQL 8

### Installation

A step-by-step guide on how to get the project up and running. 

##### 1. Check out the repository

```bash
git clone git@github.com:itimodi/cash-register.git
```

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
rails s
```

And now you can visit the site with the URL http://localhost:3000

### Usage

# Adding Products to the Cart

- Access the product listing page by opening the application in your web browser.

- Browse through the available products.

- To add a product to your shopping cart, click the "Add to Cart" button next to the product. You will be redirected to the product listing page.

- To check your cart, look for the "Total items in cart" message, which indicates the total number of items in your cart. Click on it to view your shopping cart.

# Managing the Shopping Cart

- In the shopping cart, you will see a list of added items and their quantities.

- To adjust the quantity of a product, you can:

- Click the "Add" button to increase the quantity by one.

- Click the "Reduce" button to decrease the quantity by one.

- As you add or reduce product quantities, the prices will be automatically updated based on the pricing rules.

- Click on the "Total items in cart" to go back to the product listing page.

### Acknowledgments

We would like to acknowledge the open-source community for providing invaluable resources and inspiration for our project.

### Contact

If you have any questions or need assistance, please contact at itimodi@gmail.com

Feel free to adapt and expand this template to provide as much detail as necessary for your project's README.