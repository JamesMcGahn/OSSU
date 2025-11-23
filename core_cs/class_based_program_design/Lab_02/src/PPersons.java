import tester.*;

// to represent a pet owner
class PPerson {
    String name;
    IPet pet;
    int age;
 
    PPerson(String name, IPet pet, int age) {
        this.name = name;
        this.pet = pet;
        this.age = age;
    }
    
    boolean isOlder(PPerson other) {
    	return this.age > other.age; 
    }
    
    boolean sameNamePet(String name) {
    	return this.pet.sameNamePet(name);
    }
    
    PPerson perish() {
    	return new PPerson(this.name, new NoPet(), this.age);
    }
}
// to represent a pet
interface IPet { 
	boolean sameNamePet(String name);
	
}
 
// to represent a pet cat
class Cat implements IPet {
    String name;
    String kind;
    boolean longhaired;
 
    Cat(String name, String kind, boolean longhaired) {
        this.name = name;
        this.kind = kind;
        this.longhaired = longhaired;
    }
    
    
    public boolean sameNamePet(String name) {
    	
    	
    	return this.name.equals(name);
    }
}
 
// to represent a pet dog
class Dog implements IPet {
    String name;
    String kind;
    boolean male;
 
    Dog(String name, String kind, boolean male) {
        this.name = name;
        this.kind = kind;
        this.male = male;
    }

    
    public boolean sameNamePet(String name) {
    	
    	
    	return this.name.equals(name);
    }
}

class NoPet implements IPet {
	NoPet() {
	}

	@Override
	public boolean sameNamePet(String name) {
		// TODO Auto-generated method stub
		return false;
	}
	
}


class ExamplesPPersons {
	ExamplesPPersons(){}
	Cat cat1 = new Cat("Black", "Tabby", true);
	Cat cat2 = new Cat("Grey", "Hammy", false);
	Dog dog1 = new Dog("Sparky", "Golden", true);
	Dog dog2 = new Dog("Spot", "Rotty", false);
	Dog dog3 = new Dog("Spot", "Terrier", false);
	NoPet nopet = new NoPet();
	
	PPerson stanley = new PPerson("Stanley", cat1, 56);
	PPerson franklin = new PPerson("Franklin",cat2, 45);
	PPerson tim = new PPerson("Tim", dog1, 23);
	PPerson mark = new PPerson("Mark", dog2, 29);
	PPerson tico = new PPerson("Tico", dog3, 29);
	PPerson sammy = new PPerson("Sammy", nopet, 45);
	
	boolean testName(Tester t) {
		return t.checkExpect(this.mark.sameNamePet("Sparky"), false) &&
				t.checkExpect(this.mark.sameNamePet("Spot"), true) &&
				t.checkExpect(this.mark.sameNamePet("Black"), false);
	
	}	
}