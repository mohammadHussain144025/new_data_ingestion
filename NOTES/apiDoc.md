## to update { SF Approved Quotes }  table
>> endpoint url : https://spriced.dev.meritor.simadvisory.com/api/v1/data-api/entity/145/data   
>> http method : PUT   
>> possible status code : 201 Created 
>> schema of the data to be sent :
column  datatype       size
------  --------       ----
qsoldt	char	        6
qpart	char	        23
qcust	char	        23
quote	numeric	        8
qfds	char	        3
qfrom	datetime	    10
qto	    datetime	    10
qmail	char	        8
qrefer	char	        20
qattn	char	        30
qmin1	decimal	        5
qmin2	decimal     	5
qmin3	decimal	        5
qmin4	decimal	        5
qmin5	decimal	        5
qmax1	decimal	        5
qmax2	decimal     	5
qmax3	decimal	        5
qmax4	decimal	        5
qmax5	decimal	        5
qprc1	decimal	        7
qprc2	decimal	        7
qprc3	decimal	        7
qprc4	decimal	        7
qprc5	decimal	        7
qdsc1	numeric	        4
qdsc2	numeric	        4
qdsc3	numeric	        4
qdsc4	numeric	        4
qdsc5	numeric	        4
qlist	numeric	        7
qspecl	char	        1
qprint	char	        1
qcmt1	char	        30
qcmt2	char	        30
qcomqty	decimal	        7
qeffdt	datetime        null
qprcimp	numeric	        null
qapp	char	        10


>> successful response : 
{
    "rowsChanged": 1,
    "result": [
        {
            "qspecl": null,
            "qmin1": null,
            "qcust": null,
            "qlist": null,
            "qrefer": null,
            "qprint": null,
            "qto": "2024-02-23T18:30:00Z",
            "qmax5": null,
            "qmax4": null,
            "created_by": null,
            "qcmt1": null,
            "qeffdt": null,
            "qfrom": "2024-02-21T18:30:00Z",
            "is_valid": true,
            "qmin5": null,
            "updated_date": "2024-02-20T09:12:53.733823Z",
            "name": "test",
            "qmin4": null,
            "updated_by": "mohd.husain@simadvisorypartner.com",
            "qmin3": null,
            "created_date": null,
            "qattn": null,
            "qmin2": null,
            "qapp": null,
            "comment": null,
            "qcmt2": null,
            "code": "99930",
            "qdsc3": null,
            "qprcimp": null,
            "qprc5": null,
            "qdsc2": null,
            "qdsc1": null,
            "qmail": null,
            "qprc2": null,
            "qprc1": null,
            "qprc4": null,
            "qprc3": null,
            "qpart": null,
            "qsoldt": "A31222",
            "quote": 98302390,
            "qmax3": null,
            "qmax2": null,
            "qmax1": null,
            "qdsc5": null,
            "qfds": "252",
            "qdsc4": null,
            "qcomqty": null,
            "validationstatus": null,
            "id": 1977
        }
    ],
    "ruleValidations": null
}
>> error response : 
{
    "timestamp": "2024-02-20T12:08:21.636+00:00",
    "message": "DataAccess:Unique constraint violation.[sf_approved_quotes]",
    "details": "",
    "errorCode": "DB_UK-008",
    "requestURI": "/api/v1/data-api/entity/145/data",
    "errors": {}
}
>> to resolve this error checkout the datatype and size of the provided data. 


>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


## to retrieve data from the { SF Approved Quotes } table   
>> endpoint url : https://spriced.dev.meritor.simadvisory.com/api/v1/definition/entities/145   
>> endpoint url : https://spriced.dev.meritor.simadvisory.com/api/v1/data-api/entity/145/data 
>> http method : GET     
>> possible status code : 200 OK   
>>sucessful response : 
 {  
    "id": 145, 
    "name": "sf_approved_quotes", 
    "displayName": "SF Approved Quotes", 
    "groupId": 1, 
    "isDisabled": false, 
    "enableAuditTrial": true, 
    "comment": "Newly created", 
    "attributes": [ 
        { 
            "id": "b069581b-54fe-4c60-a5b9-2174c2e17334", 
            "name": "name", 
            "displayName": "Name", 
            "dataType": "STRING_VAR", 
            "type": "FREE_FORM", 
            "size": 25, 
            "width": 100, 
            "nullable": true, 
            "numberOfDecimalValues": 0, 
            "permission": "UPDATE", 
            "constraintType": "NONE", 
            "showInForm": true, 
            "editable": true,  
            "onlyDisplayNameEditable": true, 
            "systemAttribute": false, 
            "indexd": false, 
            "autoGenerated": true 
        }, ...   
} 
 
>> error response if bearer token expired/not found : 401 Unauthorized   



>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  

## Request headers :
  >> 'Content-Type'/ Accept : application/json 
  >> 'Authorization' : BEARER token  
  >> 'tenant': 'meritor'   
  >>  Host: spriced.dev.meritor.simadvisory.com  

