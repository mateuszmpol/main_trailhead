trigger AddRelatedRecord on Account (after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    //Get releted opportunities for the account in this trigger
    Map<Id, Account> acctsWithOpps = new Map<Id,Account>(
        [SELECT Id, (SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.new]
    );
    //Add an opportunities for each account if it doesn't already have one
    //Iterate throug each account
    for(Account acc : Trigger.new) {
        //Check if the account already has a related opportunity
        if (acctsWithOpps.get(acc.Id).Opportunities.size() == 0) {
            //If doesn't, add a default apportunity
            oppList.add(new Opportunity(
                Name = acc.Name + ' Opportunity',
                StageName = 'Prospecting',
                CloseDate = System.today().addMonths(1),
                AccountId = acc.Id));
        }
    }
    if (oppList.size() > 0) {
        insert oppList;
    }

}