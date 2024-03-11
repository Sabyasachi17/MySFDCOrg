@isTest
public class AddtryTest 
{
	@isTest
    public static void addtest()
    {
        Addtry nos= new Addtry();
        Integer sum = nos.add();
        System.assertEquals(30, sum, 'sum is not correct');
    }
    
    
}