public class Welcome_Email {
     @InvocableMethod
    public static void welocmeEmail(list<string> ids)
        {
            //ids - id of Users passed by the flow
            //oppydid - ids of opy with stagename ->closed won
            list<id> gfim = new list<id>();
            list<id> nongfim = new list<id>();

            List<PermissionSetAssignment> perm= [SELECT Id, AssigneeId,PermissionSet.label FROM PermissionSetAssignment where assigneeid =: ids and SystemModstamp = today];
            for(PermissionSetAssignment p:perm)
            {
                string plabel= p.PermissionSet.label;
                            System.debug(plabel);

                if(plabel.contains('%GFIM%'))
                {
                    gfim.add(p.AssigneeId);
                }
                else
                {
                    nongfim.add(p.AssigneeId);
                }
            }
            System.debug('GFIM'+gfim);
            System.debug('NON GFIM'+nongfim);
            if(gfim.size()>0)
            sendEmail(gfim,'GFIM');
            else
                sendEmail(nongfim,'Non GFIM');
            
        }
  public static void SendEmail(list<id> uids,String temp) {
       
 EmailTemplate GFIMet=[Select id,name from EmailTemplate where name =:temp limit 1];
      System.debug(GFIMet.name);
            System.debug(uids);


 Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
 mail.setTargetObjectIds(uids);
 mail.setSenderDisplayName('System Admin');
   // mail.subject = 'Subject Test Message';
 mail.setTemplateId(GFIMet.id);
 mail.setSaveAsActivity(false);
 Messaging.sendEmail(new Messaging.MassEmailMessage[] { mail });
}

}