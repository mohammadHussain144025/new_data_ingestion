-- View: public.view_x_pr_att_change

-- DROP VIEW public.view_x_pr_att_change;

CREATE OR REPLACE VIEW public.view_x_pr_att_change AS
SELECT name,
    code,
    part_num,
    o_pt_status,
    n_pt_status,
    o_vndr,
    n_vndr,
    add_dt,
    id,
    is_valid,
    created_date,
    created_by,
    updated_date,
    updated_by,
    comment
   FROM x_pr_att_change x_pr_att_change;;

ALTER TABLE public.view_x_pr_att_change
    OWNER TO postgres;