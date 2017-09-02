// Pull in required dependencies
var inquirer = require('inquirer');
var Table = require('cli-table');
var colors = require('colors/safe');
var mysql = require('mysql');

// Define the MySQL connection parameters
var connection = mysql.createConnection({
	host: 'localhost',
	port: 3306,

	// Your username
	user: 'root',

	// Your password
	password: 'Qcpmr_019$$$',
	database: 'bamazon'
});

// validateInput makes sure that the user is supplying only positive integers for their inputs
function validateInput(value) {
	var integer = Number.isInteger(parseFloat(value));
	var sign = Math.sign(value);

	if (integer && (sign === 1)) {
		return true;
	} else {
		return 'Please enter a whole non-zero number.';
	}
}

// promptUserPurchase will prompt the user for the item/quantity they would like to purchase
function promptUserPurchase() {
	// console.log('___ENTER promptUserPurchase___');

	// Prompt the user to select an item
	inquirer.prompt([
		{
			type: 'input',
			name: 'item_id',
			message: 'Please enter the Item ID which you would like to purchase.',
			validate: validateInput,
			filter: Number
		},
		{
			type: 'input',
			name: 'quantity',
			message: 'How many do you need?',
			validate: validateInput,
			filter: Number
		}
	]).then(function(input) {
		// console.log('Customer has selected: \n    item_id = '  + input.item_id + '\n    quantity = ' + input.quantity);

		var item = input.item_id;
		var quantity = input.quantity;

		// Query db to confirm that the given item ID exists in the desired quantity
		var queryStr = 'SELECT * FROM products WHERE ?';

		connection.query(queryStr, {item_id: item}, function(err, result) {
			if (err) throw err;

			// If the user has selected an invalid item ID, result attay will be empty
			// console.log('result = ' + JSON.stringify(result));

			if (result.length === 0) {
				console.log('ERROR: Invalid Item ID. Please select a valid Item ID.');
				displayInventory();

			} else {
				var productresult = result[0];

				// console.log('productresult = ' + JSON.stringify(productresult));
				// console.log('productresult.stock_quantity = ' + productresult.stock_quantity);

				// If the quantity requested by the user is in stock
				if (quantity <= productresult.stock_quantity) {
					console.log('Congratulations, the product you requested is in stock! Placing order!');

					// Construct the updating query string
					var updateQueryStr = 'UPDATE products SET stock_quantity = ' + (productresult.stock_quantity - quantity) + ' WHERE item_id = ' + item;
					// console.log('updateQueryStr = ' + updateQueryStr);

					// Update the inventory
					connection.query(updateQueryStr, function(err, result) {
						if (err) throw err;

						console.log('Your oder has been placed! Your total is $' + productresult.price * quantity);
						console.log('Thank you for shopping with us!');
						console.log("\n---------------------------------------------------------------------\n");

						// End the resultbase connection
						connection.end();
					})
				} else {
					console.log('Sorry, there is not enough product in stock, your order can not be placed as is.');
					console.log('Please modify your order.');
					console.log("\n---------------------------------------------------------------------\n");

					displayInventory();
				}
			}
		})
	})
}

// displayInventory will retrieve the current inventory from the resultbase and output it to the console
function displayInventory() {
	// console.log('___ENTER displayInventory___');

	// Construct the db query string
	queryStr = 'SELECT * FROM products';

	// Make the db query
	connection.query(queryStr, function(err, result) {
		if (err) throw err;

		console.log('Existing Inventory: ');
		console.log('...................\n');

	    //creates a table for the information from the mysql resultbase to be placed
	    var table = new Table({
	        head: ['Item ID#', 'Product Name', 'Department Name', 'Price', 'Stock Qty'],
	        style: {
	            head: ['blue'],
	            compact: false,
	            colAligns: ['center'],
	        }
	    });
	    //loops through each item in the mysql resultbase and pushes that information into a new row in the table
	    for(var i = 0; i < result.length; i++){
	        table.push(
	            [result[i].item_id, result[i].product_name, result[i].department_name, result[i].price, result[i].stock_quantity]
	        );
	    }
	    console.log(table.toString());
	    
	  	console.log("---------------------------------------------------------------------\n");

	  	//Prompt the user for item/quantity they would like to purchase
	  	promptUserPurchase();
	})
}

// runBamazon will execute the main application logic
function runBamazon() {
	// console.log('___ENTER runBamazon___');

	// Display the available inventory
	displayInventory();
}

// Run the application logic
runBamazon();
