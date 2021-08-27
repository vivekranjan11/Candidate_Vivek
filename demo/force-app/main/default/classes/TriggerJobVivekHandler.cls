public class TriggerJobVivekHandler {
    public static void activeJobAndDactiveJob(List<job_vivek__c> lstJobVivek){
        for(job_vivek__c job : lstJobVivek){
            if(job.Number_of_position__c == Job.Hired_applicants__c){
                job.Active__c = false;
            }
            else if(job.Number_of_position__c > job.Hired_applicants__c){
                job.Active__c = true;
            }
        }
    }
    public static void activeJobCanNotBeDeleted(List<job_vivek__c> lstJobVivek){
        for(job_vivek__c job : lstJobVivek){
            if(job.Active__c == true){
                job.addError('This Job is active and can not be deleted.');
            }
        }
    }
    public static void SendMailtoManager(List<job_vivek__c> lstJobVivek){
        set<id> ContactId = new set<id>();
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for (job_vivek__c job:lstJobVivek) {
            if (job.Manager__c != null ){
                ContactId.add(job.Manager__c);
            }
        }
        Contact con = [Select email,id from Contact where id in :ContactId];
        for(job_vivek__c job : lstJobVivek){
            if(job.Number_of_position__c == Job.Hired_applicants__c){
                Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
                List<String> sendTo = new List<String>();
                sendTo.add(con.email);
                mail.setToAddresses(sendTo);   
                String body = 'All required candidate has been hired for this job on' + Date.valueOf(job.LastModifiedDate);
                mail.setHtmlBody(body);
                mails.add(mail);
                Messaging.sendEmail(mails);
            }
        }
    }
}