public with sharing class ContactHandler {
        public void findDuplicate(list<Contact> newc)
        {   
            list<String> conNames = new list<String>();
            list<contact> co =[select id from contact where AccountId IN: trigger.oldmap.keyset()];
            system.debug('##########'+co);
            for(contact c:newc)
            {
            conNames.add(c.Name);
            }
            list<contact> val= [select id,Name from contact where Name =:conNames];
            for(contact cc:newc)
            {
                if(val.size()>0)
              cc.addError('duplicate\n'+val);
            }
            
        }
        }