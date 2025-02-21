import tester.Tester;

class Book1 {
	String title;
	Author1 author;
	int price;
	Publisher publisher;

	// the constructor
	Book1(String title, Author1 author, int price, Publisher publisher) {
		this.title = title;
		this.author = author;
		this.price = price;
		this.publisher = publisher;
	}
}

// to represent a author of a book in a bookstore
class Author1 {
	String name;
	int yob;

	// the constructor
	Author1(String name, int yob) {
		this.name = name;
		this.yob = yob;
	}
}

class Publisher {
	String name;
	String country;
	int yearOpened;

	Publisher(String name, String country, int yearOpened) {
		this.name = name;
		this.country = country;
		this.yearOpened = yearOpened;
	}
}

class ExamplesBooks1 {
	ExamplesBooks1() {
	}

	Publisher newHouse = new Publisher("New House Publishing", "USA", 1992);
	Author1 pat = new Author1("Pat Conroy", 1948);
	Book1 beaches = new Book1("Beaches", this.pat, 20, newHouse);
}
