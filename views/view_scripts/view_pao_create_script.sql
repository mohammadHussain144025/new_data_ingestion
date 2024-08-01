-- View: public.view_pao

-- DROP VIEW public.view_pao;

CREATE OR REPLACE VIEW public.view_pao AS
SELECT pao.method_code,
    pao.dig3_name,
    pao.dig3,
    pao.srocat_code,
    view_column_with_value.columns_with_value_no,
    view_column_with_value.columns_with_value_yes
   FROM (view_padminowner pao
     JOIN view_column_with_value ON ((view_column_with_value.code = (pao.srocat_code)::text)))
  WHERE ((pao.method_code)::text = 'SRO'::text);;

ALTER TABLE public.view_pao
    OWNER TO postgres;