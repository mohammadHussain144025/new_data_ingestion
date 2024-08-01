-- View: public.view_x_channel

-- DROP VIEW public.view_x_channel;

CREATE OR REPLACE VIEW public.view_x_channel AS
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
   FROM x_channel x_channel;;

ALTER TABLE public.view_x_channel
    OWNER TO postgres;