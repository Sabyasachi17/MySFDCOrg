public class testreport {
   
public void sendreport()
{
 /*List<PermissionSetAssignment> userid= [select assignee.id,Assignee.Name,Assignee.Profile.name,PermissionSet.Name from PermissionSetAssignment];  
  Set<PermissionSetAssignment> uid = new Set<PermissionSetAssignment>();
    for(PermissionSetAssignment ids:userid)
    {
        uid.add(ids);
        
    }*/
List<String> rows = new List<String> { 'Username,License,Profile,App name' };
     String p='test';
    for (PermissionSetAssignment assignment : [SELECT Assignee.id,Assignee.Name,Assignee.Profile.name,PermissionSet.Name,assignee.profile.UserLicense.name  FROM PermissionSetAssignment order by assignee.id desc])
 {
    
     String u=(string)assignment.Assignee.id;
     if(assignment.PermissionSet.Name.contains('test') && !(p.equals(u))){
         p=u;
         system.debug(assignment.Assignee.Name + '-----' + assignment.assignee.profile.UserLicense.name+'----'+'GFIM-----------'+p+'-----'+u);
         rows.add(assignment.Assignee.Name + ',' + assignment.assignee.profile.UserLicense.name+','+assignment.Assignee.Profile.name + ',' + 'GFIM');
         }
     else if(assignment.PermissionSet.Name.contains('X00e1') && !(p.equals(u))){
         rows.add(assignment.Assignee.Name + ',' +assignment.assignee.profile.UserLicense.name +',' +assignment.Assignee.Profile.name + ',' + 'Oneforce');
        p=u;
        system.debug(assignment.Assignee.Name + '-----' + assignment.assignee.profile.UserLicense.name+'-----'+'Oneforce-------'+p+'-----'+u);
        }
 }
List<Messaging.EmailFileAttachment> attachments = new List<Messaging.EmailFileAttachment>
{
    new Messaging.EmailFileAttachment()
};
attachments[0].setBody(Blob.valueOf(String.join(rows, '\n')));
attachments[0].setFileName('Assignments.csv');

Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
email.setTargetObjectId('0052y000002iR80AAE');
email.setSaveAsActivity(false);
email.setSubject('Demo Permission CSV');
email.setPlainTextBody('See attached');
email.setFileAttachments(attachments);
Messaging.sendEmail(new List<Messaging.Email> { email });

}
}