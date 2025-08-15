import tester.*;

// Represents a mode of transportation
interface IMOT {
	// returns true if this mode of transportation is at least
	// as efficient as the given mpg, false otherwise
	boolean isMoreFuelEfficientThan(int mpg);
	boolean motIsMoreFuelEfficientThan(IMOT mot);

}

// Represents a bicycle as a mode of transportation
class Bicycle implements IMOT {
	String brand;

	Bicycle(String brand) {
		this.brand = brand;
	}

	// a bicycle does not consume fuel, so it will always be more fuel efficient
	public boolean isMoreFuelEfficientThan(int mpg) {
		return true;
	}

	public boolean motIsMoreFuelEfficientThan(IMOT mot) {
		return true;
	}

}
// Represents a car as a mode of transportation
class Car implements IMOT {
	String make;
	int mpg; // represents the fuel efficiency in miles per gallon

	Car(String make, int mpg) {
		this.make = make;
		this.mpg = mpg;
	}

	// compare this car's fuel efficiency to the given fuel efficiency
	public boolean isMoreFuelEfficientThan(int mpg) {
		return this.mpg >= mpg;
	}
	
	public boolean motIsMoreFuelEfficientThan(IMOT mot) {
		return !mot.isMoreFuelEfficientThan(this.mpg);
	}
}

// Keeps track of how a person is transported
class Person {
	String name;
	IMOT mot;

	Person(String name, IMOT mot) {
		this.name = name;
		this.mot = mot;
	}

	public boolean motMeetsFuelEfficiency(int mpg) {
		return this.mot.isMoreFuelEfficientThan(mpg);
	}
	
	public boolean motIsMoreFuelEfficientThan(IMOT mot) {
		return this.mot.motIsMoreFuelEfficientThan(mot);
	}
}
//Then, our examples would become the following:

class ExamplesPerson {

	ExamplesPerson() {
	}

	IMOT diamondback = new Bicycle("Diamondback");
	IMOT toyota = new Car("Toyota", 30);
	IMOT lamborghini = new Car("Lamborghini", 17);

	Person bob = new Person("Bob", diamondback);
	Person ben = new Person("Ben", toyota);
	Person becca = new Person("Becca", lamborghini);

	boolean testMPG(Tester t) {
		return t.checkExpect(this.bob.motMeetsFuelEfficiency(25), true)
				&& t.checkExpect(this.ben.motMeetsFuelEfficiency(25), true)
				&& t.checkExpect(this.becca.motMeetsFuelEfficiency(25), false)
				&& t.checkExpect(this.bob.motMeetsFuelEfficiency(15), true)
				&& t.checkExpect(this.ben.motMeetsFuelEfficiency(15), true)
				&& t.checkExpect(this.becca.motMeetsFuelEfficiency(15), true)
		;
	}
	
	boolean testMoreEfficient(Tester t) {
		return t.checkExpect(this.bob.motIsMoreFuelEfficientThan(this.toyota), true) &&
				t.checkExpect(this.becca.motIsMoreFuelEfficientThan(this.diamondback), false) &&
				t.checkExpect(this.becca.motIsMoreFuelEfficientThan(this.toyota), false)&&
				t.checkExpect(this.ben.motIsMoreFuelEfficientThan(this.lamborghini), true) &&
				t.checkExpect(this.becca.motIsMoreFuelEfficientThan(this.lamborghini), false)
				;
		
		
		
	}

}
//Now that we have our data definitions and examples, let’s try to write a method. Consider the following purpose statement:

// Does this person's mode of transportation meet the given fuel
// efficiency target (in miles per gallon)?