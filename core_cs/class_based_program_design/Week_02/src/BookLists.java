import tester.*;

class Bookn {
	String name;
	String author;
	double price;
	int year;

	Bookn(String name, String author, double price, int year) {
		this.name = name;
		this.author = author;
		this.price = price;
		this.year = year;
	}

	double getPrice() {
		return this.price;
	}

	// to return the discounted price of this book given the discount rate
	double discount(int rate) {
		return this.price * (1 - rate / 100.0);
	}

	// to return a new book with the same author and name as this book,
	// but with price discounted at the given rate
	Bookn discountedBook(int rate) {
		return new Bookn(this.name, this.author, this.discount(rate), this.year);
	}

	double salePrice(int discount) {
		return this.discount(discount);
	}
}

/*
 * GOAL: Represent a bunch of books, and be able to compute - their total price
 * - how many books we have - all the books published before the given year - a
 * sorted list of books
 */

/*
 * A list of books is one of empty (cons book list-of-books)
 */

// DYNAMIC DISPATCH: deciding which method definition to invoke (in which class)
// based on the information available at runtime of the object that's invoking
// the method

interface ILoBook {
	// to compute the total price of all books in this list of books
	double totalPrice();

	// to count how many books are in this list of books
	int count();

	// to return a list of all the books in this list of books
	// published before the given year
	ILoBook allBooksBefore(int year);

	ILoBook allBooksTitleBefore(String title);

	// to construct a list of books that contains the same books as
	// this list of books, but sorted increasing by price
	boolean publishedBefore(int year);

	double salePrice(int discount);

	ILoBook sortByPrice();

	ILoBook insert(Bookn b);

	ILoBook insertTitle(Bookn b);

	ILoBook sortByTitle();

}

class MtLoBook implements ILoBook {
	MtLoBook() {
		// nothing to do!
	}

	public double totalPrice() {
		return 0;
	}

	public int count() {
		return 0;
	}

	public boolean publishedBefore(int year) {
		return false;
	}

	public ILoBook allBooksBefore(int year) {
		return this;
		// return new MtLoBook();
	}

	public ILoBook sortByPrice() {
		return this;
		// return new MtLoBook();
	}

	public ILoBook sortByTitle() {
		return this;
	}

	public ILoBook insert(Bookn b) {
		return new ConsLoBook(b, this);
	}

	public ILoBook insertTitle(Bookn b) {
		return new ConsLoBook(b, this);
	}

	public double salePrice(int discount) {
		return 0;
	}

	public ILoBook allBooksTitleBefore(String title) {
		return this;
	}

}

class ConsLoBook implements ILoBook {
	Bookn first;
	ILoBook rest;

	ConsLoBook(Bookn first, ILoBook rest) {
		this.first = first;
		this.rest = rest;
	}

	public double totalPrice() {
		/*
		 * Template: FIELDS: this.first -- Book this.rest -- ILoBook METHODS:
		 * this.totalPrice() -- double this.count() -- int this.allBooksBefore(int) --
		 * ILoBook this.sortByPrice() -- ILoBook METHODS OF FIELDS:
		 * this.first.getPrice() -- double **** this.first.discount(double) -- double
		 * this.first.discountedBook(double) -- Book this.rest.totalPrice() -- double
		 * ***** this.rest.count() -- int this.rest.allBooksBefore(int) -- ILoBook
		 * this.rest.sortByPrice() -- ILoBook
		 */
		return this.first.getPrice() + this.rest.totalPrice();
	}

	public int count() {
		return 1 + this.rest.count();
	}

	public boolean publishedBefore(int year) {
		return this.first.year < year;
	}

	public ILoBook allBooksBefore(int year) {
		if (this.publishedBefore(year)) {
			return new ConsLoBook(this.first, this.rest.allBooksBefore(year));
		}
		else {
			return this.rest.allBooksBefore(year);
		}
	}

	public ILoBook sortByPrice() {
		/*
		 * Assuming we have: ILoBook insert(Book) -- on cons? on ilobook? boolean
		 * isCheaper(Book) -- on Book
		 */

		return this.rest.sortByPrice().insert(this.first);
	}

	public ILoBook sortByTitle() {
		/*
		 * Assuming we have: ILoBook insert(Book) -- on cons? on ilobook? boolean
		 * isCheaper(Book) -- on Book
		 */

		return this.rest.sortByTitle().insertTitle(this.first);
	}

	// to insert the given book into this sorted list of books
	public ILoBook insert(Bookn b) {
		if (b.getPrice() < this.first.getPrice()) {
			return new ConsLoBook(b, this);
		}
		else {
			return new ConsLoBook(this.first, this.rest.insert(b));
		}
	}

