/*
Exercises
Exercise 10.5 Modify the Coffee class from figure 38 so that cost takes into
account bulk discounts:
. . . Develop a program that computes the cost of selling bulk
coffee at a specialty coffee seller from a receipt that includes
the kind of coffee, the unit price, and the total amount (weight)
sold. If the sale is for less than 5,000 pounds, there is no discount. For sales of 5,000 pounds to 20,000 pounds, the seller
grants a discount of 10%. For sales of 20,000 pounds or more,
the discount is 25%. . . .
Don’t forget to adapt the examples, too.
*/

import tester.Tester;

class Coffee {
	String kind;
	int price;
	int weight;

	Coffee(String kind, int price, int weight) {
		this.kind = kind;
		this.price = price;
		this.weight = weight;

	}

	double cost() {

		if (this.weight >= 20000) {

			return (this.price * this.weight) * .75;

		}
		else if (this.weight >= 5000) {
			return this.price * this.weight * .90;
		}
		else {

			return this.price * this.weight;
		}

	}

}


class ExamplesCoffee {
	
	ExamplesCoffee(){}
	
	
	Coffee starbucks = new Coffee("Pike Place", 10, 4999);
	Coffee foldgers = new Coffee("Colombia Roast", 10, 5000);
	Coffee mcdonalds = new Coffee("Black Coffee", 10, 20000);
	
	
	
	boolean testCost(Tester t) {
		return
		t.checkInexact(this.starbucks.cost(), 49990.0, .01 )&&
		t.checkInexact(this.foldgers.cost(), 45000.0, .01)&&
		t.checkInexact(this.mcdonalds.cost(), 150000.0, .01);
		
	}
	
	
}