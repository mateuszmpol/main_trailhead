/*
Create an Apex class that implements the Database.Batchable interface 
to update all Lead records in the org with a specific LeadSource.
*/

public with sharing class LeadProcessor implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT LeadSource FROM Lead'
        );
    }

    public void execute(Database.BatchableContext bc, List<Lead> scope) {
        for (Lead lead:scope) {
            lead.LeadSource = 'Dreamforce';
        }
        update scope;
    }

    public void finish(Database.BatchableContext bc) {

    }
}
