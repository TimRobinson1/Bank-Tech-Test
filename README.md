Bank Tech Test
==============
The Bank Tech Test is designed to test an individual's Object Oriented Programming skills in a
Test Driven and Behaviour Driven Development environment.

The goal of the test is to create a simple program that can understand and track
simple transactions on an account or balance, using a REPL as the interface.

Quickstart guide
---------------
* Clone the repo to your local device, using ```git clone https://github.com/TimRobinson1/Bank-Tech-Test.git```
* Naviate into the repo using ```cd bank-tech-test```
* Install the gem dependencies by running ```bundle install```
* Run ```rspec``` and ```rubocop``` to ensure everything is working correctly.
* Start up your REPL of choice in the command line, such as ```irb``` or ```pry```.
* Be sure to require the account file using ```require './lib/account'```

Available commands
---------------
Assuming that you are in a REPL and have required the file, assign the class to a
variable for usage.  In this case, we will use ```account = Account.new```
* ```deposit(n)``` - This will deposit the specified funds into the account.
* ```withdraw(n)``` - This will withdraw the specified funds from the account.
* ```current_balance``` - Display's the user's current balance.
* ```bank_statement``` - This will print out the current statement in the REPL.


Example usage
-------------
![Pry Example](example_usage.png?raw=true "An Example using the REPL: Pry")


Technologies used
------------
I decided to use Ruby as my OOP language of choice for this tech test due to my familiarity
and knowledge of practicing TDD with Ruby. RSpec is used for testing, along with capybara
for feature tests.  Finally, I also decided to employ several Ruby gems to guide my
testing and production process, including Rubocop and SimpleCov.

Specified requirements
------------
* To make deposits, withdrawals and check the current balance.
* The balance should display all information, including the date, the amount, and the balance at that time.
* Ability to interact with the code via a REPL.

Development Process
-------------
I first approached the issue by planning out the classes and the interactions between them
that I'd need to get the program running properly.  Originally, I had decided on the classes: Account, Printer,
and Transaction.

After beginning to build the program, I extracted the Deposit and Withdrawal class from Transaction,
however this was later reverted as although it was an effective solution, my code was no longer
adhering to the DRY principles (Don't Repeat Yourself).

After reaching the stage that was originally in my head as 'completed', I realised that my Account class was working
to both make and record transactions, which didn't feel like appropriate encapsulation to me.  As such, it was
extracted so that the Account class only interacts with the TransactionLog class, and the responsibility
of recording new transactions was delegated appropriately.
