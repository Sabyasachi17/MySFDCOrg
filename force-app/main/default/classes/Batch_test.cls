public class Batch_test implements Database.Batchable<SObject>
{
    public database.QueryLocator start(database.BatchableContext BC)
    {
        return Database.getQueryLocator('select id,type from account');
    }
    
    public void execute(database.BatchableContext BC,List<Account> scope)
    {
        for(Account acc:scope)
        {
            acc.type ='other';
        }
        update scope;
    }
    
    public void finish(Database.BatchableContext BC)
    {
        System.debug('batch finished');
    }

}