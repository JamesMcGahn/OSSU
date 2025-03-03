
import tester.*;
/*
  
Problem 3 - Data Definitions for Unions of Data

A deli menu includes soups, salads, and sandwiches. Every item has a name and a price (in cents - so we have whole numbers only).

For each soup and salad we note whether it is vegetarian or not.

Salads also specify the name of any dressing being used.

For a sandwich we note the kind of bread, and two fillings (e.g peanut butter and jelly; or ham and cheese). Assume that every sandwich will have two fillings, and ignore extras (mayo, mustard, tomatoes, lettuce, etc.)

Define classes to represent each of these kinds of menu items. Think carefully about what type each field of each class should be. Do you need to define any interfaces? Construct at least two examples each of soups, salads, and sandwiches.


 */




interface DeliMenu {
}

class Soup implements DeliMenu {
	String name;
	int price;
	boolean isVegetarian;

	Soup(String name, int price, boolean isVegetarian) {
		this.name = name;
		this.price = price;
		this.isVegetarian = isVegetarian;
	}
}

class Salad implements DeliMenu {
	String name;
	int price;
	boolean isVegetarian;

	Salad(String name, int price, boolean isVegetarian) {
		this.name = name;
		this.price = price;
		this.isVegetarian = isVegetarian;
	}
}

class Sandwich implements DeliMenu {
	String name;
	int price;
	String fillingOne;
	String fillingTwo;

	Sandwich(String name, int price, String fillingOne, String fillingTwo) {
		this.name = name;
		this.price = price;
		this.fillingOne = fillingOne;
		this.fillingTwo = fillingTwo;

	}

}


class ExamplesDeliMenu {
	ExamplesDeliMenu(){}
	
	
	DeliMenu chickenSoup = new Soup("Chicken Noodle Soup", 6, false);
	DeliMenu tomatoSoup = new Soup("Tomato Soup", 4, true);
	
	DeliMenu caesarSalad = new Salad("Caesar Salad", 8, true);
	DeliMenu tacoSalad = new Salad("Taco Salad", 12, false);
	
	DeliMenu italianHero = new Sandwich("Italian Hero", 14, "Ham", "Salami");
	DeliMenu hamSandwich = new Sandwich("Ham Sandwich", 11, "Ham", "American Cheese");
	
	
	
}
