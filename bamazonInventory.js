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
	})
}
displayInventory();
connection.end();