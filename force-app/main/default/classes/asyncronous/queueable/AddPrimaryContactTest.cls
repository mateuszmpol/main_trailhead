@isTest
public with sharing class AddPrimaryContactTest {
    
    @isTest
    public static void testList() {

        List<Account> testAccountList = new List<Account>();
        for (Integer i =0; i<50; i++) {
            testAccountList.add(new Account(
               Name = 'Test Account ' + i,
               BillingState = 'CA' 
            ));
        }
        for (Integer i =0; i<50; i++) {
            testAccountList.add(new Account(
               Name = 'Test Account ' + i,
               BillingState = 'NY' 
            ));
        }
        insert testAccountList;

        Contact co = new Contact();
        co.FirstName='demo';
        co.LastName ='demo';
        insert co;
        String state = 'CA';
     
         AddPrimaryContact apc = new AddPrimaryContact(co, state);
         Test.startTest();
           System.enqueueJob(apc);
         Test.stopTest();
        
         System.assertEquals(50, [
            SELECT count() 
            FROM Contact 
            WHERE accountID 
                IN (SELECT id FROM Account WHERE BillingState = :state)]);   
    }
}