	public ILoBook insertTitle(Bookn b) {
		if (b.name.compareTo(this.first.name) < 0) {
			return new ConsLoBook(b, this);
		}
		else {
			return new ConsLoBook(this.first, this.rest.insertTitle(b));
		}
	}

	@Override
	public double salePrice(int discount) {
		return this.first.salePrice(discount) + this.rest.salePrice(discount);
	}

	@Override
	public ILoBook allBooksTitleBefore(String title) {
		if (this.first.name.compareTo(title) <= 0) {
			return new ConsLoBook(this.first, this.rest.allBooksTitleBefore(title));

		}
		else {

			return this.rest.allBooksTitleBefore(title);

		}
	}

}

class ExamplesBookLists {
	Bookn htdp = new Bookn("HtDP", "MF", 0.0, 2014);
	Bookn hp = new Bookn("HP & the search for more money", "JKR", 9000.00, 2015);
	Bookn gatsby = new Bookn("The Great Gatsby", "FSF", 15.99, 1930);
	ILoBook mtList = new MtLoBook();
	ILoBook twoBooks = new ConsLoBook(this.htdp, new ConsLoBook(this.hp, this.mtList));
	ILoBook threeBooks = new ConsLoBook(this.gatsby, this.twoBooks);

	// Books
	Bookn htdp2 = new Bookn("HtDP", "MF", 60, 2001);
	Bookn lpp = new Bookn("LPP", "STX", 25, 1942);
	Bookn ll = new Bookn("LL", "FF", 10, 1986);

	// lists of Books
	ILoBook mtlist = new MtLoBook();
	ILoBook lista = new ConsLoBook(this.lpp, this.mtlist);
	ILoBook listb = new ConsLoBook(this.htdp2, this.mtlist);
	ILoBook listc = new ConsLoBook(this.lpp, new ConsLoBook(this.ll, this.listb));
	ILoBook listd = new ConsLoBook(this.ll,
			new ConsLoBook(this.lpp, new ConsLoBook(this.htdp2, this.mtlist)));
	ILoBook listdUnsorted = new ConsLoBook(this.lpp,
			new ConsLoBook(this.htdp2, new ConsLoBook(this.ll, this.mtlist)));
	ILoBook liste = new ConsLoBook(this.ll, this.threeBooks);
	// tests for the method count
	boolean testCount(Tester t) {
		return t.checkExpect(this.mtlist.count(), 0) && t.checkExpect(this.lista.count(), 1)
				&& t.checkExpect(this.listd.count(), 3);
	}

	// tests for the method salePrice
	boolean testSalePrice(Tester t) {
		return
		// no discount -- full price
		t.checkInexact(this.mtlist.salePrice(0), 0.0, 0.001)
				&& t.checkInexact(this.lista.salePrice(0), 25.0, 0.001)
				&& t.checkInexact(this.listc.salePrice(0), 95.0, 0.001)
				&& t.checkInexact(this.listd.salePrice(0), 95.0, 0.001) &&
				// 50% off sale -- half price
				t.checkInexact(this.mtlist.salePrice(50), 0.0, 0.001)
				&& t.checkInexact(this.lista.salePrice(50), 12.5, 0.001)
				&& t.checkInexact(this.listc.salePrice(50), 47.5, 0.001)
				&& t.checkInexact(this.listd.salePrice(50), 47.5, 0.001);
	}

	// tests for the method allBefore
	boolean testAllBefore(Tester t) {
		return t.checkExpect(this.mtlist.allBooksBefore(2001), this.mtlist)
				&& t.checkExpect(this.lista.allBooksBefore(2001), this.lista)
				&& t.checkExpect(this.listb.allBooksBefore(2001), this.mtlist)
				&& t.checkExpect(this.listc.allBooksBefore(2001),
						new ConsLoBook(this.lpp, new ConsLoBook(this.ll, this.mtlist)))
				&& t.checkExpect(this.listd.allBooksBefore(2001),
						new ConsLoBook(this.ll, new ConsLoBook(this.lpp, this.mtlist)));
	}

	// test the method sort for the lists of books
	boolean testSort(Tester t) {
		return t.checkExpect(this.listc.sortByPrice(), this.listd)
				&& t.checkExpect(this.listdUnsorted.sortByPrice(), this.listd);
	}

	
	
	boolean testTitleSort(Tester t) {

		return t.checkExpect(this.lista.sortByTitle(), this.lista) 
				&& t.checkExpect(this.threeBooks.sortByTitle(), new ConsLoBook(this.hp, 
				    new ConsLoBook(this.htdp, 
				        new ConsLoBook(this.gatsby, this.mtList))))
				&& t.checkExpect(this.liste.sortByTitle(),
						new ConsLoBook(this.hp, new ConsLoBook(this.htdp,
								new ConsLoBook(this.ll, new ConsLoBook(this.gatsby, this.mtList)))));
	}

}
