import pandas as pd
import numpy as np
import psycopg2
#import pyodbc
from datetime import datetime

depe_address = 'C:\\Users\\aaditya.bhardwaj_sim\\Documents\\python_scripts\\'
to_be_changed_address = 'C:\\sim\\mds_upload\\'
saveFileName = '_changed.csv'

def connect_to_database():
    conn = psycopg2.connect(
    # host="127.0.0.1",
     host = "172.28.234.94",
    database="spriced_meritor",
    user="postgres",
    password="mysecretpassword")
    return conn

def connect_to_mds():
    driver = 'ODBC Driver 17 for SQL Server'
    server = '13.59.194.204'
    database = 'MDS'
    uid = 'sa'
    pwd = 'SIM4Eight'
    con_string = f'DRIVER={driver};SERVER={server};DATABASE={database};UID={uid};PWD={pwd}'
    cnxn = pyodbc.connect(con_string)
    cursor = cnxn.cursor()
    return cursor
    # cursor.execute("select [Current Effective Date] from mdm.vNRP_dNPRICING where [supplier NUMBER] = '289209400'")
    # rows = cursor.fetchall()
    # for row in rows:
    #     for value in row:
    #         if isinstance(value, datetime):
    #             value = value.date()
    #             print(value)
    #     print('row = %r' %(row,))

def getTableDataFromMds(name):
    cursor = connect_to_mds()
    cursor.execute(f"select * from {name}")



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
    conn = connect_to_database()
    curr = conn.cursor()
    try:
        curr.execute(cmd)
        conn.commit()
    except:
        print("The table does not exist")
        curr.close()
        return("The table does not exist")
    else:
        if value_ret != '0':
            return curr.fetchall()
        else:
            return '1'

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

def getUpdateCommand(table,st,values):
    command = f"update {table} set "
    for i in range(1,len(st)):
        command += st[i] + "=" + values[i]
    command = command[0:-1]
    command += f" where id = {values[0]}"
    command = command[0:-1]
    return command

def ingest_data_into_database(csvFile, table):
    column_list = fetch_data_from_db(f"select column_name, data_type from information_schema.columns where table_name = '{table}' order by ordinal_position",'1')
    print(column_list)
    st = []
    sts = ''
    dataType = {}
    for i in column_list:
        st.append(i[0])
        sts += i[0] + ','
        dataType[i[0]] = i[1]
    # st = st[0:-1]
    # print(st)
    # print(dataType)
    sts = sts[0:-1]
    df = pd.read_csv(csvFile)
    header_mapping = []
    temp = df.head()
    for item in temp:
        header_mapping.append(item)
    # print(header_mapping)
    # print(dataType)
    count = 0
    values = []
    values_for_insert = ''
    for index in df.index:
        for type in dataType:
            # print(type)
            if type == 'updated_by':
                values.append("'system@spriced.com',")
                values_for_insert += "'system@spriced.com',"
            elif type == 'uptime_supplier':
                values.append("'123',")
                values_for_insert += "'123',"
            elif type == 'model_year_in' or type == 'model_year_out':
                values.append("'123',")
                values_for_insert += "'123',"
            else:
                if type in header_mapping or type+'_code' in header_mapping:
                    if dataType[type][0] == 'c':
                        if str(df[type][index]) != 'nan':
                            values.append("E'" + getString(str(df[type][index])) +"'"+ ',')
                            values_for_insert += "E'" + getString(str(df[type][index])) +"'"+ ','
                        else:
                            if type == 'validationstatus':
                                values.append("'ValidationSucceeded',")
                                values_for_insert += "'ValidationSucceeded',"
                            else:
                                values.append("null"+ ',')
                                values_for_insert += "null"+ ','
                    elif dataType[type] == 'boolean':
                        if df[type][index] == 1:
                            values.append('true,')
                            values_for_insert += 'true,'
                        else:
                            values.append('false,')
                            values_for_insert += 'false,'
                    elif dataType[type][0] == 't':
                        if str(df[type][index]) != 'nan':
                            values.append("'" +str(df[type][index])+"',")
                            values_for_insert += "'" +str(df[type][index])+"',"
                        else:
                            values.append('null,')
                            values_for_insert += 'null,'
                    else:
                        if type in header_mapping:
                        # print(type,str(df[type][index]))
                            if str(df[type][index]) != 'nan':
                                val = str(df[type][index]) + ","
                                values.append(val)
                                values_for_insert += val
                            else:
                                values.append("null,")
                                values_for_insert += "null,"
                        else:
                            if str(df[type+'_code'][index]) != 'nan':
                                    values.append(str(int(df[type +'_code'][index])) + ",")
                                    values_for_insert += str(int(df[type +'_code'][index])) + ","
                            else:
                                values.append("null"+ ',')
                                values_for_insert += "null"+ ','
                else:
                    if type == 'validationstatus':
                        values.append("'ValidationSucceeded',")
                        values_for_insert += "'ValidationSucceeded',"
                    elif dataType[type][0] == 'c':
                        values.append("null"+ ',')
                        values_for_insert += "null"+ ','
                    elif dataType[type] == 'boolean':
                        values.append('true,')
                        values_for_insert += 'true,'
                    elif dataType[type][0] == 't':
                        values.append("now()"+',')
                        values_for_insert += "now()"+','
                    else:
                        values.append('null,')
                        values_for_insert += "null"+','
        # print(values)
        # values = values[0:-1]
        # command = f"Insert into public.{table} ({st}) values ({values})"
        values_for_insert = values_for_insert[0:-1]
        command = f"Insert into public.{table} ({sts}) values ({values_for_insert})"
        #print(command)
        res = fetch_data_from_db(command)
        if(res == 'The table does not exist'):
            print(command)
            command = getUpdateCommand(table,st,values)
            #print(command)
            res = fetch_data_from_db(command)
        values = []
        values_for_insert = ''
        # if res != []:
        #     count += 1
        # if count >= 1000:

