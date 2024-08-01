-- View: public.view_franchise

-- DROP VIEW public.view_franchise;

CREATE OR REPLACE VIEW public.view_franchise AS
SELECT franchise.id,
    franchise.frands,
    franchise.code,
    franchise.name,
    franchise.francdn,
    franchise.frprotect,
    franchise.frovr,
    franchise.froemflag,
    franchise.frdstflag,
    franchise.freucflag,
    franchise.frmerpbook,
    franchise.freucpbook,
    franchise.fransmsg,
    x_yes_no_flag_paexcept.id AS paexcept,
    x_yes_no_flag_paexcept.name AS paexcept_name,
    x_yes_no_flag_paexcept.code AS paexcept_code,
    franchise.updated_by,
    franchise.updated_date,
    franchise.validationstatus,
    franchise.is_valid,
    franchise.created_date,
    franchise.created_by,
    franchise.comment
   FROM (franchise franchise
     LEFT JOIN x_yes_no_flag x_yes_no_flag_paexcept ON ((franchise.paexcept = x_yes_no_flag_paexcept.id)));;

ALTER TABLE public.view_franchise
    OWNER TO postgres;