"! <p class="shorttext synchronized" lang="en">Abstract class of reports</p>
class ZSD_CL_REPORTS_ABSTRACT definition
  public
  abstract
  create public .

public section.

  interfaces ZSD_IF_REP_PROCESSING .
  interfaces ZSD_IF_SELECTION_PARAMETER .
  interfaces ZSD_IF_BASE_REPORTS
      abstract methods DETERMINE
                       SELECT .

    "! <p class="shorttext synchronized" lang="en">CONSTRUCTOR</p>
  methods CONSTRUCTOR .
  PROTECTED SECTION.

    "! <p class="shorttext synchronized" lang="en">Kind of a report</p>
    DATA mv_kind_report TYPE zsd_kind_report .
    "! <p class="shorttext synchronized" lang="en">Open Order Select Options</p>
    DATA mw_select_options TYPE zsd_str_oo_select_options .
    "! <p class="shorttext synchronized" lang="en">Abstract class of reports</p>
    DATA this TYPE REF TO zsd_cl_reports_abstract .
  PRIVATE SECTION.
ENDCLASS.



CLASS ZSD_CL_REPORTS_ABSTRACT IMPLEMENTATION.


  METHOD constructor.

    IF xsdbool( cl_lcr_util=>instanceof( object = me class = to_upper( 'zsd_cl_open_order' ) ) = abap_true ) = abap_true.
      mv_kind_report = 'ZOOR'.
    ENDIF.

    this = me.

  ENDMETHOD.


  METHOD zsd_if_rep_processing~calculation.

  ENDMETHOD.


  METHOD zsd_if_selection_parameter~add_param.

    DATA: lr_descr TYPE REF TO cl_abap_typedescr.

    DATA(lv_assign) = |MW_SELECT_OPTIONS-{ iv_param_name }|.

    TRY.
        " Try to receive a table descriptor
        lr_descr = CAST cl_abap_tabledescr( cl_abap_typedescr=>describe_by_data_ref( ir_param_value ) ).
      CATCH cx_sy_move_cast_error.
        TRY.
            " Try to receive an element descriptor
            lr_descr = CAST cl_abap_elemdescr( cl_abap_typedescr=>describe_by_data_ref( ir_param_value ) ).
          CATCH cx_sy_move_cast_error.
            lr_descr = CAST cl_abap_structdescr( cl_abap_typedescr=>describe_by_data_ref( ir_param_value ) ).
        ENDTRY.
    ENDTRY.

    IF xsdbool( lr_descr IS INSTANCE OF cl_abap_tabledescr ) = abap_true.
      ASSIGN (lv_assign) TO FIELD-SYMBOL(<lv_rec>).
      ASSIGN ir_param_value->* TO FIELD-SYMBOL(<lt_table>).
      IF xsdbool(
            xsdbool( <lv_rec> IS ASSIGNED ) = abap_true
        AND xsdbool( <lt_table> IS ASSIGNED ) = abap_true ) = abap_true.
        <lv_rec> = <lt_table>.
      ENDIF.
    ELSEIF xsdbool( lr_descr IS INSTANCE OF cl_abap_elemdescr ) = abap_true.
      ASSIGN (lv_assign) TO <lv_rec>.
      ASSIGN ir_param_value->* TO FIELD-SYMBOL(<lv_any>).
      IF xsdbool(
            xsdbool( <lv_rec> IS ASSIGNED ) = abap_true
        AND xsdbool( <lv_any> IS ASSIGNED ) = abap_true ) = abap_true.
        <lv_rec> = <lv_any>.
      ENDIF.
    ENDIF.

    rr_parameter = me.

  ENDMETHOD.
ENDCLASS.
