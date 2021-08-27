public class  CandidateVivekHandler {
    public static void CandidateSalary(List<candidate__c> listCandidates){
        for(candidate__c candidateObj : listCandidates){
            if(candidateObj.Expected_salary__c ==null){
                candidateObj.addError('Expected Salary field is missing');
            }
        }
    }
    public static void Application_Date(List<candidate__c> listApplicationDate){
        for(candidate__c candidate : listApplicationDate){
            if(candidate.Application_date__c == null){
                candidate.Application_date__c=Date.valueOf(candidate.CreatedDate);
            }
        }        
    }
    
    public static void Job_Deactive(List<candidate__c> jobDeactive){
        
        Set<Id> jobId = new Set<Id>();     
        for(candidate__c objCandidate :jobDeactive) 
        {
            
            if(objCandidate.Job__c !=null)
            {
                jobId.add(objCandidate.Job__c);
            }
            
        }
        Map<Id,job_vivek__c>  deactivateJob = new Map<Id,job_vivek__c>([SELECT Id,Active__c 
                                                                        FROM job_vivek__c 
                                                                        WHERE Id In:jobId 
                                                                        AND Active__c=: false]);
        
        for(candidate__c objCandidate:jobDeactive)
        {
            if(deactivateJob.containsKey(objCandidate.job__c))
            {
                objCandidate.addError('This job is not active. You can not apply for this job');
            }  
        }
        
    }
}