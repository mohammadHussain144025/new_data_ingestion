-- View: public.view_cust_price_file

-- DROP VIEW public.view_cust_price_file;

CREATE OR REPLACE VIEW public.view_cust_price_file AS
SELECT cust_price_file.id,
    cust_price_file.code,
    cust_price_file.name,
    x_yes_no_flag_f022.id AS f022,
    x_yes_no_flag_f022.name AS f022_name,
    x_yes_no_flag_f022.code AS f022_code,
    x_yes_no_flag_f024.id AS f024,
    x_yes_no_flag_f024.name AS f024_name,
    x_yes_no_flag_f024.code AS f024_code,
    x_yes_no_flag_f027.id AS f027,
    x_yes_no_flag_f027.name AS f027_name,
    x_yes_no_flag_f027.code AS f027_code,
    x_yes_no_flag_f573.id AS f573,
    x_yes_no_flag_f573.name AS f573_name,
    x_yes_no_flag_f573.code AS f573_code,
    x_yes_no_flag_f576.id AS f576,
    x_yes_no_flag_f576.name AS f576_name,
    x_yes_no_flag_f576.code AS f576_code,
    x_yes_no_flag_f581.id AS f581,
    x_yes_no_flag_f581.name AS f581_name,
    x_yes_no_flag_f581.code AS f581_code,
    cust_price_file.updated_by,
    cust_price_file.updated_date,
    cust_price_file.validationstatus,
    cust_price_file.is_valid,
    cust_price_file.created_date,
    cust_price_file.created_by,
    cust_price_file.comment
   FROM ((((((cust_price_file cust_price_file
     LEFT JOIN x_yes_no_flag x_yes_no_flag_f573 ON ((cust_price_file.f573 = x_yes_no_flag_f573.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_f022 ON ((cust_price_file.f022 = x_yes_no_flag_f022.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_f581 ON ((cust_price_file.f581 = x_yes_no_flag_f581.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_f027 ON ((cust_price_file.f027 = x_yes_no_flag_f027.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_f576 ON ((cust_price_file.f576 = x_yes_no_flag_f576.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_f024 ON ((cust_price_file.f024 = x_yes_no_flag_f024.id)));;

ALTER TABLE public.view_cust_price_file
    OWNER TO postgres;