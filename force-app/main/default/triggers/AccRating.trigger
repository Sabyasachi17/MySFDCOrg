trigger AccRating on Account (before insert,before update) 
{
    if(trigger.isbefore && (trigger.isinsert||trigger.isUpdate))
    {
        for(account a:trigger.new)
        {
            if(a.industry=='Banking' || a.industry == 'Healthcare')
            {
                a.rating = 'hot';
            }
        }
      
    }
   
    
}