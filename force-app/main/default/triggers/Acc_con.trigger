trigger Acc_con on Account (after insert,before delete) 
{
    Contact c=new Contact();
    Opportunity op=new Opportunity();
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            for(Account a: Trigger.new)
             {
                 system.debug(a.id);
                 system.debug(a.Name);
                 system.debug(a.Name);
                 system.debug(a.Name);
                 c = new Contact(AccountId=A.id,lastname=a.Name+'Contact');
                 op=new Opportunity(AccountId=A.id,Name=a.Name+'opportunity',StageName='Closed Won',CloseDate=Date.today());
             }
        }
        insert c;
    insert op;

    }
    else if(trigger.isBefore && trigger.isDelete)
        {
            list<id> acc = new list<id>();
            list<contact> co =[select id from contact where AccountId IN: trigger.oldmap.keyset()];
            system.debug('##########'+co);
            for(Account a:trigger.old)
            {
                acc.add(a.id);
            }
            list<contact> ct = [select id,AccountId from contact where AccountId in:acc ];
            list<contact> con=new list<contact>();
            if(ct.size()>0)
            {
                for(contact c:ct)
                {
            
                 c.AccountId=null;
                con.add(c);
                }
            } 
           
           update con;
            
            
        }
        
    
    
    }