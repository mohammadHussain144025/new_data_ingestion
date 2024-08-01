-- View: public.view_new_parts_notification_detail

-- DROP VIEW public.view_new_parts_notification_detail;

CREATE OR REPLACE VIEW public.view_new_parts_notification_detail AS
SELECT new_parts_notification_detail.id,
    x_status_cstatus.id AS cstatus,
    x_status_cstatus.name AS cstatus_name,
    x_status_cstatus.code AS cstatus_code,
    x_priority_priority.id AS priority,
    x_priority_priority.name AS priority_name,
    x_priority_priority.code AS priority_code,
    new_parts_notification_detail.part_num,
    new_parts_notification_detail.code,
    new_parts_notification_detail.name,
    new_parts_notification_detail.pcreated,
    new_parts_notification_detail.priorityd,
    new_parts_notification_detail.email,
    new_parts_notification_detail.pa,
    new_parts_notification_detail.lecpm,
    new_parts_notification_detail.psegon,
    new_parts_notification_detail.pseton,
    new_parts_notification_detail.partown,
    new_parts_notification_detail.espon,
    new_parts_notification_detail.stat,
    new_parts_notification_detail.immflag,
    new_parts_notification_detail.unassflag,
    new_parts_notification_detail.compflag,
    new_parts_notification_detail.rem3hr,
    new_parts_notification_detail.remflag,
    new_parts_notification_detail.updated_by,
    new_parts_notification_detail.updated_date,
    new_parts_notification_detail.validationstatus,
    new_parts_notification_detail.is_valid,
    new_parts_notification_detail.created_date,
    new_parts_notification_detail.created_by,
    new_parts_notification_detail.comment
   FROM ((new_parts_notification_detail new_parts_notification_detail
     LEFT JOIN x_priority x_priority_priority ON ((new_parts_notification_detail.priority = x_priority_priority.id)))
     LEFT JOIN x_status x_status_cstatus ON ((new_parts_notification_detail.cstatus = x_status_cstatus.id)));;

ALTER TABLE public.view_new_parts_notification_detail
    OWNER TO postgres;