>> sets the sequence of the id column in the sf_approved_quotes table to the maximum id value found in the table 
 SELECT setval(pg_get_serial_sequence('sf_approved_quotes', 'id'), coalesce(max(id), 1)) FROM sf_approved_quotes

>> alters the table sf_approved_quotes and restarts the sequence of the column id with the value 1977. This means that the next value inserted into the id column will be 1977, and subsequent values will follow the sequence accordingly
 ALTER TABLE sf_approved_quotes ALTER COLUMN id RESTART WITH 1977

>> to check all the created entities in db(pgadmin)
>> open your db and
select * from entity

>>create table manually in db
CREATE TABLE caL (
    Action CHAR(1),
    CustType CHAR(2),
    CustID CHAR(6),
    PartNo CHAR(30),
    Brk1Qty NUMERIC(8),
    Brk1Prc NUMERIC(12,4),
    Brk1PMNam CHAR(20),
    Brk1PMLvl CHAR(10),
    Brk1PMTyp CHAR(10),
    Brk2Qty NUMERIC(8),
    Brk2Prc NUMERIC(12,4),
    Brk2PMNam CHAR(20),
    Brk2PMLvl CHAR(10),
    Brk2PMTyp CHAR(10),
    Brk3Qty NUMERIC(8),
    Brk3Prc NUMERIC(12,4),
    Brk3PMNam CHAR(20),
    Brk3PMLvl CHAR(10),
    Brk3PMTyp CHAR(10),
    Brk4Qty NUMERIC(8),
    Brk4Prc NUMERIC(12,4),
    Brk4PMNam CHAR(20),
    Brk4PMLvl CHAR(10),
    Brk4PMTyp CHAR(10),
    Brk5Qty NUMERIC(8),
    Brk5Prc NUMERIC(12,4),
    Brk5PMNam CHAR(20),
    Brk5PMLvl CHAR(10),
    Brk5PMTyp CHAR(10),
    Brk6Qty NUMERIC(8),
    Brk6Prc NUMERIC(12,4),
    Brk6PMNam CHAR(20),
    Brk6PMLvl CHAR(10),
    Brk6PMTyp CHAR(10),
    Brk7Qty NUMERIC(8),
    Brk7Prc NUMERIC(12,4),
    Brk7PMNam CHAR(20),
    Brk7PMLvl CHAR(10),
    Brk7PMTyp CHAR(10),
    LastUpdatedDate DATE,
    SendingStatus VARCHAR(250),
    LastSentDate DATE
);

>> To add new columns
ALTER TABLE confidential
ADD COLUMN sain1 VARCHAR(30),
ADD COLUMN sain2 NUMERIC(12);


>> To delete (drop) columns
ALTER TABLE confidential
DROP COLUMN sain1;

>> To delete (drop) columns if the table has data in it
ALTER TABLE list_price
DROP COLUMN pmapp CASCADE;

>> To rename the column name
ALTER TABLE confidential
RENAME COLUMN sain2 TO sain1;

>> To change the datatype of the column
ALTER TABLE confidential
ALTER COLUMN sain1 TYPE CHAR(20) USING sain1::CHAR(20);

>>  To get the max id (last id in the table)
SELECT MAX(id) FROM your_table;



>> to change the precision and scale of a table coloumn if the table is empty
-- Step 1: Drop the dependent view
DROP VIEW IF EXISTS view_sro_rules;

-- Step 2: Alter the column type
ALTER TABLE sro_rules ALTER COLUMN mult TYPE numeric(62,2);

-- Step 3: Recreate the view
CREATE VIEW view_sro_rules AS
SELECT * FROM sro_rules; -- Replace * with specific column names if needed


>> to change the size (precision and scale) of a table coloumn if the table isn't empty {note in this approach you are not changing datatype just increasing precsion or scale}
-- Step 1: Drop the dependent view
DROP VIEW IF EXISTS view_x_sold_to;

-- Step 2: Alter the column type
ALTER TABLE x_sold_to ALTER COLUMN created_by TYPE character(99);

-- Step 3: Recreate the view
CREATE VIEW view_x_sold_to AS
SELECT * FROM x_sold_to; -- Replace * with specific column names if needed

>> to check the definition of the table
SELECT 
    column_name, 
    data_type, 
    CASE 
        WHEN data_type = 'character varying' THEN character_maximum_length::text 
        WHEN data_type = 'character' THEN character_maximum_length::text 
        WHEN data_type = 'numeric' THEN concat(numeric_precision::text, ',', numeric_scale::text)
        ELSE NULL 
    END AS data_type_details
FROM 
    information_schema.columns 
WHERE 
    table_name = 'sro_rules';


>> to check which supporting/refrenced table for columns
SELECT
    kc.column_name AS foreign_key_column,
    ccu.table_name AS referenced_table,
    kcu.column_name AS referenced_column
FROM
    information_schema.key_column_usage AS kc
JOIN
    information_schema.table_constraints AS tc
