-- View: public.view_currency

-- DROP VIEW public.view_currency;

CREATE OR REPLACE VIEW public.view_currency AS
SELECT p_pricing_region_name.id AS name,
    p_pricing_region_name.name AS name_name,
    p_pricing_region_name.code AS name_code,
    x_product_code_1_digit_prod1.id AS prod1,
    x_product_code_1_digit_prod1.name AS prod1_name,
    x_product_code_1_digit_prod1.code AS prod1_code,
    p_pricing_region_rcode.id AS rcode,
    p_pricing_region_rcode.name AS rcode_name,
    p_pricing_region_rcode.code AS rcode_code,
    currency.code,
    currency.fx,
    currency.stdt,
    currency.enddt,
    currency.id,
    currency.updated_by,
    currency.updated_date,
    currency.validationstatus,
    currency.is_valid,
    currency.created_date,
    currency.created_by,
    currency.comment
   FROM (((currency currency
     LEFT JOIN x_product_code_1_digit x_product_code_1_digit_prod1 ON ((currency.prod1 = x_product_code_1_digit_prod1.id)))
     LEFT JOIN p_pricing_region p_pricing_region_name ON ((currency.name = p_pricing_region_name.id)))
     LEFT JOIN p_pricing_region p_pricing_region_rcode ON ((currency.rcode = p_pricing_region_rcode.id)));;

ALTER TABLE public.view_currency
    OWNER TO postgres;