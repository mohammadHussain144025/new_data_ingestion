-- View: public.view_x_service_exchange

-- DROP VIEW public.view_x_service_exchange;

CREATE OR REPLACE VIEW public.view_x_service_exchange AS
SELECT id,
    name,
    code,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM x_service_exchange x_service_exchange;;

ALTER TABLE public.view_x_service_exchange
    OWNER TO postgres;