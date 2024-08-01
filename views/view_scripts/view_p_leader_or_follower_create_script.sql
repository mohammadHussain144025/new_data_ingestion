-- View: public.view_p_leader_or_follower

-- DROP VIEW public.view_p_leader_or_follower;

CREATE OR REPLACE VIEW public.view_p_leader_or_follower AS
SELECT x_leader_follower_name.id AS name,
    x_leader_follower_name.name AS name_name,
    x_leader_follower_name.code AS name_code,
    p_leader_or_follower.code,
    p_leader_or_follower.id,
    p_leader_or_follower.updated_by,
    p_leader_or_follower.updated_date,
    p_leader_or_follower.validationstatus,
    p_leader_or_follower.is_valid,
    p_leader_or_follower.created_date,
    p_leader_or_follower.created_by,
    p_leader_or_follower.comment
   FROM (p_leader_or_follower p_leader_or_follower
     LEFT JOIN x_leader_follower x_leader_follower_name ON ((p_leader_or_follower.name = x_leader_follower_name.id)));;

ALTER TABLE public.view_p_leader_or_follower
    OWNER TO postgres;