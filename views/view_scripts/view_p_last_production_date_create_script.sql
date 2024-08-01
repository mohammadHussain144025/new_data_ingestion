-- View: public.view_p_last_production_date

-- DROP VIEW public.view_p_last_production_date;

CREATE OR REPLACE VIEW public.view_p_last_production_date AS
SELECT p_last_production_date.code,
    p_last_production_date.name,
    x_yes_no_flag_ecode.id AS ecode,
    x_yes_no_flag_ecode.name AS ecode_name,
    x_yes_no_flag_ecode.code AS ecode_code,
    p_last_production_date.id,
    p_last_production_date.updated_by,
    p_last_production_date.updated_date,
    p_last_production_date.validationstatus,
    p_last_production_date.is_valid,
    p_last_production_date.created_date,
    p_last_production_date.created_by,
    p_last_production_date.comment
   FROM (p_last_production_date p_last_production_date
     LEFT JOIN x_yes_no_flag x_yes_no_flag_ecode ON ((p_last_production_date.ecode = x_yes_no_flag_ecode.id)));;

ALTER TABLE public.view_p_last_production_date
    OWNER TO postgres;