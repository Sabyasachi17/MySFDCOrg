public class bypass_trigger {
    public static boolean bypass()
    {
        Opportunity__c bps = Opportunity__c.getOrgDefaults();
	    Boolean bypassTrigger = bps.bypass_user__c  ;
    	Id currentUserId = bps.userid__c;

    	if(bypassTrigger && currentUserId == UserInfo.getUserId())
      		return true;
    
    	else return false;

    }
}