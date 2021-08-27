trigger candidateTrigger on candidate__c (before insert, before update,before delete,after undelete,after insert, after update,after delete)
{
    TriggerControl__c triggerSwitch = [SELECT isAcive__c 
                                       FROM TriggerControl__c 
                                       WHERE trigger_method__c = 'CandidateUpdate'];
    Boolean flag = triggerSwitch.isAcive__c;
    if(flag){
        if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
            CandidateVivekHandler.CandidateSalary(trigger.new);
            CandidateVivekHandler.Job_Deactive(trigger.new);
        }
        if(trigger.isafter && trigger.isInsert){
            CandidateVivekHandler.Application_Date(trigger.new);
        }
    }
}