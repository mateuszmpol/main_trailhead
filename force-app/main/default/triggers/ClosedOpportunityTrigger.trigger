/*
Create a bulkified Apex trigger that adds a follow up task to an opportunity if its stage is Closed Won. 
Fire the trigger after inserting or updating an opportunity.

Create an Apex trigger:
    Name: ClosedOpportunityTrigger
    Object: Opportunity
    Events: after insert and after update
    Condition: Stage is Closed Won
    Operation: Create a task:
    Subject: Follow Up Test Task
    WhatId = the opportunity ID (associates the task with the opportunity)
Bulkify the trigger so that it can insert or update 200 or more opportunities
*/

trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> createdTask = new List<Task>();
    for(Opportunity opp:Trigger.new) {
        if (
            Trigger.isUpdate 
            && opp.StageName == 'Closed Won'
            && opp.StageName != Trigger.oldMap.get(opp.Id).StageName
            ) {
            Task task = new Task(
                Subject = 'Follow Up Test Task',
                WhatId = opp.Id
            );
            createdTask.add(task);
        }
        else if(Trigger.isInsert && opp.StageName == 'Closed Won') {
            Task task = new Task(
                Subject = 'Follow Up Test Task',
                WhatId = opp.Id
            );
            createdTask.add(task);
        }
    }
    if (createdTask.size() > 0) {   
        try {
            insert createdTask;
        } catch (DmlException e) {
            System.debug('ERROR: ' + e.getMessage());
        }
    }
}