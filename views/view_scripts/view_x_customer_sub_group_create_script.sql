-- View: public.view_x_customer_sub_group

-- DROP VIEW public.view_x_customer_sub_group;

CREATE OR REPLACE VIEW public.view_x_customer_sub_group AS
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
   FROM x_customer_sub_group x_customer_sub_group;;

ALTER TABLE public.view_x_customer_sub_group
    OWNER TO postgres;