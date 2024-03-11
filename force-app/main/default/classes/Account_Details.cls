public class Account_Details 
{
    public void print_acc()
    {
        Integer num=0;
        Account[] accs;
        accs = [SELECT id,Name from Account where Name LIKE '%test%'];
        System.debug(accs);
        num = accs.size();
       
        for(Integer j=0;j<num;j++)
        {
            accs[j].Phone ='1234';
            accs[j].Rating = 'Hot';
        }
        Update accs;
       
    }
    Public void acc_edit()
    {
        Integer num=0;
        Account[] accs;
        accs=  [SELECT id,AccountNumber,Name,Rating from Account where Name LIKE '%test%'];
         num = accs.size();
       
        for(Integer j=0;j<num;j++)
        {
            if((accs[j].Rating=='Hot') && (accs[j].AccountNumber =='12312'))
            Delete accs[j];
            
            else
            {
                accs[j].Website = 'coin2.com';
                Update accs[j];
            }
            
            
        }
        
       
        

        
	}

}