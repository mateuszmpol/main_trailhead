public with sharing class AddPrimaryContact implements Queueable {
    
    Contact contact;
    String stateAbbreviation;

    public AddPrimaryContact(Contact contact, String stateAbbreviation) {
        this.contact = contact;
        this.stateAbbreviation = stateAbbreviation;
    }

    public void execute(QueueableContext context) {
        List<Account> accountList = [
            SELECT Id, Name, (SELECT Id, FirstName, LastName FROM Contacts)
            FROM Account
            WHERE BillingState = :stateAbbreviation
            LIMIT 200
        ];

        List<Contact> contactsList = new List<Contact>();

        for (Account acc:accountList) {
            Contact c = contact.clone(false, false, false, false);
            c.AccountId = acc.Id;
            contactsList.add(c);
        }
        if(contactsList.size() > 0) {
            insert contactsList;
        }
    }

}
