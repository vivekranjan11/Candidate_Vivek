trigger TriggerJobVivek on job_Vivek__c (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    TriggerControlJob__c TriggerCheck = [SELECT Active__c FROM TriggerControlJob__c WHERE JobUpdate__c = 'JobUpdate'];
    if(TriggerCheck!=null && TriggerCheck.Active__c){
        if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
            TriggerJobVivekHandler.activeJobAndDactiveJob(Trigger.New);
            TriggerJobVivekHandler.SendMailtoManager(Trigger.New);
        }
        if(Trigger.isBefore && Trigger.isDelete){
            TriggerJobVivekHandler.activeJobCanNotBeDeleted(Trigger.old);
        }
    }
}