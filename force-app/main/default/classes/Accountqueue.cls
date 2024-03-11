public class Accountqueue implements queueable 
{
    public void execute(queueablecontext sc)
    {
        	list<Account> Updaterec = new List<Account>();
        	updaterec = [select id,type from account];
        	for(Account acc:updaterec)
            {
                acc.type = 'prospect';
            }
        update updaterec;
    }

}