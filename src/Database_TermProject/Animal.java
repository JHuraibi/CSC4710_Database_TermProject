package Database_TermProject;

import java.util.ArrayList;

//------------------------------------------------------------------------------------------------------//
// Notes:                                                                                               //
//      - Attributes: Unique identifier, name, species, birth date, adoption price and list of          //
//              personality traits                                                                      //
//      - Variable "animalID" is auto-assigned when preparedStatement is executed                       //
//          See: AnimalDAO.insert()                                                                     //
//                                                                                                      //
//------------------------------------------------------------------------------------------------------//

public class Animal {
	protected int animalID;
	protected String name;
	protected String species;
	protected String birthDate;
	protected int adoptionPrice;
	protected String ownersUsername;
	protected ArrayList<String> animalsTraits;
	public String[] traitsList;

	public String[] testStringArr = {"ONE","TWO","THREE"};
	public String testString = "Trait1 Trait2 Trait3";

	public Animal() {}

	public Animal(int animalID) {
		this.animalID = animalID;
	}

	public Animal(int animalID, String name, String species, String birthDate, int adoptionPrice, String ownerUsername) {
	    this(name, species, birthDate, adoptionPrice, ownerUsername);
		this.animalID = animalID;
		animalsTraits = null;
	}

    //Animal(animalID, name, species, birthDate, adoptionPrice, ownerUsername, traits);
	public Animal(String name, String species, String birthDate, int adoptionPrice, String ownerUsername) {
        this.name = name;
		this.species = species;
		this.birthDate = birthDate;
		this.adoptionPrice = adoptionPrice;
		this.ownersUsername = ownerUsername;
		animalsTraits = null;
	}

	// Used when traits need to be loaded (See: AnimalDAO.listAllAnimals())
	public Animal(int animalID, String name, String species, String birthDate,
                  int adoptionPrice, String ownerUsername, ArrayList<String> traits){
        this.animalID = animalID;
	    this.name = name;
		this.species = species;
		this.birthDate = birthDate;
		this.adoptionPrice = adoptionPrice;
		this.ownersUsername = ownerUsername;
		this.animalsTraits = traits;

		// Back to String[] for the time being. Traits will have first letter uppercase
		this.convertBackToStringArr();
	}

	public void setID(int animalID) { this.animalID = animalID; }
	public void setName(String name) { this.name = name; }
	public void setSpecies(String species) { this.species = species; }
	public void setBirthDate(String birthDate) { this.birthDate = birthDate; }
	public void setAdoptionPrice(int adoptionPrice) { this.adoptionPrice = adoptionPrice; }
    public void setOwnerUsername(String ownerUsername) { this.ownersUsername = ownerUsername; }

    public int getanimalID() { return animalID; }                               // !! DO NOT CHANGE LOWERCASE 'a'
	public String getName() { return name; }
	public String getSpecies() { return species; }
	public String getBirthDate() { return birthDate; }
    public int getAdoptionPrice() { return adoptionPrice; }
    public String getOwnerUsername() { return ownersUsername; }
    public String[] gettraitsList() { return traitsList; }						// !! DO NOT CHANGE LOWERCASE 't'


	// IF TIME: Give variables below better names
    private void convertBackToStringArr(){

		String[] traitsForOutput;
		ArrayList<String> tempArray;
		StringBuilder traitFormatter;

		tempArray = new ArrayList<>();

		for (String current : animalsTraits) {
			char uppercase = Character.toUpperCase(current.charAt(0));			// Record first letter of current trait

			traitFormatter = new StringBuilder(current);						// Seed and create the StringBuilder (SB)
			traitFormatter.setCharAt(0, uppercase);								// Use SB's .setCharAt() to make first letter uppercase
			tempArray.add(traitFormatter.toString());							// Convert to string and add to list
		}

		traitsForOutput = tempArray.toArray(new String[0]);						// Intermediate step for ease of reading

		traitsList = traitsForOutput;											// Save the formatted strings
    }

}// END CLASS [ Animal ]