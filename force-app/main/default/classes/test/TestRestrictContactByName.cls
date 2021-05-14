@isTest
public with sharing class TestRestrictContactByName {

    @isTest static void test() {
        Contact contact = new Contact(LastName = 'INVALIDNAME', FirstName='a');
        Test.startTest();
        Database.UpsertResult result = Database.upsert(contact, false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                            result.getErrors()[0].getMessage());
    }
}
