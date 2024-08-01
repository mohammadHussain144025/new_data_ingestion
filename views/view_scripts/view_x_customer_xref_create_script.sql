-- View: public.view_x_customer_xref

-- DROP VIEW public.view_x_customer_xref;

CREATE OR REPLACE VIEW public.view_x_customer_xref AS
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
   FROM x_customer_xref x_customer_xref;;

ALTER TABLE public.view_x_customer_xref
    OWNER TO postgres;