-- View: public.view_p_service_exchange

-- DROP VIEW public.view_p_service_exchange;

CREATE OR REPLACE VIEW public.view_p_service_exchange AS
SELECT p_service_exchange.code,
    x_service_exchange_name.id AS name,
    x_service_exchange_name.name AS name_name,
    x_service_exchange_name.code AS name_code,
    p_service_exchange.id,
    p_service_exchange.updated_by,
    p_service_exchange.updated_date,
    p_service_exchange.validationstatus,
    p_service_exchange.is_valid,
    p_service_exchange.created_date,
    p_service_exchange.created_by,
    p_service_exchange.comment
   FROM (p_service_exchange p_service_exchange
     LEFT JOIN x_service_exchange x_service_exchange_name ON ((p_service_exchange.name = x_service_exchange_name.id)));;

ALTER TABLE public.view_p_service_exchange
    OWNER TO postgres;