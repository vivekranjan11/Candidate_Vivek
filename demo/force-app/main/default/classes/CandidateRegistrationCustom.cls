public class CandidateRegistrationCustom{
    public candidate__c can {get;set;}
   
    public CandidateRegistrationCustom(){
        can=new candidate__c();
    }
   
    public void savecandidate(){
    insert can;
    can= new candidate__c();
   
    }
    public PageReference cancelcandidate(){
    return null;
    }
  }