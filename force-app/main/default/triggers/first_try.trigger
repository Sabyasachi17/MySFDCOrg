trigger first_try on Account (before insert) {
    Integer cout = Trigger.new.size();
    for(Account a:Trigger.New)
    {
        a.AccountNumber = '12312';
    }
    
    System.debug(cout);

}