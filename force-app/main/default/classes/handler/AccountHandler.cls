public with sharing class AccountHandler {
    public static Account insertNewAccount(String accountName) {
        Account account = new Account(Name = accountName);
        try {
            insert account;
        } catch (DmlException e) {
            return null;
        }
        return account;
    }

    public static void insertAccount(Integer numberOfNewAccounts){
        List<Account> addAccounts = new List<Account>();
        for (Integer i = 1; i <= numberOfNewAccounts; i++) {
            Account acc = new Account();
            acc.Name = 'Acme Inc ' + i;
            acc.AccountNumber = 'A000' + i;
            addAccounts.add(acc);
        }
        insert addAccounts;
    }
}
