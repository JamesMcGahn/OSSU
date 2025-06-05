/*
Exercise 2.4 Translate the class diagram in figure 6 into a class definition.
Also create instances of the class.

Automobile
String model
int price [in dollars]
double mileage [in miles per gallon]
boolean used


*/
import tester.*;
class Automobile {
	String model;
	int price;
	double mileage;
	boolean used;

	Automobile(String model, int price, double mileage, boolean used) {
		this.model = model;
		this.price = price;
		this.mileage = mileage;
		this.used = used;
	}

}


class ExamplesAutomobile {
	
	ExamplesAutomobile(){}
	
	Automobile honda = new Automobile("Civic", 20000, 0.0, false);
	Automobile ford = new Automobile("F-150", 60000, 15000.23, true);
}