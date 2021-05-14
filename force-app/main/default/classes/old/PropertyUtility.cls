public with sharing class PropertyUtility {

    public static void newListedProperties() {
        List<Property__c> newPropList = new List<Property__c>();
        newPropList = [SELECT Name, Days_On_Market__c, Broker__r.Email__c FROM Property__c WHERE Date_Listed__c < LAST_N_DAYS:30];
        for(Property__c prop:newPropList) {
            String propEmail = prop.Name + ' : ' + prop.Broker__r.Email__c;
            // System.debug(prop);
            System.debug(propEmail);
        }
    }

}
