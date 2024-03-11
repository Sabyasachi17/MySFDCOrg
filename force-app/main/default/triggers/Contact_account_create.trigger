trigger Contact_account_create on Contact (after insert,before insert,before delete)
{
    acc_trig_handler ac = new acc_trig_handler();
    if(trigger.isbefore && trigger.isinsert)
    {
        //ac.mandFields(trigger.new);
         ac.createAcc(trigger.new);
    }
    else if(trigger.isbefore && trigger.isdelete)
    {
       ac.stopdelete(trigger.old);
        ac.deletecon(trigger.old);
       
    }
    else if(trigger.isafter && trigger.isdelete)
    {
         
    }
    else if(trigger.isafter && trigger.isinsert)
    {
        if(!trigger.new.isempty())
        {
            //acc_trig_handler ac = new acc_trig_handler();
		   //ac.createAcc(trigger.new);
          // ac.addacc(trigger.new);
        }
    }

}