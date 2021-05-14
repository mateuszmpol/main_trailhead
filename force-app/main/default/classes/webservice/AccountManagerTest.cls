@isTest
public with sharing class AccountManagerTest {

    @isTest
    public static void test(){
        Account testAccount = new Account(
            Name = 'test acc'
        );
        insert testAccount;
        Contact testContact = new Contact(
            LastName = 'test contact',
            AccountId = testAccount.Id
        );
        insert testContact;

        Id recordId = testAccount.Id;
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://creative-raccoon-6znr01-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + recordId +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount!= null);
        System.assertEquals('test acc', thisAccount.Name);

    }

}
