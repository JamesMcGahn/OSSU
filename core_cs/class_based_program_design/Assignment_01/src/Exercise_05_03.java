import tester.*;

/*
 * Exercises
Exercise 5.3 Consider a revision of the problem in exercise 3.1:
. . . Develop a program that assists real estate agents. The program deals with listings of available houses. . . . . . .
Make examples of listings. Develop a data definition for listings of houses.
Implement the definition with classes. Translate the examples into objects.

 */

class Property1 {
	String kind;
	int numRooms;
	Address1 address;
	int askingPrice;

	Property1(String kind, int numRooms, Address1 address, int askingPrice) {
		this.kind = kind;
		this.numRooms = numRooms;
		this.address = address;
		this.askingPrice = askingPrice;
	}

}

class Address1 {
	String streetName;
	int streetNum;
	String city;

	Address1(int streetNum, String streetName, String city) {
		this.streetNum = streetNum;
		this.streetName = streetName;
		this.city = city;
	}

}

interface Listing {
}

class Empty implements Listing {
	Empty() {
	}

}

class ConsListing implements Listing {
	Property1 first;
	Listing rest;

	ConsListing(Property1 first, Listing rest) {
		this.first = first;
		this.rest = rest;
	}

}

class ExamplesListings {

	ExamplesListings() {
	}

	Address1 maple = new Address1(23, "Maple Street", "Brookline");
	Address1 joye = new Address1(5, "Joye Road", "Newton");
	Address1 winslow = new Address1(83, "Winslow Road", "Waltham");

	Property1 maple_prop = new Property1("Ranch", 7, this.maple, 375000);
	Property1 joye_prop = new Property1("Colonial", 9, this.joye, 450000);
	Property1 winslow_prop = new Property1("Cape", 6, this.winslow, 235000);

	Listing empty = new Empty();
	Listing list1 = new ConsListing(this.maple_prop, this.empty);
	Listing list2 = new ConsListing(this.joye_prop, list1);
	Listing list3 = new ConsListing(this.winslow_prop, list2);

}
