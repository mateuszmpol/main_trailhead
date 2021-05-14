@isTest
public with sharing class AccountProcessorTest {
    
    @isTest
    public static void testCountContacts() {
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        Contact testContact = new Contact(AccountId = testAccount.Id, LastName = 'Test Contact');
        insert testContact;
        List<Id> accountsIdList = new List<Id>();
        accountsIdList.add(testAccount.Id);

        Test.startTest();
            AccountProcessor.countContacts(accountsIdList);
        Test.stopTest();
        
        Account acc = [SELECT Number_Of_Contacts__c FROM Account WHERE Id =: testAccount.Id LIMIT 1];
        System.assertEquals(1, acc.Number_Of_Contacts__c);

    }
}
