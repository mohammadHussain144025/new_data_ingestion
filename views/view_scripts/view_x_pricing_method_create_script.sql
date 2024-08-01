-- View: public.view_x_pricing_method

-- DROP VIEW public.view_x_pricing_method;

CREATE OR REPLACE VIEW public.view_x_pricing_method AS
SELECT code,
    name,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM x_pricing_method x_pricing_method;;

ALTER TABLE public.view_x_pricing_method
    OWNER TO postgres;