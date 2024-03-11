public class Future_method_test
{
    @future
    public static void updateAccount(set<id> accid)
    {
        List<Account> acc1=new List<account>();
        for(Account acc:[select id,name from account where id IN:accid and name like '%test%'])
        {
            acc.name = acc.name+'Fututr Method working';
            acc1.add(acc);
        }
        update acc1;
        
        
    }
    @future
    public static void createAccount()
    {
        Account Acc=new Account(Name='future method testing');
        insert acc;
    }
    

}