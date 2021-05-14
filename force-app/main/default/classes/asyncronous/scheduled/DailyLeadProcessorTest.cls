@isTest
public with sharing class DailyLeadProcessorTest {
    
    @isTest
    public static void max200LeadsWithLeadSourcNullShouldUpdateLeadSourceToDreamforce() {
        // given
        List<Lead> leadsList = new List<Lead>();
        // add 200 new Lead record
        for (Integer i = 0; i < 200; i++) {
            leadsList.add(new Lead(LastName = 'Test Lead ' + i, Company = 'Company'));
        }
        insert leadsList;

        // get ids of added Lead records
        Map<Id,Lead> leadMap = new Map<Id,Lead>(leadsList);
        List<Id> leadsIds = new List<Id>(leadMap.keySet());
        // when
        Test.startTest();
            // daily job
            String CRON_EXP = '0 0 1 * * ?';
            String jobId = System.schedule(
                'Apex Trailhead Daily Lead check',
                CRON_EXP,
                new DailyLeadProcessor()
            );
        Test.stopTest();
        // then
        List<Lead> checkLeadList = [
            SELECT Id
            FROM Lead
            WHERE LeadSource = NULL AND Id IN :leadsIds
        ];
        System.assertEquals(0, checkLeadList.size());
    }


}
