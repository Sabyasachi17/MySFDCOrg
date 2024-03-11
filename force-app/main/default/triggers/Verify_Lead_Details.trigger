trigger Verify_Lead_Details on Lead (before insert) 
{
 match_leads_acc obj = new match_leads_acc();
    obj.fetchids(trigger.new);
    
}