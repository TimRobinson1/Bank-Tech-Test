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


Example Usage
-------------
![Pry Example](pry_example.png?raw=true "An Example using the REPL: Pry")


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

Example account display
------------
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
