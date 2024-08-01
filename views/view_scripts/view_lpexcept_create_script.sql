-- View: public.view_lpexcept

-- DROP VIEW public.view_lpexcept;

CREATE OR REPLACE VIEW public.view_lpexcept AS
SELECT lpexcept.id,
    x_brand_brnd.id AS brnd,
    x_brand_brnd.name AS brnd_name,
    x_brand_brnd.code AS brnd_code,
    x_yes_no_flag_lpexcept.id AS lpexcept,
    x_yes_no_flag_lpexcept.name AS lpexcept_name,
    x_yes_no_flag_lpexcept.code AS lpexcept_code,
    x_product_code_3_digit_pcode3.id AS pcode3,
    x_product_code_3_digit_pcode3.name AS pcode3_name,
    x_product_code_3_digit_pcode3.code AS pcode3_code,
    lpexcept.pnum,
    lpexcept.code,
    lpexcept.name,
    lpexcept.fcode,
    lpexcept.updated_by,
    lpexcept.updated_date,
    lpexcept.validationstatus,
    lpexcept.is_valid,
    lpexcept.created_date,
    lpexcept.created_by,
    lpexcept.comment
   FROM (((lpexcept lpexcept
     LEFT JOIN x_brand x_brand_brnd ON ((lpexcept.brnd = x_brand_brnd.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_lpexcept ON ((lpexcept.lpexcept = x_yes_no_flag_lpexcept.id)))
     LEFT JOIN x_product_code_3_digit x_product_code_3_digit_pcode3 ON ((lpexcept.pcode3 = x_product_code_3_digit_pcode3.id)));;

ALTER TABLE public.view_lpexcept
    OWNER TO postgres;