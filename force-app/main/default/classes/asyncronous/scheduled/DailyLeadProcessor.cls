/*
Create an Apex class that implements the Schedulable interface to update Lead records with a specific LeadSource. 
(This is very similar to what you did for Batch Apex.)
*/
global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        // query max 200 Leads, where LeadSource is blank
        List<Lead> leadsList = [
            SELECT Id, LeadSource 
            FROM Lead 
            WHERE LeadSource = NULL
            LIMIT 200
        ];
        // check if leadsList is not empty
        if (leadsList.size() > 0) {
            // set LeadSource to 'Dreamforce' for each record
            for (Lead lead:leadsList) {
                lead.LeadSource = 'Dreamforce';
            }
            update leadsList;
        }
        
    }
}
