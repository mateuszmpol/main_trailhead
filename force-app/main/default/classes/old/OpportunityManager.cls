public with sharing class OpportunityManager {
    
    public static List<Task> getOptionalTasksForNewOpportunity(List<Opportunity> oppList) {
        List<Task> createdTask = new List<Task>();
        for(Opportunity opp:oppList) {
            if(opp.StageName == 'Closed Won') {
                createdTask.add(TaskCreator.createTask('Follow Up Test Task', opp.Id));
            }
        }
        return createdTask;
    }

    public static List<Task> getOptionalTasksForUpdatedOpportunity(List<Opportunity> oppList, Map<Id, Opportunity> oldOppMap) {
        List<Task> createdTask = new List<Task>();
        for(Opportunity opp:oppList) {
            if(opp.StageName == 'Closed Won' && opp.StageName != oldOppMap.get(opp.Id).StageName) {
                createdTask.add(TaskCreator.createTask('Follow Up Test Task', opp.Id));
            }
        }
        return createdTask;
    }
}
