public class testschedule implements schedulable {
    public void execute(SchedulableContext sc)
    {
        Batch_test accountinstance =new Batch_test();
		Database.executeBatch(accountinstance,50);         
        
    }

}