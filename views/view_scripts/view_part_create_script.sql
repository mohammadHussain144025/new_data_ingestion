-- View: public.view_part

-- DROP VIEW public.view_part;

CREATE OR REPLACE VIEW public.view_part AS
SELECT part.name,
    x_dw_3_digit_dwatt_3.id AS dwatt_3,
    x_dw_3_digit_dwatt_3.name AS dwatt_3_name,
    x_dw_3_digit_dwatt_3.code AS dwatt_3_code,
    part.endprodt,
    part.part_num,
    part.code,
    part.unpck,
    part.new_reman,
    part.flo_wgt,
    part.cat_code,
    part.cr_dt,
    part.cr_by,
    part.yroutprod,
    part.srvce_ex,
    part.dwatt_1,
    part.id,
    part.updated_by,
    part.updated_date,
    part.validationstatus,
    part.is_valid,
    part.created_date,
    part.created_by,
    part.comment
   FROM (part part
     LEFT JOIN x_dw_3_digit x_dw_3_digit_dwatt_3 ON ((part.dwatt_3 = x_dw_3_digit_dwatt_3.id)));;

ALTER TABLE public.view_part
    OWNER TO postgres;