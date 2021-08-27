public class JobRegistrationCustom{
    public job_vivek__c cand {get;set;}
   
    public JobRegistrationCustom(){
        cand=new job_vivek__c();
    }
   
    public void savejob_vivek(){
    insert cand;
    cand= new job_vivek__c();
   
    }
    public PageReference canceljob_vivek(){
    return null;
    }
  }