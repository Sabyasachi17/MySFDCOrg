trigger duplicateContact on contact(before insert,before update)
{
    if(trigger.isBefore && (trigger.isInsert||trigger.isUpdate))
    {
        ContactHandler c=new ContactHandler();
        c.findDuplicate(trigger.new);
        
        
    }
}