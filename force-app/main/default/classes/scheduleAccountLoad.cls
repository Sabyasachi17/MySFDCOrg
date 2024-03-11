public class scheduleAccountLoad implements schedulable {
    public void execute(SchedulableContext sc)
    {
        scheduleacc();       
        
    }
    @future(callout=true)
    public static void scheduleacc()
    {
        
		   getInfoOrgA.getAccount();        
        
    }

}