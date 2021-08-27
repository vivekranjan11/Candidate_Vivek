@istest
private class TestCandidate {
    @testSetup 
    static void CandidateVivekHandler() {
        TriggerControl__c triggerSwitch = new TriggerControl__c(isAcive__c=True, trigger_method__c = 'CandidateUpdate');
        insert triggerSwitch;
        TriggerControlJob__c triggerSwitch1 = new TriggerControlJob__c(Active__c=True, JobUpdate__c = 'JobUpdate');
        insert triggerSwitch1;
        Contact contact =new Contact (FirstName='Vivek', LastName ='ranjan');
        insert contact;
        job_vivek__c jobVivek = new job_vivek__c (Number_of_position__c=2, Active__c=true, Salary_offered__c=123, Manager__c=contact.id, Job_types__c='Manager', Required_Skills__c='People Skills');
        insert jobVivek;
        List<candidate__c> listCandidates = new List<candidate__c>();
        for(Integer i=0;i<5;i++){
            candidate__c candidateObj = new candidate__c(Fist_name__c='Vivek'+i, Last_name__c='ranjan'+i,Salutation__c='Mr.', Country__c='India', State__c='Maharashtra', Status__c='Hired', Expected_salary__c=100, job__c=jobVivek.id,Email__c ='agffbc@acme.com');
            listCandidates.add(candidateObj);
        }
        insert listCandidates;
    }
    @istest
    static void CandidateSalary()
    {  
        list<candidate__c> lstCandidateVivek = new list<candidate__c>();
        lstCandidateVivek = [SELECT Expected_salary__c FROM candidate__c LIMIT 1];
        lstCandidateVivek[0].Expected_salary__c = null;
        try{
            update lstCandidateVivek;
        }catch(Exception ex){
            system.assertEquals(ex.getMessage().contains('Expected Salary field is missing'), true) ;           
        }
    }
    @istest
    static  void Job_Deactive(){
        list<job_vivek__c> listJobVivek= new list<job_vivek__c>();
        listJobVivek= [SELECT Id, Active__c, Salary_offered__c, Manager__c, Total_applicants__c, Required_Skills__c, Job_types__c, Qualification_Required__c 
                       FROM job_vivek__c];
        listJobVivek[0].Active__c= false;
        update listJobVivek;
        list<candidate__c> lstCandidateVivek= new list<candidate__c>();
        lstCandidateVivek =[SELECT Id, Fist_name__c, Last_name__c, Full_name__c, DOB__c, Email__c, Country__c, State__c, Expected_salary__c, Status__c, job__c 
                            FROM candidate__c];
        try{
            update lstCandidateVivek ;
        }catch(Exception ex){
            system.assertEquals(ex.getMessage().contains('This job is not active. You can not apply for this job'), true) ; 
        }
        
        
    }
    @istest
    static void Application_date(){
        List<candidate__c> lstCandidateVivek= new List<candidate__c>();
        lstCandidateVivek = [SELECT Id, Fist_name__c, Last_name__c, Full_name__c, DOB__c, Email__c, Country__c, State__c,Application_date__c, Expected_salary__c, Status__c, job__c,CreatedDate 
                             FROM candidate__c LIMIT 1];
        lstCandidateVivek[0].Application_date__c = null;
        try{
            update lstCandidateVivek;
        }catch(Exception ex){
            system.assertEquals(Date.valueOf(lstCandidateVivek[0].CreatedDate),Date.valueOf(lstCandidateVivek[0].Application_date__c));
        }
    }
    
}