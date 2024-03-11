public class acc_trig_handler
{
    public void createAcc(list<contact> cont)
    {
    list<account> acc = new List<account>();
    for(contact c:cont)
        {
            if(c.AccountId==null)
            {
                account a=new account();
                a.name = c.lastname;
                a.Type='Prospect';
                    
                acc.add(a);
                
            }
        } 
      

        insert acc;
    
      list<contact> acc1 = new list<contact>();
     

      for(contact c:cont)
      {
          if(c.AccountId==null)
          {
              account a=[select id,name from account where name =:c.LastName];
              c.AccountId=a.Id;
              acc1.add(c);
              
          }
      }
     // insert acc1;
  }
 public void mandFields(list<contact> cont)
 {
     for(contact c:cont)
        {
            if(c.AccountId==null)
            {
                c.AccountId.adderror('mandatory field');
            }
            
     
           }

 }
    public void stopdelete(list<contact> cont)
    {
        for(contact c:cont)
        {
            if(c.Status__c=='submitted')
            {
                c.status__c.adderror('contact cannot be deleted');
            }
        }
    }
    public void deletecon(List<contact> cont)
    {
        set<id> cont1 = new set<id>();
        for(contact c:cont)
        {
            
            cont1.add(c.Accountid);
            
        }
        
        system.debug('#####################');
        
       
       list<account> cont11 = [select id from account where id in:cont1];
        system.debug(cont11);
        delete cont11;
    }
}