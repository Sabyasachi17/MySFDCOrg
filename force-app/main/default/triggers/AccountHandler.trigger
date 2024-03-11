trigger AccountHandler on Account (after update)
{
    if(trigger.isafter && trigger.isupdate)
    {
        update_lead_on_acc obj= new update_lead_on_acc();
        obj.update_on_change(Trigger.NewMap);
    }

}