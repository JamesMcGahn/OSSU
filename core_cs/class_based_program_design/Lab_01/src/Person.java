import tester.*;
/*

Problem 1 - Simple Data Definitions

Here is a data definition in DrRacket:

;; to represent a person
;; A Person is (make-person String Number String)
(define-struct person [name age gender])
 
(define tim (make-person "Tim" 23 "Male"))
(define kate (make-person "Kate" 22 "Female"))
(define rebecca (make-person "Rebecca" 31 "Non-binary"))
Draw the class diagram that represents this data.

Define the class Person that implements this data definition and the class ExamplesPerson that contains the examples defined above. You should do this in a new Person.java file. Right click the default package under Lab1 and select New > File. Name it Person.java.

Run your program to make sure it works.

*/

/*
Problem 2 Data Definitions with Containment


Modify your data definitions so that for each person we also record the person’s address. For each person’s address we only record the city and the state; each of these should be its own field. Create an Address class to contain the address information, then modify the Person data definition to include an Address.

Draw the class diagram for this data definition

Define Java classes that represent this data definition.

Tim lives in Boston, MA, Kate lives in Warwick, RI, and Rebecca lives in Nashua, NH.

Make examples of these data and add two more people.
*/

class Person {
	String name;
	int age;
	String gender;
	Address address;  

	Person(String name, int age, String gender, Address address) {
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
	};
}

class Address {
	String city;
	String State;

	Address(String city, String state) {
		this.city = city;
		this.State = state;
	}

}

class ExamplesPerson {
	ExamplesPerson() {
	}
	
	Address timsAddress = new Address( "Boston",  "MA");
	Address kateAddress = new Address("Warwick", "RI");
	Address rebeccaAddress = new Address("Nashua", "NH");
	
	Person tim = new Person("Tim", 23, "Male", timsAddress);
	Person kate = new Person("Kate", 22, "Female",kateAddress);
	Person rebecca = new Person("Rebecca", 31, "Non-binary", rebeccaAddress);
}