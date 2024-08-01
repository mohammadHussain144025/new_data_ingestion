-- View: public.view_dwcode

-- DROP VIEW public.view_dwcode;

CREATE OR REPLACE VIEW public.view_dwcode AS
SELECT name,
    code,
    part_num,
    dw1_cd,
    dw3_cd,
    dw1_old,
    dw3_old,
    add_dt,
    id,
    is_valid,
    created_date,
    created_by,
    updated_date,
    updated_by,
    comment
   FROM dwcode dwcode;;

ALTER TABLE public.view_dwcode
    OWNER TO postgres;