-- View: public.view_x_customer_main_group

-- DROP VIEW public.view_x_customer_main_group;

CREATE OR REPLACE VIEW public.view_x_customer_main_group AS
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
   FROM x_customer_main_group x_customer_main_group;;

ALTER TABLE public.view_x_customer_main_group
    OWNER TO postgres;