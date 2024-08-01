-- View: public.view_padminowner

-- DROP VIEW public.view_padminowner;

CREATE OR REPLACE VIEW public.view_padminowner AS
SELECT padminowner.id,
    padminowner.name,
    x_product_code_3_digit_dig3.id AS dig3,
    x_product_code_3_digit_dig3.name AS dig3_name,
    x_product_code_3_digit_dig3.code AS dig3_code,
    padminowner.dw3cd,
    x_calc_name_lpcalc.id AS lpcalc,
    x_calc_name_lpcalc.name AS lpcalc_name,
    x_calc_name_lpcalc.code AS lpcalc_code,
    x_pricing_method_method.id AS method,
    x_pricing_method_method.name AS method_name,
    x_pricing_method_method.code AS method_code,
    padminowner.code,
    org_chart_pmcode.id AS pmcode,
    org_chart_pmcode.name AS pmcode_name,
    org_chart_pmcode.code AS pmcode_code,
    x_product_code_1_digit_dig1.id AS dig1,
    x_product_code_1_digit_dig1.name AS dig1_name,
    x_product_code_1_digit_dig1.code AS dig1_code,
    x_pricing_analyst_pa.id AS pa,
    x_pricing_analyst_pa.name AS pa_name,
    x_pricing_analyst_pa.code AS pa_code,
    padminowner.core,
    padminowner.prodgrp,
    padminowner.note,
    padminowner.pmmgr,
    x_segment_type_segtype.id AS segtype,
    x_segment_type_segtype.name AS segtype_name,
    x_segment_type_segtype.code AS segtype_code,
    sro_attributes_srocat.id AS srocat,
    sro_attributes_srocat.name AS srocat_name,
    sro_attributes_srocat.code AS srocat_code,
    padminowner.updated_by,
    padminowner.updated_date,
    padminowner.validationstatus,
    padminowner.is_valid,
    padminowner.created_date,
    padminowner.created_by,
    padminowner.comment
   FROM ((((((((padminowner padminowner
     LEFT JOIN x_pricing_analyst x_pricing_analyst_pa ON ((padminowner.pa = x_pricing_analyst_pa.id)))
     LEFT JOIN x_product_code_3_digit x_product_code_3_digit_dig3 ON ((padminowner.dig3 = x_product_code_3_digit_dig3.id)))
     LEFT JOIN sro_attributes sro_attributes_srocat ON ((padminowner.srocat = sro_attributes_srocat.id)))
     LEFT JOIN org_chart org_chart_pmcode ON ((padminowner.pmcode = org_chart_pmcode.id)))
     LEFT JOIN x_pricing_method x_pricing_method_method ON ((padminowner.method = x_pricing_method_method.id)))
     LEFT JOIN x_segment_type x_segment_type_segtype ON ((padminowner.segtype = x_segment_type_segtype.id)))
     LEFT JOIN x_product_code_1_digit x_product_code_1_digit_dig1 ON ((padminowner.dig1 = x_product_code_1_digit_dig1.id)))
     LEFT JOIN x_calc_name x_calc_name_lpcalc ON ((padminowner.lpcalc = x_calc_name_lpcalc.id)));;

ALTER TABLE public.view_padminowner
    OWNER TO postgres;