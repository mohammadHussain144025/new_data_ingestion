-- View: public.view_nprice

-- DROP VIEW public.view_nprice;

CREATE OR REPLACE VIEW public.view_nprice AS
SELECT nprice.name,
    nprice.code,
    nprice.tcode,
    nprice.pnum,
    x_pricing_method_prcmeth.id AS prcmeth,
    x_pricing_method_prcmeth.name AS prcmeth_name,
    x_pricing_method_prcmeth.code AS prcmeth_code,
    nprice.snet,
    nprice.disc,
    nprice.net2,
    nprice.net3,
    nprice.net4,
    nprice.net5,
    nprice.disc1,
    nprice.disc2,
    nprice.disc3,
    nprice.disc4,
    nprice.disc5,
    x_product_code_3_digit_pcode3.id AS pcode3,
    x_product_code_3_digit_pcode3.name AS pcode3_name,
    x_product_code_3_digit_pcode3.code AS pcode3_code,
    nprice.pcode5,
    x_brand_brand.id AS brand,
    x_brand_brand.name AS brand_name,
    x_brand_brand.code AS brand_code,
    nprice.id,
    nprice.is_valid,
    nprice.created_date,
    nprice.created_by,
    nprice.updated_date,
    nprice.updated_by,
    nprice.comment
   FROM (((nprice nprice
     LEFT JOIN x_brand x_brand_brand ON ((nprice.brand = x_brand_brand.id)))
     LEFT JOIN x_pricing_method x_pricing_method_prcmeth ON ((nprice.prcmeth = x_pricing_method_prcmeth.id)))
     LEFT JOIN x_product_code_3_digit x_product_code_3_digit_pcode3 ON ((nprice.pcode3 = x_product_code_3_digit_pcode3.id)));;

ALTER TABLE public.view_nprice
    OWNER TO postgres;