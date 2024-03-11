trigger opptry on Opportunity (before insert) 
{
    boolean res=bypass_trigger.bypass();
    If(!res)
    {
    for(opportunity a:trigger.new)
    a.Description='bypass failed';
    }
    else
    {
    for(opportunity a:trigger.new)
    a.Description='bypass successful';
    }
    
    

}