-- View: public.view_x_customer_type

-- DROP VIEW public.view_x_customer_type;

CREATE OR REPLACE VIEW public.view_x_customer_type AS
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
   FROM x_customer_type x_customer_type;;

ALTER TABLE public.view_x_customer_type
    OWNER TO postgres;