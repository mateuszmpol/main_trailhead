public with sharing class OpportunityTriggerHandler extends TriggerHandler {

    private Map<Id, Opportunity> oldOppMap; 

    public OpportunityTriggerHandler() {
        this.oldOppMap = (Map<Id,Opportunity>) Trigger.oldMap;
    }


    public override void afterInsert() {
        List<Task> createdTask = OpportunityManager.getOptionalTasksForNewOpportunity(Trigger.New);
        TaskManager.insertTasks(createdTask);
    }

    public override void afterUpdate() {
        List<Task> createdTask = OpportunityManager.getOptionalTasksForUpdatedOpportunity(Trigger.New, this.oldOppMap);
        TaskManager.insertTasks(createdTask);
    }

}
