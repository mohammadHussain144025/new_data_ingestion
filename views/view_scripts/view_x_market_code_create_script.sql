-- View: public.view_x_market_code

-- DROP VIEW public.view_x_market_code;

CREATE OR REPLACE VIEW public.view_x_market_code AS
SELECT code,
    name,
    level1,
    level2,
    level3,
    level4,
    level5,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM x_market_code x_market_code;;

ALTER TABLE public.view_x_market_code
    OWNER TO postgres;