ON
    kc.constraint_name = tc.constraint_name
JOIN
    information_schema.constraint_column_usage AS ccu
ON
    tc.constraint_name = ccu.constraint_name
JOIN
    information_schema.key_column_usage AS kcu
ON
    ccu.constraint_name = kcu.constraint_name
WHERE
    kc.table_name = 'attr_chnges'
    AND tc.constraint_type = 'FOREIGN KEY';



>>to check the contents (e.g id etc)
select * from x_sold_to


>>run psql on terminal
psql -h 127.0.0.1 -U postgres -d spriced
(provide the password after that)

>> to delete a entity which permission has already been set
    ## 1. get the entitiy id first
    select * from entity where name = 'promos_additions'

    ## 2. To check the entity permission
    select * from role_entity_permission_mapping where entity_id = 103

    ## 2. delete the entity permission
    delete from role_entity_permission_mapping where entity_id = 103

    ## 3. delete entity
    delete from entity where id = 103


>>DELETE THE ENTIRE ROW WHERE (SOME CONDITION) FROM A TABLE
DELETE FROM sro_groups WHERE srocat = 1;

>>TO GET ALL THE ROW VALUES BASED ON SOME ATTRIBUTES VALUE
select * from x_brand WHERE code = 'GEN';

>> to check whether the column is autogenerated or not
SELECT column_name, is_identity
FROM information_schema.columns
WHERE table_name = 'p_doa_seg' AND column_name = 'code';

     ## if above querry returns yes for is_identity column then its autogenerated



>> db sourceData gen
    SELECT 
    c.table_name AS "SPRICED_TABLE_NAME",
    c.table_name AS "Table_Display_Name",
    c.table_schema AS "TABLE_SCHEMA",
    initcap(replace(c.column_name, '_', ' ')) AS "DISPLAY_NAME", 
    c.column_name AS "DISPLAY_NAME", -- Placeholder, will update manually if necessary
    c.data_type AS "DATA_TYPE",
    COALESCE(c.character_maximum_length, c.numeric_precision) AS "SIZE",
    c.ordinal_position AS "POS",
    CASE 
        WHEN c.is_nullable = 'YES' THEN 'yes'
        ELSE 'no'
    END AS "IS_NULLABLE",
    CASE 
        WHEN tc.constraint_type = 'FOREIGN KEY' THEN 'TRUE'
        ELSE 'FALSE'
    END AS "IS_REF_COLUMN",
    CASE 
        WHEN tc.constraint_type = 'UNIQUE' THEN 'TRUE'
        ELSE 'FALSE'
    END AS "UNIQUE_CONSTRAINT",
    CASE 
        WHEN tc.constraint_type = 'PRIMARY KEY' THEN 'TRUE'
        ELSE 'FALSE'
    END AS "PRIMARY_KEY",
    CASE 
        WHEN c.column_default LIKE 'nextval%' THEN 'TRUE'
        ELSE 'FALSE'
    END AS "AUTOGEN",
    NULL AS "Ref"
FROM 
    information_schema.columns c
LEFT JOIN 
    information_schema.key_column_usage kcu 
    ON c.table_name = kcu.table_name 
    AND c.column_name = kcu.column_name 
    AND c.table_schema = kcu.table_schema
LEFT JOIN 
    information_schema.table_constraints tc 
    ON kcu.constraint_name = tc.constraint_name 
    AND kcu.table_schema = tc.table_schema
WHERE 
    c.table_schema = 'public'
ORDER BY 
    c.table_name, c.ordinal_position;

>> to update prod_cd1 (product code 1 digit) from prod_cd5(product code 5 digit)
>>for e.g if prod_cd5 = 'abcde' then prod_cd1 should be the first intial from prod_cd5 so prod_cd1 shall have 'a'
>> but prod_cd1 is reffered table so it shall contain the id of 'a' which is integer not string , so to achieve that in part_regional table
UPDATE part_regional
SET prod_cd1 = xpc1d.id
FROM x_product_code_1_digit xpc1d
WHERE substring(part_regional.prod_cd5 FROM 1 FOR 1) = xpc1d.code;

-- Verify the update
SELECT prod_cd5, prod_cd1
FROM part_regional;


>> FOR ENTIRE 1 DIGIT 3 DIGIT set id from product_code1 digit and product code 3 digit {if product code 1 digit and 3 digit is dropdown}
-- Update prod_cd1 in products based on the mapping in x_product_code_1_digit
UPDATE part_regional
SET prod_cd1 = xpc1d.id
FROM x_product_code_1_digit xpc1d
WHERE substring(part_regional.prod_cd5 FROM 1 FOR 1) = xpc1d.code;

-- Update prod_cd3 in products based on the mapping in x_product_code_3_digit
UPDATE part_regional
SET prod_cd3 = xpc3d.id
FROM x_product_code_3_digit xpc3d
WHERE substring(part_regional.prod_cd5 FROM 1 FOR 3) = xpc3d.code;

