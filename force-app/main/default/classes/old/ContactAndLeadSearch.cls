public with sharing class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String s1) {
        List<List<SObject>> searchList = [FIND :s1 IN ALL FIELDS RETURNING Lead(FirstName, LastName), Contact(FirstName, LastName)];
        return searchList;

    }
}
