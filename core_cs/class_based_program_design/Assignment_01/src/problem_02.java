import tester.*;

/*
Problem 2: Icecream
Here is a data definition in DrRacket:

;; An IceCream is one of:
;; -- EmptyServing
;; -- Scooped
 
;;An EmptyServing is a (make-empty-serving Boolean)
(define-struct empty-serving (cone))
 
;;A Scooped is a (make-scooped IceCream String)
(define-struct scooped (more flavor))
 
Draw the class diagram that represents this data definition. You may draw this as ASCII-art and include it in your submission, if you wish. Or you can just draw it on paper and not submit it. Regardless, we think it will help you in visualizing how the data is organized.

Convert this data definition into Java. Make sure you use the same names for data types and for the fields, as are used in the DrRacket data definitions, converted into Java style standards. Make sure that the constructor arguments are given in the same order as shown.

Create examples in a class ExamplesIceCream. Include in your examples the following two ice cream orders:

– a cup of ice cream with scoops of "mint chip", "coffee", "black raspberry", and "caramel swirl"

– a cone with scoops of "chocolate", "vanilla", and "strawberry"

Hint: This is similar to the Lecture 2 - 2.4 Self-referential unions: Ancestor trees. Essentially this will creating a list (i.e. your order will be a self-referential ice cream : ) ).

Make sure the two sample orders given above are named order1 and order2.

Note: the descriptions above are listed in the order that you would order this in real life. Think carefully how this should be represented as data.

*/

interface Icecream {
}

class EmptyServing implements Icecream {
	boolean cone;

	EmptyServing(boolean cone) {
		this.cone = cone;
	}
}

class Scooped implements Icecream {
	
	Icecream prevScoop;
	String flavor;

	Scooped( Icecream more ,String flavor) {
		this.flavor = flavor;
		this.prevScoop = more;
	}
}

class ExampleIceCream {

	ExampleIceCream() {

	}

	Icecream cone = new EmptyServing(true);
	Icecream cup = new EmptyServing(false);

	Icecream mint = new Scooped(this.cup,"mint chip");
	Icecream coffee = new Scooped( this.mint,"coffee");
	Icecream blackRas = new Scooped( this.coffee,"black raspberry");
	Icecream order1 = new Scooped( this.blackRas, "carmel swirl");
	

	Icecream chocolate = new Scooped(this.cone,"chocolate");
	Icecream vanilla = new Scooped( this.chocolate,"vanilla");
	Icecream order2 = new Scooped( this.vanilla,"strawberry");
	
	
}