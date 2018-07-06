*&---------------------------------------------------------------------*
*&  Include  zsd_open_order_cli
*&---------------------------------------------------------------------*

CLASS zcl_application IMPLEMENTATION.

  METHOD start.

    DATA(lr_parameters) = CAST zsd_if_selection_parameter( NEW zsd_cl_open_order( ) ).

    " Process parameters
    parameters( lr_parameters ).

    " Select open orders w/ particular conditions and determine customer datas, ...
    DATA(lr_open_order) = CAST zsd_if_open_order( lr_parameters )->select( )->determine( )->process( ).

  ENDMETHOD.

  METHOD parameters.
    ir_parameters->add_param( iv_param_name = to_upper( |ccode| ) ir_param_value = REF #( s_bukrs[] ) )->add_param( iv_param_name = to_upper( |exchange_rate_date| ) ir_param_value = REF #( p_exdte ) )->add_param(
                              iv_param_name = to_upper( |sales_organization| ) ir_param_value = REF #( s_vkorg[] ) )->add_param( iv_param_name = to_upper( |distribution_channel| ) ir_param_value = REF #( s_vtweg[] ) )->add_param(
                              iv_param_name = to_upper( |division| ) ir_param_value = REF #( s_spart[] ) )->add_param( iv_param_name = to_upper( |sales_office| ) ir_param_value = REF #( s_vkbur[] ) )->add_param(
                              iv_param_name = to_upper( |delivery_plant| ) ir_param_value = REF #( s_werks[] ) )->add_param( iv_param_name = to_upper( |document_date| ) ir_param_value = REF #( s_audat[] ) )->add_param(
                              iv_param_name = to_upper( |req_del_date| ) ir_param_value = REF #( s_vdatu[] ) )->add_param( iv_param_name = to_upper( |sched_line_date| ) ir_param_value = REF #( s_edatu[] ) )->add_param(
                              iv_param_name = to_upper( |cred_rel_date| ) ir_param_value = REF #( s_crrel[] ) )->add_param( iv_param_name = to_upper( |sales_document| ) ir_param_value = REF #( s_vbeln[] ) )->add_param(
                              iv_param_name = to_upper( |sales_doc_item| ) ir_param_value = REF #( s_posnr[] ) )->add_param( iv_param_name = to_upper( |sales_doc_type| ) ir_param_value = REF #( s_auart[] ) )->add_param(
                              iv_param_name = to_upper( |sold_customer| ) ir_param_value = REF #( s_kunnr[] ) )->add_param( iv_param_name = to_upper( |cust_po_number| ) ir_param_value = REF #( s_bstkd[] ) )->add_param(
                              iv_param_name = to_upper( |created_by| ) ir_param_value = REF #( s_ernam[] ) )->add_param( iv_param_name = to_upper( |rejected| ) ir_param_value = REF #( p_reject ) )->add_param(
                              iv_param_name = to_upper( |reason_reject| ) ir_param_value = REF #( s_abgru[] ) )->add_param( iv_param_name = to_upper( |material_number| ) ir_param_value = REF #( s_matnr[] ) )->add_param(
                              iv_param_name = to_upper( |prod_hier| ) ir_param_value = REF #( s_prodh[] ) )->add_param( iv_param_name = to_upper( |usage| ) ir_param_value = REF #( s_abrvw[] ) )->add_param(
                              iv_param_name = to_upper( |layout| ) ir_param_value = REF #( p_vari ) ).
  ENDMETHOD.

ENDCLASS.