# ingest_data_into_database('xproject_type.csv', 'xproject_type')


# def ingest_data_into_database(csvFile, table):
#     column_list = fetch_data_from_db(f"select column_name, data_type from information_schema.columns where table_name = '{table}' order by ordinal_position",'1')
#     print(column_list)
#     st = ''
#     dataType = {}
#     for i in column_list:
#         st += i[0] + ','
#         dataType[i[0]] = i[1]
#     st = st[0:-1]
#     # print(st)
#     # print(dataType)
#     df = pd.read_csv(csvFile)
#     header_mapping = []
#     temp = df.head()
#     for item in temp:
#         header_mapping.append(item)
#     # print(header_mapping)
#     # print(dataType)
#     count = 0
#     values = ''
#     for index in df.index:
#         for type in dataType:
#             # print(type)
#             if type == 'updated_by':
#                 values += "'anand.kumar@simadvisory.com',"
#             elif type == 'uptime_supplier':
#                 values += "'123',"
#             elif type == 'model_year_in' or type == 'model_year_out':
#                 values += "'123',"
#             else:
#                 if type in header_mapping or type+'_code' in header_mapping:
#                     if dataType[type][0] == 'c':
#                         if str(df[type][index]) != 'nan':
#                             values += "E'" + getString(str(df[type][index])) +"'"+ ','
#                         else:
#                             if type == 'validationstatus':
#                                 values += "'ValidationSucceeded',"
#                             else:
#                                 values += "null"+ ','
#                     elif dataType[type] == 'boolean':
#                         if df[type][index] == 1:
#                             values += 'true,'
#                         else:
#                             values += 'false,'
#                     elif dataType[type][0] == 't':
#                         if str(df[type][index]) != 'nan':
#                             values += "'" +str(df[type][index])+"',"
#                         else:
#                              values += 'null,'
#                     else:
#                         if type in header_mapping:
#                         # print(type,str(df[type][index]))
#                             if str(df[type][index]) != 'nan':
#                                 values += str(df[type][index]) + ","
#                             else:
#                                 values += 'null,'
#                         else:
#                             if str(df[type+'_code'][index]) != 'nan':
#                                 if type+'_code' == 'region_code' and (str(df[type+'_code'][index]) == '7' or str(df[type+'_code'][index]) == '8'):
#                                     if str(df[type+'_code'][index]) == '7':
#                                         values += (str(int(41)) + ",")
#                                     else:
#                                         values += (str(int(42)) + ",")
#                                 else:
#                                     values += (str(int(df[type +'_code'][index])) + ",")
#                             else:
#                                 values += ("null"+ ',')
#                 else:
#                     if type == 'validationstatus':
#                         values += "'ValidationSucceeded',"
#                     elif dataType[type][0] == 'c':
#                         values += "null"+ ','
#                     elif dataType[type] == 'boolean':
#                         values += 'true,'
#                     elif dataType[type][0] == 't':
#                         values += "'2021-05-20 12:07:18-09'"+','
#                     else:
#                         values += 'null,'
#         # print(values)
#         values = values[0:-1]
#         command = f"Insert into public.{table} ({st}) values ({values})"
#         print(command)
#         res = fetch_data_from_db(command)
#         values = ''

def create_sequence():
    df = pd.read_csv('sequence_meritor.csv')
    seq_list = []
    for index in df.index:
        seq_list.append(df['json_name'][index])
    print(seq_list)
    return seq_list

# seq = create_sequence()

# ingest_data_into_database('base_price.csv','base_price')

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


seq = create_sequence()

#for item in seq:
#     if str(item) == 'nan':
#         continue
#     csv_name = item + '.csv'
#     print(csv_name)
#     inp = int(input("Enter 1 to proceed"))
#     if inp == 1:
#      ingest_data_into_database(csv_name,item)

ingest_data_into_database('pr_us_err2.csv','part_regional')

alterSequence('part_regional')
