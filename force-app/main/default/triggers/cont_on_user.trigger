trigger cont_on_user on Contact (before update, after update, before insert, after insert) 
{
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            User Userlist;

            for(Contact a:Trigger.new)
            {
                Userlist = [select Con_Creator__c,Department,Id,Case_Created__c from User where id =:a.CreatedById];
                if(Userlist.Con_Creator__c){
                Userlist.Case_Created__c++;
                Userlist.Department='test';
                }
            }
            Update Userlist;
        }
    



    }}