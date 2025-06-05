import tester.*;

/*

Exercise 4.4 Design a data representation for this problem:
. . . Develop a “bank account” program. The program keeps
track of the balances in a person’s bank accounts. Each account
has an id number and a customer’s name. There are three kinds
of accounts: a checking account, a savings account, and a certificate of deposit (CD). 
Checking account information also includes the minimum balance. Savings account includes the interest rate. A CD specifies the interest rate and the maturity
date. Naturally, all three types come with a current balance. . . .


Represent the following examples using your classes:
1. Earl Gray, id# 1729, has $1,250 in a checking account with minimum
balance of $500;
2. Ima Flatt, id# 4104, has $10,123 in a certificate of deposit whose interest rate is 4% and whose maturity date is June 1, 2005;
3. Annie Proulx, id# 2992, has $800 in a savings account; the account
yields interest at the rate of 3.5%.

*/

interface Account {

}

class Checking implements Account {
	String name;
	int idNum;
	int balance;
	int minBalance;

	Checking(String name, int idNum, int balance, int minBalance) {
		this.name = name;
		this.idNum = idNum;
		this.balance = balance;
		this.minBalance = minBalance;
	}

}

class CD implements Account {
	String name;
	int idNum;
	double rate;
	String maturity;

	CD(String name, int idNum, double rate, String maturity) {
		this.name = name;
		this.idNum = idNum;
		this.rate = rate;
		this.maturity = maturity;
	}

}

class Savings implements Account {
	String name;
	int idNum;
	int balance;
	double interestRate;

	Savings(String name, int idNum,  int balance, double interestRate) {
		this.name = name;
		this.idNum = idNum;
		this.balance = balance;
		this.interestRate = interestRate;

	}

}

class ExamplesAccount {
	ExamplesAccount() {
	}

	Account earl = new Checking("Earl Gray", 1729, 1250, 500);
	Account ima = new CD("Ima Flatt", 10123, .04, "June 1, 2005");
	Account annie = new Savings("Annie Proulx", 2992, 800, .035 );

}
