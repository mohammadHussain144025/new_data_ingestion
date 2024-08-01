-- View: public.view_x_dw_1_digit

-- DROP VIEW public.view_x_dw_1_digit;

CREATE OR REPLACE VIEW public.view_x_dw_1_digit AS
SELECT name,
    code,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM x_dw_1_digit x_dw_1_digit;;

ALTER TABLE public.view_x_dw_1_digit
    OWNER TO postgres;