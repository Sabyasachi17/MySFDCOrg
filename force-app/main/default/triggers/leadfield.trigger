trigger leadfield on Lead (before insert,after insert) 
{
    List<task> t= new List<Task>();
    for(Lead ld:trigger.new)
    {
    if(trigger.isbefore && trigger.isinsert)
    	{
        
        if(String.isBlank(ld.industry))
            ld.industry.adderror('industry is mandatory');
            
    	}
     else if(trigger.isafter && trigger.isinsert)
        {
            Task p=new task();
            p.Subject='lead created with ID - '+ ld.id;
            p.Description='leadname-'+ld.Name+'\nlead source - '+ld.LeadSource;
            t.add(p);
            
      	}
    }
    insert t;

}