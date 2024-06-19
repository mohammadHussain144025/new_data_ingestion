 # -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
import psycopg2

depe_address = 'C:\\Users\\aaditya.bhardwaj_sim\\Documents\\python_scripts\\'
to_be_changed_address = 'C:\\sim\\mds_upload\\'
saveFileName = '_changed.csv'

def connect_to_database():
    conn = psycopg2.connect(
    host="127.0.0.1",
    database="spriced_meritor",
    user="postgres",
    password="mysecretpassword")
    return conn
def getString(val):
    data = ""
    st = False
    for i in range(0, len(val)):
        if val[i] == "'":
            st = True
            data += chr(92)
        data += val[i]
    return data

def fetch_data_from_db(cmd,value_ret = '0'):
    print(cmd)
    conn = connect_to_database()
    curr = conn.cursor()
    try:
        curr.execute(cmd)
        conn.commit()
    except:
        print("The table does not exist")
        curr.close()
        return []
    else:
        if value_ret != '0':
            return curr.fetchall()

def createMap(db):
    dict = {}
    for i in db:
        dict[i[1]] = i[0]
    return dict

def replace_data(df, mp, column,file):
    print(column)
    for index in df.index:
        if column == 'channel_pricing_region_code' or column == 'region_code' or column == 'tranship_region_code' or column == 'sale_region_code' or column == 'multiplier_region_code'or column == 'next_multiplier_region_code':
            if str(df[column][index]) != 'nan' and str(int(df[column][index])) in mp:
                df.loc[index,column] = str(mp[str(int(df[column][index]))])
        elif str(df[column][index]) in mp:
            df.loc[index,column] = str(mp[str(df[column][index])])
        else:
            df.loc[index,column] = ''
    saveName = file + saveFileName
    df.to_csv(saveName, index=False)



def ingest_data_into_database(csvFile, table):
    column_list = fetch_data_from_db(f"select column_name, data_type from information_schema.columns where table_name = '{table}' order by ordinal_position",'1')
    print(column_list)
    st = ''
    dataType = {}
    for i in column_list:
        if i[0] == 'user':
            st += '"user",'
        else:
            st += i[0] + ','
        dataType[i[0]] = i[1]
    st = st[0:-1]
    # print(st)
    # print(dataType)
    df = pd.read_csv(csvFile)
    header_mapping = []
    temp = df.head()
    for item in temp:
        header_mapping.append(item)
    # print(header_mapping)
    # print(dataType)
    values = ''
    for index in df.index:
        for type in dataType:
            # print(type)
            if type == 'updated_by':
                values += "'anand.kumar@simadvisory.com',"
            elif type == 'uptime_part':
                values += "'123',"
            elif type == 'model_year_in' or type == 'model_year_out':
                values += "'123',"
            else:
                if type in header_mapping:
                    if dataType[type][0] == 'c':
                        if str(df[type][index]) != 'nan':
                            values += "E'" + getString(str(df[type][index])) +"'"+ ','
                        else:   
                            if type == 'validationstatus':
                                values += "'ValidationSucceeded',"
                            else:
                                values += "null"+ ','
                    elif dataType[type] == 'boolean':
                        if df[type][index] == 1:
                            values += 'true,'
                        else:
                            values += 'false,'
                    elif dataType[type][0] == 't':
                        # values += "'" + str(df[type][index]) + "'" + "," #changed to take datetime values from csv
                        # Convert datetime value to the PostgreSQL-compatible format
                         if pd.isna(df[type][index]):
                             values += "null,"
                         else:
                         # Convert datetime value to the PostgreSQL-compatible format
                             postgres_datetime = pd.to_datetime(df[type][index], dayfirst=True).strftime('%Y-%m-%d %H:%M:%S')
                             values += "'" + postgres_datetime + "'" + ","
                    else:
                        # print(type,str(df[type][index]))
                        if str(df[type][index]) != 'nan':
                            values += str(df[type][index]) + ","
                        else:
                            values += 'null,'
                else:
                    if type == 'validationstatus':
                        values += "'ValidationSucceeded',"
                    elif dataType[type][0] == 'c':
                        values += "null"+ ','
                    elif dataType[type] == 'boolean':
                        values += 'true,'
                    elif dataType[type][0] == 't':
                        values += "'2021-05-20 12:07:18-09'"+','
                    else:
                        values += 'null,'
        # print(values)
        values = values[0:-1]
        command = f"Insert into public.{table} ({st}) values ({values})"
        # print(command)
        res = fetch_data_from_db(command)

        values = ''

