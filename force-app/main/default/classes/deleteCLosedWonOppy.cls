public class deleteCLosedWonOppy
{
    @InvocableMethod
    public static void deleteOppy(list<string> ids)
        {
            //ids - id of accounts passed by the flow
            //oppydid - ids of opy with stagename ->closed won
            List<Opportunity> oppyid= [select id,StageName from opportunity where accountid =:ids and StageName = 'closed won'];
            delete oppyid;
        }

}