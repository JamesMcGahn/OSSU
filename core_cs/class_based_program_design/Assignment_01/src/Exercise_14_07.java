/*

Exercise 14.7 A software house that is working with a grocery chain receives this problem statement:

. . . Develop a program that keeps track of the items in the
grocery store. For now, assume that the store deals only with
ice cream, coffee, and juice. 

Each of the items is specified by
its brand name (String), weight (grams) and price (cents). 

Each
coffee is also labeled as either regular or decaffeinated. 

Juice
items come in different flavors, and can be packaged as frozen,
fresh, bottled, or canned. 

Each package of ice cream specifies its flavor. . . .



Design the following methods:
1. unitPrice, which computes the unit price (cents per gram) of a grocery
item;
2. lowerUnitPrice, which determines whether the unit price of a grocery
item is lower than some given amount;
3. cheaperThan, which determines whether a grocery item’s unit price is
less than some other (presumably) comparable item’s unit price.

*/

interface GroceryItems {

	double unitPrice();

	boolean lowerUnitPrice(int amount);

	boolean cheaperThan(GroceryItems item);

}

class IceCream implements GroceryItems {
	String name;
	int weight;
	int price;
	String flavor;

	IceCream(String name, int weight, int price, String flavor) {
		this.name = name;
		this.weight = weight;
		this.price = price;
		this.flavor = flavor;
	}

	@Override
	public double unitPrice() {
		return this.price / this.weight;
	}

	@Override
	public boolean lowerUnitPrice(int amount) {

		return this.unitPrice() < amount;
	}

	@Override
	public boolean cheaperThan(GroceryItems item) {
		return this.unitPrice() < item.unitPrice();
	}
}

class Coffees implements GroceryItems {
	String name;
	int weight;
	int price;
	boolean isCaffeniated;

	Coffees(String name, int weight, int price, boolean isCaffeniated) {
		this.name = name;
		this.weight = weight;
		this.price = price;
		this.isCaffeniated = isCaffeniated;
	}

	@Override
	public double unitPrice() {
		return this.price / this.weight;
	}

	@Override
	public boolean lowerUnitPrice(int amount) {
		return this.unitPrice() < amount;

	}

	@Override
	public boolean cheaperThan(GroceryItems item) {
		return this.unitPrice() < item.unitPrice();
	}
}

class Juice implements GroceryItems {
	String name;
	int weight;
	int price;
	String flavor;

	Juice(String name, int weight, int price, String flavor) {
		this.name = name;
		this.weight = weight;
		this.price = price;
		this.flavor = flavor;
	}

	@Override
	public double unitPrice() {
		return this.price / this.weight;
	}

	@Override
	public boolean lowerUnitPrice(int amount) {
		return this.unitPrice() < amount;

	}

	@Override
	public boolean cheaperThan(GroceryItems item) {
		return this.unitPrice() < item.unitPrice();
	}

}
