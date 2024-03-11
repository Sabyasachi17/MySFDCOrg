public class sobj 
{
   public static void objTest()
   {
	Account objAccount = new Account(); // Object initialization
	objAccount.Name = 'Testr Account'; // Assigning the value to field Name of Account
	objAccount.Description = 'Test Account';
	insert objAccount; // Creating record using DML
	System.debug('Records Has been created '+objAccount);
   }

}