-- View: public.temp_list_price

-- DROP VIEW public.temp_list_price;

CREATE OR REPLACE VIEW public.temp_list_price AS
SELECT code AS "Code",
    partnum AS "Compressed Part Number",
    pcode5 AS "Product Code  - 5 Digit",
    pcode3 AS "Product Code - 3 Digit",
    pcode1 AS "Product Code - 1 Digit",
    segment AS "Segment Type",
    rsegflag AS "Ready For Segmentation Flag",
    pmethod AS "Pricing Method",
    international AS "International",
    interorev AS "Interplant or External Vendor",
    kitflag AS "KIT Flag",
    lpriceus AS "List Price - US",
    fromdat AS "Applicable From Date",
    spriceus AS "Suggested List Price - US",
    uncapprc AS "Uncapped SRO Price",
    lpriceca AS "List Price - Canada",
    lpricel AS "Lower Price Limit",
    pricelim AS "Upper Price Limit",
    plpus AS "Phantom List Price - US",
    plpcan AS "Phantom List Price - Canada",
    powner AS "Part Owner",
    reason AS "Reason For Change",
    changeby AS "Changed By",
    paapp AS "Pricing Analyst Approval",
    pdl1vapp AS "Product Director LV1 Approval",
    pdl2vapp AS "Product Director LV2 Approval",
    pmleadap AS "Product Manager Leader Approval",
    pmapp AS "Pricing Manager Approval",
    pmaapp AS "Prcng Manager Approval",
    edapp AS "Executive Director Approval",
    pdapp AS "Pricing Director Approval",
    rejection_reason AS "Rejection Reason",
    name AS "Calculator Name",
    spricecan AS "Suggested List Price - Canada",
    costie AS "Cost Interplant or External",
    apart AS "Anchor Part",
    id,
    updated_by AS "Updated By",
    updated_date AS "Last Updated On",
    validationstatus AS "Validation Status",
    is_valid AS "Is Valid",
    created_date AS "Created On",
    created_by AS "Created By",
    comment AS "Annotation"
   FROM list_price;;

ALTER TABLE public.temp_list_price
    OWNER TO postgres;