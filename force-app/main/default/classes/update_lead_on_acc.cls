public class update_lead_on_acc
{
    public void update_on_change(map<id,account> accmap)
    {
        list<lead> ldlst = new list<lead>();
        list<lead> l1 =[select id,account__c,company,description from lead where account__c in :accmap.keyset()];
        system.debug('---------------'+l1);
        for(lead l:l1)
        {
            l.company= accmap.get(l.account__c).Name;
            //l.description='code working';
            ldlst.add(l);
        }
        if(ldlst.size()>0)
        {
            system.debug('---'+ldlst);
            update ldlst;
        }
    }
}