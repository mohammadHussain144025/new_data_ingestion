-- View: public.view_x_pricing_analyst

-- DROP VIEW public.view_x_pricing_analyst;

CREATE OR REPLACE VIEW public.view_x_pricing_analyst AS
SELECT id,
    code,
    name,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM x_pricing_analyst x_pricing_analyst;;

ALTER TABLE public.view_x_pricing_analyst
    OWNER TO postgres;