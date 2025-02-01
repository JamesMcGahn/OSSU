class Book {
  String title;
  Author author;
  int price;
  Publisher publisher;

  // the constructor
  Book(String title, Author author, int price, Publisher publisher) {
    this.title = title;
    this.author = author;
    this.price = price;
    this.publisher = publisher;
  }
}

// to represent a author of a book in a bookstore
class Author {
  String name;
  int yob;

  // the constructor
  Author(String name, int yob) {
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

// examples and tests for the class hierarchy that represents
// books and authors

public class ExerciseOne {
  public static void main(String[] args) {
    Publisher newHouse = new Publisher("New House Publishing", "USA", 1992);
    Author pat = new Author("Pat Conroy", 1948);
    Book beaches = new Book("Beaches", pat, 20, newHouse);
    System.out.println(newHouse.name);
    System.out.println(pat.name);
    System.out.println(beaches.title);
  }
}