# ingest_data_into_database('xproject_type.csv', 'xproject_type'
    # ALTER TABLE table ALTER COLUMN id RESTART WITH (SELECT MAX(id) FROM table);
   # try:
	    #command = f"SELECT setval(pg_get_serial_sequence('{name}', 'id'), coalesce(MAX(id), 1)) from {name};"
	   # res = fetch_data_from_db(command,'1')
	  #  id = res[0][0] + 1
	   

def alterSequence(name):
    # ALTER TABLE table ALTER COLUMN id RESTART WITH (SELECT MAX(id) FROM table);
    try:
        command = f"SELECT setval(pg_get_serial_sequence('{name}', 'id'), coalesce(MAX(id), 1)) from {name};"
        res = fetch_data_from_db(command,'1')
        id = res[0][0] + 1
        command = f"ALTER TABLE {name} ALTER COLUMN id RESTART WITH {id};"
        res = fetch_data_from_db(command)
    except:
        print(f"Table does not exist {name}")


def run(a1, a2, file):
    df_dependent = pd.read_csv(a1)
    df_chnaged = pd.read_csv(a2)
    command = f'select id, code from public.mds_sample_'
    for index in df_dependent.index:
        name = df_dependent['Linked_to'][index]
        name = name.lower()
        name.strip()
        name = name.replace(' ', '_')
        if name == 'xcpm':
            name += '3'
        if name == 'xcpm_historical':
            name += '1'
        if name == 'xswapp_program_analysis_code':
            name = 'xswapp_program_analysis_code_1'
        cmd = command+name
        print(f'The command running is ' + cmd)
        db = fetch_data_from_db(cmd,'1')
        mp = createMap(db)
        if name[-1] == '1':
            k = len(name)
            name = name[:k-2]
        column = df_dependent['Attribute'][index].lower()
        column = column.replace(' ', '_')
        column = column + '_code'
        if len(mp) > 0:
            fileName = replace_data(df_chnaged, mp, column, file)
        else:
            print('The table is empty')

def create_sequence():
    df = pd.read_csv('Inputs\\Custom\\sequence_meritor.csv')
    seq_list = []
    for index in df.index:
        seq_list.append(df['json_name'][index])
    print(seq_list)
    return seq_list

seq = create_sequence()

#for item in seq:

 #    if str(item) == 'nan':
  #       continue
   #  csvFile = f'sequence_meritor\\{item}.csv'
    # csvFile = f'{item}.csv'
     #print(csvFile)
     #ingest_data_into_database(csvFile, item)
     #alterSequence(item)
    



ingest_data_into_database('Inputs\\Raw\\Ingestion_csv_files\\'+'promos.csv','promos')

# file = 'new_parts_notification_detail'
# ingest_data_into_database('list_price_table'+'.csv','list_price')

# alterSequence("list_price")

# depe_address += file + '.csv'
# to_be_changed_address += 'mds_sample_' + file + '.csv'
# run(depe_address, to_be_changed_address,file)
# print("Do you want to ingest data? Enter 1 for yes, any other key for no")
# choice = input()
# if choice == '1':
#     ingest_data_into_database(file+saveFileName, 'mds_sample_'+file)

# curr = connect_to_database()
# curr.execute('select * from public.mds_sample_local_segment')
# print(curr.fetchall())
# curr.execute("Insert into public.mds_sample_ecc_minor (name,code,ecc_code,segment_type_code,india_segment_type_code,brazil_segment_type_code,updated_by,updated_date,is_valid,comment) values ('ccc','dddd',1234,123,12,1,'ads','2004-10-19 10:23:54+02',true,'no comment')")
# db = curr.fetchall()




