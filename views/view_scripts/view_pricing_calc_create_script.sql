-- View: public.view_pricing_calc

-- DROP VIEW public.view_pricing_calc;

CREATE OR REPLACE VIEW public.view_pricing_calc AS
SELECT pricing_calc.code,
    pricing_calc.name,
    pricing_calc.trans_rate,
    pricing_calc.prod_x_rate,
    pricing_calc.b_rate,
    pricing_calc.f_rate,
    pricing_calc.ll,
    pricing_calc.ul,
    pricing_calc.pr,
    pricing_calc.sm,
    pricing_calc.pdcd,
    pricing_calc.wd,
    pricing_calc.oef,
    pricing_calc.oes,
    pricing_calc.dis,
    pricing_calc.eu,
    pricing_calc.nc,
    x_product_code_1_digit_prodcd1.id AS prodcd1,
    x_product_code_1_digit_prodcd1.name AS prodcd1_name,
    x_product_code_1_digit_prodcd1.code AS prodcd1_code,
    x_product_code_3_digit_prodcd3.id AS prodcd3,
    x_product_code_3_digit_prodcd3.name AS prodcd3_name,
    x_product_code_3_digit_prodcd3.code AS prodcd3_code,
    pricing_calc.brand,
    pricing_calc.vndr,
    x_yes_no_flag_dom_int.id AS dom_int,
    x_yes_no_flag_dom_int.name AS dom_int_name,
    x_yes_no_flag_dom_int.code AS dom_int_code,
    x_interplant_ext_int.id AS ext_int,
    x_interplant_ext_int.name AS ext_int_name,
    x_interplant_ext_int.code AS ext_int_code,
    x_pricing_method_method.id AS method,
    x_pricing_method_method.name AS method_name,
    x_pricing_method_method.code AS method_code,
    pricing_calc.id,
    pricing_calc.updated_by,
    pricing_calc.updated_date,
    pricing_calc.validationstatus,
    pricing_calc.is_valid,
    pricing_calc.created_date,
    pricing_calc.created_by,
    pricing_calc.comment
   FROM (((((pricing_calc pricing_calc
     LEFT JOIN x_yes_no_flag x_yes_no_flag_dom_int ON ((pricing_calc.dom_int = x_yes_no_flag_dom_int.id)))
     LEFT JOIN x_product_code_3_digit x_product_code_3_digit_prodcd3 ON ((pricing_calc.prodcd3 = x_product_code_3_digit_prodcd3.id)))
     LEFT JOIN x_interplant x_interplant_ext_int ON ((pricing_calc.ext_int = x_interplant_ext_int.id)))
     LEFT JOIN x_pricing_method x_pricing_method_method ON ((pricing_calc.method = x_pricing_method_method.id)))
     LEFT JOIN x_product_code_1_digit x_product_code_1_digit_prodcd1 ON ((pricing_calc.prodcd1 = x_product_code_1_digit_prodcd1.id)));;

ALTER TABLE public.view_pricing_calc
    OWNER TO postgres;