import tester.*;
/*
 * Self-Referential Data The HtDP book includes the data definition for Ancestor
 * Trees:
 * 
 * ;; An Ancestor Tree (AT) is one of ;; -- 'unknown ;; -- (make-tree Person AT
 * AT)
 * 
 * ;; A Person is defined as above Convert this data definition into Java
 * classes and interfaces. What options do you have for how to translate this
 * into Java? Make examples of ancestor trees that in at least one branch cover
 * at least three generations.
 */

interface AT {
}

class Unknown implements AT {
	Unknown() {
	}
}

class Person2 implements AT {
	String name;
	int age;
	String gender;
	AT mom;
	AT dad;

	Person2(String name, int age, String gender, AT mom, AT dad) {
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.mom = mom;
		this.dad = dad;
	}

}

class ExamplesAncestorsData {

	ExamplesAncestorsData() {
	}

	AT unknown = new Unknown();

	AT person1 = new Person2("Bob", 89, "male", this.unknown, this.unknown);
  AT person2 = new Person2("Sally", 86, "female", this.unknown, this.unknown);
	AT person3 = new Person2("Ted", 88, "male", this.unknown, this.unknown);
  AT person4 = new Person2("Joan", 83, "female", this.unknown, this.unknown);
  
  AT person5 = new Person2("Mary", 60, "female", this.person1, this.person2);
  AT person6 = new Person2("Ted Jr.", 65, "male", this.person3, this.person4);
  
  
  AT person7 = new Person2("Suzy", 42, "female", this.person5, this.person6);
  AT person8 = new Person2("Ted I", 33, "male", this.person5, this.person6);
  AT person9 = new Person2("Christina", 39, "male", this.person5, this.person6);
  
  
}