-- View: public.view_x_product_code_1_digit

-- DROP VIEW public.view_x_product_code_1_digit;

CREATE OR REPLACE VIEW public.view_x_product_code_1_digit AS
SELECT name,
    code,
    cbseg,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM x_product_code_1_digit x_product_code_1_digit;;

ALTER TABLE public.view_x_product_code_1_digit
    OWNER TO postgres;