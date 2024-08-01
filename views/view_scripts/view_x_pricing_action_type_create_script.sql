-- View: public.view_x_pricing_action_type

-- DROP VIEW public.view_x_pricing_action_type;

CREATE OR REPLACE VIEW public.view_x_pricing_action_type AS
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
   FROM x_pricing_action_type x_pricing_action_type;;

ALTER TABLE public.view_x_pricing_action_type
    OWNER TO postgres;