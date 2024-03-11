trigger no_of_con on Account(after insert,after update)
{
    if(Trigger.isAfter)
    {
        if(trigger.isInsert)
        {
            List<Contact> con= new list<contact>();
            for(Account a:trigger.new)
            {
                for(Integer i=0;i<a.Number_Of_Contacts__c;i++)
                {
                    contact c=new Contact();
                    c.AccountId=a.Id;
                    c.LastName='contact_trigger_check'+i;
                    con.add(c);
                }
                
            }
            insert con;

        }

        else if(trigger.isUpdate)
        {

            list<contact> con1=new List<Contact>();
             list<contact> con2=new List<Contact>();
            list<account> acc=trigger.old;
            list<account> acc1=[select id,Number_Of_Contacts__c from account where id IN :acc];
            list<Contact> condel = [select id from contact where contact.accountid IN :acc]; 
            for(account a:trigger.new)
            {   
               
                Integer i=(Integer)a.Number_Of_Contacts__c;
                Integer k2 =condel.size();
                if(i>k2)
                {
                    while(i>k2)
                    {
                    contact c=new Contact();
                    c.AccountId=a.Id;
                    c.LastName='contact_trigger_check'+i;
                    con1.add(c);
                    k2++;
                    }
                
                }
                else if(i<condel.size())
                {

                    integer k= condel.size()-i;
                    for(Integer p=0;p<k;p++)
                    {
                        contact del = condel.get(p);
                        con2.add(del);

                    }

                }

            }
            Integer b=0;
            Integer m=0;
            Set<Contact> con11 = new set<Contact>(con1);
            Set<Contact> con22 = new set<Contact>(con2);
             List<contact> ucon = new List<contact>(con11);
             List<contact> dcon = new List<contact>(con22);
             
              
           
            if(ucon.size()!=null)
            insert ucon;
            else if(dcon.size()!=null)
            delete dcon;
            
        }
    }
}