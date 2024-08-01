-- View: public.view_x_leader_follower

-- DROP VIEW public.view_x_leader_follower;

CREATE OR REPLACE VIEW public.view_x_leader_follower AS
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
   FROM x_leader_follower x_leader_follower;;

ALTER TABLE public.view_x_leader_follower
    OWNER TO postgres;