-- View: public.view_x_product_code_3_digit

-- DROP VIEW public.view_x_product_code_3_digit;

CREATE OR REPLACE VIEW public.view_x_product_code_3_digit AS
SELECT name,
    code,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM x_product_code_3_digit x_product_code_3_digit;;

ALTER TABLE public.view_x_product_code_3_digit
    OWNER TO postgres;