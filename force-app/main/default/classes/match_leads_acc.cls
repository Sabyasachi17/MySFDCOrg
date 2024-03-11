public class match_leads_acc 
{
 
    public void fetchids(List<Lead> leads)
    {
     	Set<String> leadNames = new Set<String>();
      //  Set<String> leadPhones = new Set<String>();

    for (Lead lead : leads) {
      leadNames.add(lead.lastName);
     // leadPhones.add(lead.Phone);
    }

    List<Account> accounts = [SELECT Id, Name, Phone FROM Account WHERE Name IN :leadNames];

    Map<String, Id> accountNameToIdMap = new Map<String, Id>();
    //Map<String, Id> accountPhoneToIdMap = new Map<String, Id>();

    for (Account account : accounts) {
      accountNameToIdMap.put(account.Name, account.Id);
    //  accountPhoneToIdMap.put(account.Phone, account.Id);
    }
        
    for (Lead lead : leads) {
      if (accountNameToIdMap.containsKey(lead.lastName)/* || accountPhoneToIdMap.containsKey(lead.Phone)*/) {
        // No matching account found, prevent the lead from being inserted
        lead.description = 'loop is working';
        lead.Account__c=(accountNameToIdMap.get(lead.lastName));
        
      }
        else
        {
            
        }
    }
        
    }

}