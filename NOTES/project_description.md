>> 1 > Create or get the sourceData.csv {definiton of enttites like column name, distplay name,datatype etc}

>> 2 > Run the metaData creator script it will generate the required meta data from our sourceData csv file
        >> or else visit to this site https://www.convertcsv.com/csv-to-json.htm and convert csv to keyed json and paste that json to our metadat.json file

>> 3 > if you have that ingestion files which is going to ingest in our entites/tables place that csv files in our Inputs/Raw/Ingestion_csv_files and run
        >> the sequence_creator script it will create the sequence.json file for you  or else you can create sequence.json files manually.

>> 4 > create related.csv for your domain based entities //if there is no domain based entity then this file is not reuired.

>> 5 > now use the above created files in your json builder script accordingly.

>> 6 > once all the json files are created successfully we are ready to hit this json files on the api's
    >> local : http://localhost:9001/api/v1/definition/entities  
    >> dev : https://spriced.dev.meritor.simadvisory.com/api/v1/definition/entities  

>> this will create entites in the database 
>>note: if you are going to hit this locally first we need to turn on / run four api's from spriced-backend project
        >>1) gateway api
        >>2) definition api
        >>3) data api
        >>4) user-access-api
>>note: suppose if by mistakely we have deleted the required database (from pgAdmin) then just create again that database with the same name (e.g spriced or spriced_meritor) and then re run the definiton api and after that go to frontend UI and create model say (meritor_version_1) and then now you can again run the jsonBuilder script.

>> 7 > once the entities/table hase been created to the database 
>> use your sequnce.json file in your ingestion script to ingest all the data in your db
        
# for item in seq:

#     if str(item) == 'nan':
#         continue
#     csv_name = item + '.csv'
#     print(csv_name)
#     ingest_data_into_database('D:\\Ingestion_csv_files\\'+csv_name,item)


 >>or else you can ingest one by one also

# ingest_data_into_database('D:\\Ingestion_csv_files\\'+'partdisc_additons.csv','partdisc_additons')


>> custom inputs are based upon raw inputs