global with sharing class jobdetails {
    public List<candidate__c> records{get;set;}
    public List<candidate__c> accessRecords{get;set;}
    public List<job_vivek__c> jobvivek{get;set;}
    public List<String> fields{get;set;}
    public String jobId {get;set;}
    public  jobdetails() {
        candidate__c  candidate = new  candidate__c();
        jobId = ApexPages.CurrentPage().getParameters().get('id');
        accessRecords = [select id, Full_name__c, Application_date__c, Status__c,Email__c,Job__c,country__c,Expected_salary__c FROM candidate__c limit 4 ];
        if(jobId!=null){
            jobvivek = [SELECT  Number_of_position__c,Certification_Required__c,Required_Skills__c,Job_types__c,Manager__c,Qualification_Required__c FROM job_vivek__c WHERE id=:jobId];
            records = [Select Salutation__c,Fist_name__c,Last_name__c,Full_name__c,Email__c,country__c,State__c,Status__c,job__c FROM candidate__c WHERE Job__c=:jobId];
            fields = new List<String>{'Full_name__c','Email__c','id'};
                }
    }
}