public class batch_account implements Database.Batchable<Sobject> {
    public database.QueryLocator start(Database.BatchableContext bc)
    {
        String search = '%test%';
        return database.getQueryLocator('select id,description from account where name like :search');
    }
    
    public void execute(database.BatchableContext bc,list<account> scope)
    {
        for(Account acc:scope)
        {
            acc.description = 'batch is working';
        }
        update scope ;
    }
    public void finish(database.BatchableContext bc)
    {
        system.debug('batch working');
    }

}