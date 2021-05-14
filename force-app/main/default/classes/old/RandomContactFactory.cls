public with sharing class RandomContactFactory {

    public static List<Contact> generateRandomContacts (Integer numberOfContacts, String lastName) {
        List<Contact> generatedContacts = new List<Contact>();
        for(Integer i=0; i<numberOfContacts; i++) {
            String firstName = 'First Name' + i;
            generatedContacts.add(new Contact(FirstName = firstName, LastName=lastName));
        }
        return generatedContacts;
    }
    
}
