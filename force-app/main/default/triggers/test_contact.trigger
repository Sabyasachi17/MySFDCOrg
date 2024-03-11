trigger test_contact on Contact (before insert)
{
    if(Trigger.isBefore)
    {
        if(Trigger.isInsert)
        {
            for(Contact a: Trigger.new)
            {
                if(a.Name=='%sabya%')
                
                    a.addError('Name cannot contain sabya');
                
            }
        }
    }

}