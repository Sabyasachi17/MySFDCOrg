trigger task_on_acc on Account (before update, before insert) 
{
    if(Trigger.isBefore)
    {
        if(Trigger.isUpdate)
        {
            List<Task> tk=new List<Task>();

            for(Account a:Trigger.new)
            {
                Account ov=trigger.oldMap.get(a.Id);
                //a.Description= 'aboveifvalue'+ov.test__c;

                if(ov.test__c=='test' && a.test__c=='test3')
                {
                Task t=new task();    
                t.WhatId=a.Id;    
                tk.add(t);
                a.Description= 'oldvalue'+ov.test__c+'\n new value '+a.test__c;
                }

            }
            Insert tk;

        }
    }
    



}