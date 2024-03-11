public class conCont {
    
   
public Contact con{get;set;}
public list<Contact> cons{get;set;}
    public id accid{get;set;}   

public conCont(){
cons=new list<Contact>();
  con=new Contact();
    accid = ApexPages.CurrentPage().GetParameters().Get('Id');
    method1();
}
    public pagereference method1()
   
  {
 
 	 
      System.debug('acc id'+accid);

 
   cons = [select lastname,status__c,Email from contact where accountID =:accid and status__c = 'Submitted'];
   
   
   return null;
   
  }
 
}