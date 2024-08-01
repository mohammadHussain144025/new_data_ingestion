-- View: public.view_org_chart

-- DROP VIEW public.view_org_chart;

CREATE OR REPLACE VIEW public.view_org_chart AS
SELECT org_chart.id,
    x_pricing_analyst_pa.id AS pa,
    x_pricing_analyst_pa.name AS pa_name,
    x_pricing_analyst_pa.code AS pa_code,
    org_chart.code,
    org_chart.name,
    org_chart.pmmi,
    org_chart.pami,
    org_chart.pml,
    org_chart.pmlmi,
    org_chart.pd,
    org_chart.pdmi,
    org_chart.pdl1,
    org_chart.pdl1mi,
    org_chart.pdl2,
    org_chart.pdl2mi,
    org_chart.ed,
    org_chart.edmi,
    org_chart.prcm,
    org_chart.prcmmi,
    org_chart.updated_by,
    org_chart.updated_date,
    org_chart.validationstatus,
    org_chart.is_valid,
    org_chart.created_date,
    org_chart.created_by,
    org_chart.comment
   FROM (org_chart org_chart
     LEFT JOIN x_pricing_analyst x_pricing_analyst_pa ON ((org_chart.pa = x_pricing_analyst_pa.id)));;

ALTER TABLE public.view_org_chart
    OWNER TO postgres;