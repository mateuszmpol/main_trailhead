@isTest
public with sharing class LeadProcessorTest {
    
    @isTest
    public static void testLeadProcessorBatch() {
        List<Lead> leadsList = new List<Lead>();
        for(Integer i = 0; i < 200; i++) {
            leadsList.add(new Lead(
                Company = 'Company',
                FirstName = 'Test Lead ' + i,
                LastName = 'Last Name'
            ));
        }
        insert leadsList;
        Test.startTest();
            LeadProcessor leadProcessor = new LeadProcessor();
            Database.executeBatch(leadProcessor);
        Test.stopTest();
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}