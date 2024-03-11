@isTest
private class test_for_no_of_contacts
{
static testMethod void checkcon() 
	{
	List<Account> acc=new List<Account>();
	acc =[select id,Number_Of_Contacts__c from Account where id= '0012y00000QvnqlAAB']; 
    for(Account a:acc)
    {
	System.debug(a.Number_Of_Contacts__c);
	a.Number_Of_Contacts__c=18;
    update(a);
    a.Number_Of_Contacts__c=5;   
    update(a); 
    }
        
    Account A = new Account();
        A.Name = 'trigger test for new con';
        A.Number_Of_Contacts__c = 20;
        insert(A);
        
         A.Number_Of_Contacts__c = 4;
        update(A);
        
        
        
  
        
   
	
/*select count(id) from contact where AccountId ='0012y00000QvnqlAAB';
	System.debug([select count(id) from contact where AccountId ='0012y00000QvnqlAAB']);
	List<Contact> c = [select id from contact where AccountId ='0012y00000QvnqlAAB'];
	System.assertEquals(c.size(),18);
	System.debug(c.size());*/
  }
}