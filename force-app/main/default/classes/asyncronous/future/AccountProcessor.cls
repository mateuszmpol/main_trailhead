/*
Create an Apex class with a future method that accepts a List of Account IDs 
and updates a custom field on the Account object with the number of contacts associated to the Account.
Write unit tests that achieve 100% code coverage for the class. 
Every hands-on challenge in this module asks you to create a test class.
*/

public with sharing class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> accountsIdsList) {
        List<Account> accountsToUpdate = [
            SELECT Id, Number_Of_Contacts__c, (SELECT Id FROM Contacts) 
            FROM Account 
            WHERE Id IN :accountsIdsList
        ];
        for (Account acc : accountsToUpdate) {
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }
        update accountsToUpdate;
    }
}
