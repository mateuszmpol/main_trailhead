public with sharing class ContactSearch {
    
    public static List<Contact> searchForContacts(String contactLastName, String contactMailingPostalCode) {
        Contact[] contacts = [SELECT ID, Name FROM Contact WHERE (LastName = :contactLastName AND MailingPostalCode = :contactMailingPostalCode)];
        return contacts;
    }
}
