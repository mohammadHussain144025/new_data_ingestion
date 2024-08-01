-- View: public.view_x_chain

-- DROP VIEW public.view_x_chain;

CREATE OR REPLACE VIEW public.view_x_chain AS
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
   FROM x_chain x_chain;;

ALTER TABLE public.view_x_chain
    OWNER TO postgres;