@istest
public class updateleadacc_test {
@istest
 public static void update_lead_test()
 {
     Account acc = new Account();acc.name='my account';
     insert acc;
     lead l1= new lead(lastname='test lead',company='testcomp',industry='agriculture',email='s@gmail.com');
     l1.account__c=acc.id;
     insert l1;
         
     
     
     lead l2=[select id,company,lastname,account__c from lead where account__c =: acc.id];
          
     System.assertNotEquals(acc.Name,l2.company);
          
     acc.name= 'name changed';
     update acc;
          
     lead l3=[select id,company,lastname from lead where account__c =: acc.id ];

     System.assertEquals(acc.Name,l3.company);
     
 }

}