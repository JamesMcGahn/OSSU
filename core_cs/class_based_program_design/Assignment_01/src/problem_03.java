/*

Problem 3: Traveling
We’ve been asked to help build a new medieval adventure game, Summer Is Coming. 
We’re trying to figure out the gameplay mechanics, so we’re starting with representations for travel around the game world. 
Players can live in three types of Housing: a Hut, an Inn, and a Castle.

A Hut has a capacity and the current count of its population. The population must be less than the capacity.

An Inn has a name, capacity and the current count of its population as well as the number of stalls in its stable. The population must be less than the capacity.

A Castle has a name, the family-name of the owners, the current count of its population as well as the number of carriages it can hold in its carriage-house.

There are 2 types of Transportation in this game:
Horse

Carriage

Each type of Transportation should have a from and a to Housing. Horses also have a name and a color (which you may represent using the color’s name). 
They can only go to an inn if there is room in the stables, but they can go to any hut or castle.

Carriages can only carry a limited supply of tonnage and only travel from Inns to Castles or vice versa. When they go to a Castle there must be room for them in the carriage house.

Define six examples of Housing, including:
hovel: Capacity 5, population 1

winterfell: Named "Winterfell", family name "Stark", population 500, can hold 6 carriages

crossroads: Named "Inn At The Crossroads", capacity 40, population 20, 12 stalls

The others can be whatever you wish.
Define four types of travel, two of each kind.

Name your examples horse1, carriage2, etc., and your examples class ExamplesTravel.


Please note: We’re placing a lot of restrictions on the data, such as the population being less than capacity, possible destinations of carriages, etc. 
However we aren’t (yet) actually enforcing these in the code. The ways to enforce these constraints will be further explored later in the semester. 
For now, you are expected to create examples that conform to these constraints



*/

interface Housing {

}

interface Transportation {

}

class Horse implements Transportation {
	Housing from;
	Housing to;
	String name;
	String color;

	Horse(Housing from, Housing to, String name, String color) {
		this.from = from;
		this.to = to;
		this.name = name;
		this.color = color;
	}
}

class Carriage implements Transportation {
	Housing from;
	Housing to;
	String name;
	int tonnage;

	Carriage(Housing from, Housing to, String name, int tonnage) {
		this.from = from;
		this.to = to;
		this.name = name;
		this.tonnage = tonnage;
	}
}

class Hut implements Housing {
	int population;
	int capacity;

	Hut(int capacity, int population) {
		this.population = population;
		this.capacity = capacity;

	}

}

class Inn implements Housing {
	String name;
	int population;
	int capacity;
	int stalls;

	Inn(String name, int capacity, int population, int stalls) {
		this.population = population;
		this.capacity = capacity;
		this.stalls = stalls;
		this.name = name;
	}

}

class Castle implements Housing {
	String castleName;
	String familyName;
	int population;
	int carriages;

	Castle(String castleName, String familyName, int population, int carriages) {
		this.population = population;
		this.carriages = carriages;
		this.castleName = castleName;
		this.familyName = familyName;
	}

}

class ExamplesTravel {

	ExamplesTravel() {
	}

	Housing hovel = new Hut(5, 1);
	Housing winterfell = new Castle("Winterfell", "Stark", 500, 6);
	Housing crossroads = new Inn("Inn At The Crossroads", 40, 20, 12);
	Housing hut2 = new Hut(6, 1);
	Housing hut3 = new Hut(6, 2);
	Housing bridgewater = new Inn("Inn At The BridgeWater", 60, 20, 12);

	Transportation horse1 = new Horse(this.hut2, this.hut3, "Ted", "white");
	Transportation carriage1 = new Carriage(this.winterfell, this.crossroads, "Borkey", 500);
	Transportation horse2 = new Horse(this.bridgewater, this.hovel, "Tom", "white");
	Transportation carriage2 = new Carriage(this.crossroads, this.winterfell, "Wheelie", 1000);

}
