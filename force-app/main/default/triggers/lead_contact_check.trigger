trigger lead_contact_check on Lead (before insert)
{
    if(trigger.isinsert && Trigger.isbefore)
    {
        List<Contact> con = new List<contact>();
        List<Account> acc = new List<Account>();
        con = [select id,email from contact];
        acc = [select id,website from account];
        Map<string,id> condetails = new Map<string,id>();
        Map<string,id> accdetails = new Map<string,id>();
        for(Contact c:con)
        {
            condetails.put(c.Email,c.id);
        }
         for(Account a:acc)
        {
            accdetails.put(a.website,a.id);
        }
        
        
        //con = [select id,email from contact where email IN:em];
        for(lead lp:trigger.new)
        {
            if(condetails.containskey(lp.email))
            {
                lp.email.addError('contact with same email is existing -->'+condetails.get(lp.email));
            }
        }
         for(lead lp:trigger.new)
        {
            if(accdetails.containskey(lp.email))
            {
                lp.email.addError('Account with same email is existing -->'+accdetails.get(lp.website));
            }
        }
        
    }

}