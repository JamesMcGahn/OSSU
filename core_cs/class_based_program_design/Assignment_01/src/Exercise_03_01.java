/*
Exercise 3.1 Design a data representation for this problem:
. . . Develop a “real estate assistant” program. The “assistant” helps real estate agents locate available houses for clients.
The information about a house includes its kind, the number of
rooms, its address, and the asking price. An address consists of
a street number, a street name, and a city. . . .
Represent the following examples using your classes:
1. Ranch, 7 rooms, $375,000, 23 Maple Street, Brookline;
2. Colonial, 9 rooms, $450,000, 5 Joye Road, Newton; and
3. Cape, 6 rooms, $235,000, 83 Winslow Road, Waltham.




*/
import tester.*;
class Property {
	String kind;
	int numRooms;
	Address address;
	int askingPrice;

	Property(String kind, int rooms, Address address, int askingPrice) {
		this.kind = kind;
		this.numRooms = numRooms;
		this.address = address;
		this.askingPrice = askingPrice;
	}

}

class Address {
	String streetName;
	int streetNum;
	String city;

	Address(int streetNum, String streetName, String city) {
		this.streetNum = streetNum;
		this.streetName = streetName;
		this.city = city;
	}

}

class ExamplesProperty {
	ExamplesProperty() {
	}

	Address maple = new Address(23, "Maple Street", "Brookline");
	Address joye = new Address(5, "Joye Road", "Newton");
	Address winslow = new Address(83, "Winslow Road", "Waltham");

	Property maple_prop = new Property("Ranch", 7, this.maple, 375000);
	Property joye_prop = new Property("Colonial", 9, this.joye, 450000);
	Property winslow_prop = new Property("Cape", 6, this.winslow, 235000);

}