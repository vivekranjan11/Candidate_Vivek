public class AccountVFController
        {
            public List<sObject> records{get;set;}
            public List<String> fields{get;set;}
            public AccountVFController()
            {
            records= [Select Fist_name__c,Last_name__c,	Email__c, Full_name__c,Status__c FROM candidate__c WHERE job__c ='a035g000001LpmU'];
            fields = new List<String>{'Fist_name__c', 'Last_name__c','Email__c','Full_name__c',	'Status__c'};
            }
        }