-- Verify the updates
SELECT prod_cd5, prod_cd1, prod_cd3
FROM part_regional;

>> FOR ENTIRE 1 DIGIT 3 DIGIT set value {if product code 1 digit and 3 digit is not dropdown}
UPDATE list_price
SET pcode1 = SUBSTRING(pcode5 FROM 1 FOR 1);

UPDATE list_price
SET pcode3 = SUBSTRING(pcode5 FROM 1 FOR 3);




>> Q) >> /** i have a table name 'part_regional' which has following columns
part_num
lprc
prtstat

prod_cd1
prod_cd3
prod_cd5

and i have one more table named 'pricing_changes_planning'
which contains the following columns
part

pcode5
prodcd3
prodcd1

now want to perform an operation in psql
if (part_num == part && lprc > 0 && prtstat == 'A )
	then add  
		prod_cd1
		prod_cd3
		prod_cd5
	from part_regional
to 
	pcode5
	prodcd3
	prodcd1
in pricing_changes_planning **/


>>querry>>
UPDATE pricing_changes_planning pcp
SET 
    pcode5 = pr.prod_cd5,
    prodcd3 = pr.prod_cd3,
    prodcd1 = pr.prod_cd1
FROM part_regional pr
WHERE 
    pr.part_num = pcp.part
    AND pr.lprc > 0
    AND pr.prtstat = 'A';

--to see the operated data
SELECT pr.part_num, pcp.part, pcp.pcode5, pcp.prodcd3, pcp.prodcd1, pr.prod_cd5, pr.prod_cd3, pr.prod_cd1
FROM pricing_changes_planning pcp
JOIN part_regional pr ON pr.part_num = pcp.part
WHERE pr.lprc > 0 AND pr.prtstat = 'A';

>> to change the datatype of the column even it contains data in it
    step.1) open pgAdmin
    step.2) go to the views in the database and delete the view for the table whose column's datatype should be changed
    step.3) now right click on the table and go to the properties section and manually change the datatype
    NOTE :  {this approach has worked upon changing datatype from bigint to numeric(63,2)}


>> --------------------------------------------------------------------------------------------
>>To make the code autogenerated for technical_part_details table (replace technical_part_details with your table name and execute the querry one by one)

CREATE SEQUENCE public.technical_part_details_code_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER TABLE public.technical_part_details
ALTER COLUMN code SET DEFAULT nextval('public.technical_part_details_code_seq'::regclass);
ALTER TABLE public.technical_part_details
ADD CONSTRAINT uk_technical_part_details_code UNIQUE (code);

ALTER SEQUENCE public.technical_part_details_code_seq
OWNED BY public.technical_part_details.code;

--take max id + 1 for next querryALTER SEQUENCE public.technical_part_details_code_seq
SELECT MAX(code::int) FROM technical_part_details;

SELECT setval('public.technical_part_details_code_seq', 3 , true)

-- this following will return you json, in that json make "editable": "false" for code
 select * from entity where name in ('xgpl_priority','technical_part_details')
-- then go to view of your table then create script before deleting the view and then delete and then re run the script
-- after clicking on ok , save it --

CREATE OR REPLACE FUNCTION public.technical_part_details_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    -- Check if code is NULL and replace it with the next value from the sequence
    IF NEW.code IS NULL THEN
        NEW.code := nextval('public.technical_part_details_code_seq'::regclass);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER technical_part_details_before_insert_trigger
BEFORE INSERT ON public.technical_part_details
FOR EACH ROW EXECUTE FUNCTION public.technical_part_details_before_insert();

CREATE OR REPLACE FUNCTION public.technical_part_details_before_update()
RETURNS TRIGGER AS $$
BEGIN
    -- Check if new code is different from the old code
    IF NEW.code <> OLD.code THEN
        -- Option 1: Raise an exception to prevent the update
        -- RAISE EXCEPTION 'Updating the code value is not allowed.';

        -- Option 2: Revert the code to the original value
        NEW.code := OLD.code;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER technical_part_details_before_update_trigger
BEFORE UPDATE ON public.technical_part_details
FOR EACH ROW EXECUTE FUNCTION public.technical_part_details_before_update();


CREATE OR REPLACE FUNCTION prevent_code_null()
RETURNS TRIGGER AS $$
BEGIN
    -- Check if NEW.code is null and OLD.code is not null
    IF NEW.code IS NULL AND OLD.code IS NOT NULL THEN
        -- Retain the existing value of code
        NEW.code := OLD.code;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_prevent_code_null
BEFORE UPDATE ON technical_part_details
FOR EACH ROW
EXECUTE FUNCTION prevent_code_null();

 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
$$

>> to change the required column as normal column (which can be empty)

right click go to properties and trun off the isNullable radio button and then 
>> select * from entity where name = 'franchise' 
the above command will return json where you need to make "nullable" : true
then click ok and then save

>> for changing it to date format right click and then go to the properties

