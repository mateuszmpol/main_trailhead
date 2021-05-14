@RestResource(urlMapping='/test/*')
global with sharing class TestAccount {

    //add test sObject
    @HttpPost
    webservice static Test__c addTestWithAccount(Id accountId, String testName) {
        List<Account> account = new List<Account>();
        // check if account exists
        if (accountId != null){
            account = [
                SELECT Id, Name FROM Account WHERE Id = :accountId
            ];
        }
        // create test sObject
        Test__c test = new Test__c(Name = testName, Should_Be_Selected__c = true);
        if (account.size() > 0) {
            test.Account__c = accountId;
        }
        insert test;
        return test;        
    }

}
