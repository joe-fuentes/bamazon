# Bamazon with Node.js & MySQL

## Overview

An Amazon-like storefront with MySQL. This app will take in orders from customers and deplete stock from the store's inventory. 

-- npm packages used are inquirer and MySQL for data input and storage.

Included in the images folder are a couple of screenshots to demonstrate that this application works as prescribed herein. This first screenshot shows the inventory table before a purchase has been made:

...\Bamazon\images\inventory(1) before purchase

Then, after a purchase is made, I created the bamazonInventory.js to display the inventory table only, without having to do anything:

...\Bamazon\images\inventory(2) after purchase

## Instructions

### Challenge #1: Customer View (Minimum Requirement)

1. A MySQL Database was created called `bamazon`.

2. Then a Table inside of that database was created called `products`.

3. The products table has each of the following columns:

   * item_id (unique id for each product)

   * product_name (Name of product)

   * department_name

   * price (cost to customer)

   * stock_quantity (how much of the product is available in stores)

4. This database was populated with 10 different products.

5. A Node application was created called `bamazonCustomer.js`. Running this application will first display all of the items available for sale. Include the ids, names, and prices of products for sale.

6. The app then prompts users with two messages.

   * The first asks for the ID of the product they would like to buy.
   * The second message asks how many units of the product they would like to buy.

7. Once the customer has placed the order, the application will check if the store has enough of the product to meet the customer's request.

   * If not, the app will log the phrase `Insufficient quantity!`, and then prevent the order from going through.

8. When the store has enough of the product, it will fulfill the customer's order.
   * This means updating the SQL database to reflect the remaining quantity.
   * Once the update goes through, it will show the customer the total cost of their purchase.

- - -
