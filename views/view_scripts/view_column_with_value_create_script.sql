-- View: public.view_column_with_value

-- DROP VIEW public.view_column_with_value;

CREATE OR REPLACE VIEW public.view_column_with_value AS
SELECT code,
    columns_with_value_yes,
    columns_with_value_no
   FROM get_columns_with_values() get_columns_with_values(code, columns_with_value_yes, columns_with_value_no);;

ALTER TABLE public.view_column_with_value
    OWNER TO postgres;