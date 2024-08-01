-- View: public.view_tc_cat

-- DROP VIEW public.view_tc_cat;

CREATE OR REPLACE VIEW public.view_tc_cat AS
SELECT tc_cat.name,
    tc_cat.code,
    tc_cat.trkcd,
    tc_cat.trkcd_desc,
    tc_cat.trkcd_cat,
    tc_cat.reg,
    tc_cat.trkcd_align,
    x_yes_no_flag_pvtlbl.id AS pvtlbl,
    x_yes_no_flag_pvtlbl.name AS pvtlbl_name,
    x_yes_no_flag_pvtlbl.code AS pvtlbl_code,
    x_yes_no_flag_mixtk.id AS mixtk,
    x_yes_no_flag_mixtk.name AS mixtk_name,
    x_yes_no_flag_mixtk.code AS mixtk_code,
    x_yes_no_flag_qty.id AS qty,
    x_yes_no_flag_qty.name AS qty_name,
    x_yes_no_flag_qty.code AS qty_code,
    tc_cat.id,
    tc_cat.is_valid,
    tc_cat.created_date,
    tc_cat.created_by,
    tc_cat.updated_date,
    tc_cat.updated_by,
    tc_cat.comment
   FROM (((tc_cat tc_cat
     LEFT JOIN x_yes_no_flag x_yes_no_flag_mixtk ON ((tc_cat.mixtk = x_yes_no_flag_mixtk.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_qty ON ((tc_cat.qty = x_yes_no_flag_qty.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_pvtlbl ON ((tc_cat.pvtlbl = x_yes_no_flag_pvtlbl.id)));;

ALTER TABLE public.view_tc_cat
    OWNER TO postgres;