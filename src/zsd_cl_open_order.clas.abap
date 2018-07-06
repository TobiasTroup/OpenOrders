"! <p class="shorttext synchronized" lang="en">Open Order</p>
CLASS zsd_cl_open_order DEFINITION
  PUBLIC
  INHERITING FROM zsd_cl_reports_abstract
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zsd_if_open_order .

    TYPES:
      BEGIN OF gty_block_reason,
        reason_code TYPE augru,
        reason_desc TYPE bezei40,
      END OF gty_block_reason .
    TYPES:
      BEGIN OF gty_primary_application,
        vkgrp TYPE vkgrp,
        bezei TYPE bezei20,
      END OF gty_primary_application .
    TYPES:
      BEGIN OF gty_primary_market,
        vkbur TYPE vkbur,
        bezei TYPE bezei20,
      END OF gty_primary_market .
    TYPES:
      BEGIN OF gty_region,
        bland TYPE regio,
        bezei TYPE bezei20,
        land1 TYPE land1,
        landx TYPE landx,
      END OF gty_region .
    TYPES:
      BEGIN OF gty_customer_group,
        kdgrp TYPE kdgrp,
        ktext TYPE vtxtk,
      END OF gty_customer_group .
    TYPES:
      BEGIN OF gty_usage_descr,
        abrvw     TYPE abrvw,
        abrvw_txt TYPE bezei20,
      END OF gty_usage_descr .
    TYPES:
      BEGIN OF gty_sales_district,
        bzirk TYPE bzirk,
        bztxt TYPE bztxt,
      END OF gty_sales_district .
    TYPES:
      BEGIN OF gty_product_hierarchy,
        prodh TYPE prodh_d,
        vtext TYPE bezei40,
      END OF gty_product_hierarchy .
    TYPES:
      "! <p class="shorttext synchronized" lang="en">Data type for profit center</p>
      BEGIN OF gty_profit_center,
        "! <p class="shorttext synchronized" lang="en">Profit Center</p>
        prctr TYPE prctr,
        "! <p class="shorttext synchronized" lang="en">Profit Center Description</p>
        ltext TYPE ltext,
      END OF gty_profit_center .
    TYPES:
      BEGIN OF gty_sales_document_type,
        auart TYPE tvakt-auart,
        bezei TYPE tvakt-bezei,
      END OF gty_sales_document_type .
    TYPES:
      "! <p class="shorttext synchronized" lang="en">Data type for buffer outbound document information</p>
      BEGIN OF gty_buff_outb_doc_info,
        vbelv TYPE vbeln_von,
        posnv TYPE posnr_von,
        rfmng TYPE rfmng,
      END OF gty_buff_outb_doc_info .
    TYPES:
      "! <p class="shorttext synchronized" lang="en">Data type for outbound document information</p>
      BEGIN OF gty_outbound_doc_info,
        vbelv TYPE vbeln_von,
        posnv TYPE posnr_von,
        rfmng TYPE rfmng,
        meins TYPE meins,
        zieme TYPE dzieme,
        matnr TYPE matnr,
      END OF gty_outbound_doc_info .
    TYPES:
      "! <p class="shorttext synchronized" lang="en">Data type for billing plan</p>
      BEGIN OF gty_billing_plan,
        vbeln TYPE vbeln,
        posnr TYPE posnr,
        fplnr TYPE fplnr,
        afdat TYPE fkdat,
        fakwr TYPE fakwr,
        fksaf TYPE fksaf,
        fkarv TYPE fkara,
        tetxt TYPE tetxt_fp,
      END OF gty_billing_plan .
    TYPES:
      "! <p class="shorttext synchronized" lang="en">Data type for purchase document</p>
      BEGIN OF gty_purchase_document,
        vbeln         TYPE vbeln_co,
        vbelp         TYPE posnr_co,
        ebeln         TYPE ebeln,
        ebelp         TYPE ebelp,
        qty           TYPE menge_d,
        vgabe         TYPE vgabe,
        menge         TYPE menge_d,
        factory_netwr TYPE bwert,
        waers         TYPE waers,
      END OF gty_purchase_document .
    TYPES:
      "! <p class="shorttext synchronized" lang="en">Data type for completion log</p>
      BEGIN OF gty_completion_log,
        vbeln TYPE vbeln,
        tdid  TYPE tdid,
      END OF gty_completion_log .
    TYPES:
      "! <p class="shorttext synchronized" lang="en">Data type for conversion rate</p>
      BEGIN OF gty_conversion_rate,
        vbeln TYPE vbeln,
        posnr TYPE posnr,
        kursk TYPE kursk,
      END OF gty_conversion_rate .
    TYPES:
      "! <p class="shorttext synchronized" lang="en">Data type for commission ZRCM</p>
      BEGIN OF gty_commission_zrcm,
        knumv TYPE knumv,
        kposn TYPE kposn,
        kschl TYPE kschl,
        kwert TYPE kwert,
        kbetr TYPE kbetr,
        waers TYPE waers,
      END OF gty_commission_zrcm .
    TYPES:
      "! <p class="shorttext synchronized" lang="en">Data type for customer information</p>
      BEGIN OF gty_customer_info,
        vbeln      TYPE vbeln,
        posnr      TYPE posnr,
        parvw      TYPE parvw,
        kunnr      TYPE kunnr,
        lifnr      TYPE lifnr,
        adrnr      TYPE adrnr,
        name1      TYPE ad_name1,
        country    TYPE land1,
        region     TYPE regio,
        city1      TYPE ad_city1,
        district   TYPE ad_city2,
        post_code1 TYPE ad_pstcd1,
        pernr      TYPE persno,
        parnr      TYPE parnr,
      END OF gty_customer_info .
    TYPES:
      "! <p class="shorttext synchronized" lang="en">Data type for end user price</p>
      BEGIN OF gty_end_user_price,
        knumv TYPE konv-knumv,
        kposn TYPE konv-kposn,
        kschl TYPE konv-kschl,
        kwert TYPE konv-kwert,
        kbetr TYPE konv-kbetr,
        waers TYPE konv-waers,
      END OF gty_end_user_price .
    TYPES:
      "! <p class="shorttext synchronized" lang="en">Data type for unique orders</p>
      BEGIN OF gty_lookup ,
        order_num   TYPE vbeln_va,
        knumv       TYPE knumv,
        sec_ord_num TYPE vbeln_va,
      END OF gty_lookup .
    TYPES:
                                                    "! <p class="shorttext synchronized" lang="en">Table type for unique orders</p>
      zsd_tab_oo_lookup TYPE STANDARD TABLE OF gty_lookup WITH DEFAULT KEY .
    TYPES:
                                                    "! <p class="shorttext synchronized" lang="en">Table type for customer information</p>
      zsd_tab_oo_customer_info TYPE STANDARD TABLE OF gty_customer_info WITH DEFAULT KEY .
    TYPES:
                                                    "! <p class="shorttext synchronized" lang="en">Table type for end user price</p>
      zsd_tab_oo_end_user_price TYPE STANDARD TABLE OF gty_end_user_price WITH DEFAULT KEY .
    TYPES:
                                                    "! <p class="shorttext synchronized" lang="en">Table type for commission ZRCM</p>
      zsd_tab_oo_commission_zrcm TYPE STANDARD TABLE OF gty_commission_zrcm WITH DEFAULT KEY .
    TYPES:
                                                    "! <p class="shorttext synchronized" lang="en">Table type for conversion rate</p>
      zsd_tab_oo_conversion_rate TYPE STANDARD TABLE OF gty_conversion_rate WITH DEFAULT KEY .
    TYPES:
                                                    "! <p class="shorttext synchronized" lang="en">Table type for completion log</p>
      zsd_tab_oo_completion_log TYPE STANDARD TABLE OF gty_completion_log WITH DEFAULT KEY .
    TYPES:
                                                    "! <p class="shorttext synchronized" lang="en">Table type for purchase documents</p>
      zsd_tab_oo_purchase_documents TYPE STANDARD TABLE OF gty_purchase_document WITH DEFAULT KEY .
    TYPES:
                                                    "! <p class="shorttext synchronized" lang="en">Table type for billing plans</p>
      zsd_tab_oo_billing_plan TYPE STANDARD TABLE OF gty_billing_plan WITH DEFAULT KEY .
    TYPES:
                                                    "! <p class="shorttext synchronized" lang="en">Table type for outbound document information</p>
      zsd_tab_oo_outbound_doc_info TYPE STANDARD TABLE OF gty_outbound_doc_info WITH DEFAULT KEY .
    TYPES:
                                                    "! <p class="shorttext synchronized" lang="en">Table type for buffer outbound document information</p>
      zsd_tab_oo_buff_outb_doc_info TYPE STANDARD TABLE OF gty_buff_outb_doc_info WITH DEFAULT KEY .
    TYPES:
      zsd_tab_oo_sales_document_type TYPE STANDARD TABLE OF gty_sales_document_type WITH DEFAULT KEY .
    TYPES:
      zsd_tab_oo_profit_center TYPE STANDARD TABLE OF gty_profit_center WITH DEFAULT KEY .
    TYPES:
      zsd_tab_oo_product_hierarchy TYPE STANDARD TABLE OF gty_product_hierarchy WITH DEFAULT KEY .
    TYPES:
      zsd_tab_oo_sales_district TYPE STANDARD TABLE OF gty_sales_district WITH DEFAULT KEY .
    TYPES:
      zsd_tab_oo_usage_descr TYPE STANDARD TABLE OF gty_usage_descr WITH DEFAULT KEY .
    TYPES:
      zsd_tab_oo_customer_group TYPE STANDARD TABLE OF gty_customer_group WITH DEFAULT KEY .
    TYPES:
      zsd_tab_oo_region TYPE STANDARD TABLE OF gty_region WITH DEFAULT KEY .
    TYPES:
      zsd_tab_oo_primary_market TYPE STANDARD TABLE OF gty_primary_market WITH DEFAULT KEY .
    TYPES:
      zsd_tab_oo_primary_application TYPE STANDARD TABLE OF gty_primary_application WITH DEFAULT KEY .
    TYPES:
      zsd_tab_oo_block_reason TYPE STANDARD TABLE OF gty_block_reason WITH DEFAULT KEY .

    CLASS-METHODS class_constructor .
    "! <p class="shorttext synchronized" lang="en">CONSTRUCTOR</p>
    METHODS constructor .

    METHODS zsd_if_base_reports~determine
        REDEFINITION .
    METHODS zsd_if_base_reports~select
        REDEFINITION .
    METHODS zsd_if_rep_processing~miscellaneous
        REDEFINITION .
    METHODS zsd_if_rep_processing~processing
        REDEFINITION .
  PROTECTED SECTION.

    DATA mt_open_orders TYPE zsd_tab_open_order_new .
  PRIVATE SECTION.

    "! <p class="shorttext synchronized" lang="en">Sales Document: Business Data</p>
    DATA mt_business_data TYPE zsd_tab_vbkd .
    "! <p class="shorttext synchronized" lang="en">Table type for customer information</p>
    DATA mt_customer_information TYPE zsd_tab_oo_customer_info .
    "! <p class="shorttext synchronized" lang="en">Table type for customer information</p>
    DATA mt_sales_agents TYPE zsd_tab_oo_customer_info .
    "! <p class="shorttext synchronized" lang="en">Table type for end user price</p>
    DATA mt_end_user_price TYPE zsd_tab_oo_end_user_price .
    "! <p class="shorttext synchronized" lang="en">Table type for commission ZRCM</p>
    DATA mt_commission_zrcm TYPE zsd_tab_oo_commission_zrcm .
    "! <p class="shorttext synchronized" lang="en">Table type for conversion rate</p>
    DATA mt_conversion_rate TYPE zsd_tab_oo_conversion_rate .
    "! <p class="shorttext synchronized" lang="en">Table type for completion log</p>
    DATA mt_completion_log TYPE zsd_tab_oo_completion_log .
    "! <p class="shorttext synchronized" lang="en">Table type for purchase documents</p>
    DATA mt_purchase_documents TYPE zsd_tab_oo_purchase_documents .
    "! <p class="shorttext synchronized" lang="en">Table type for billing plans</p>
    DATA mt_billing_plan TYPE zsd_tab_oo_billing_plan .
    "! <p class="shorttext synchronized" lang="en">Table type for buffing billing plans</p>
    DATA mt_buff_billing_plan TYPE zsd_tab_oo_billing_plan .
    "! <p class="shorttext synchronized" lang="en">Table type for outbound document information</p>
    DATA mt_outbound_doc_info TYPE zsd_tab_oo_outbound_doc_info .
    "! <p class="shorttext synchronized" lang="en">Table type for buffer outbound document information</p>
    DATA mt_buff_outb_doc_info TYPE zsd_tab_oo_buff_outb_doc_info .
    CLASS-DATA st_sales_document_type TYPE zsd_tab_oo_sales_document_type .
    CLASS-DATA st_profit_center TYPE zsd_tab_oo_profit_center .
    CLASS-DATA st_product_hierarchy TYPE zsd_tab_oo_product_hierarchy .
    CLASS-DATA st_sales_district TYPE zsd_tab_oo_sales_district .
    CLASS-DATA st_usage_descr TYPE zsd_tab_oo_usage_descr .
    CLASS-DATA st_customer_group TYPE zsd_tab_oo_customer_group .
    CLASS-DATA st_region TYPE zsd_tab_oo_region .
    CLASS-DATA st_primary_market TYPE zsd_tab_oo_primary_market .
    CLASS-DATA st_primary_application TYPE zsd_tab_oo_primary_application .
    DATA mv_plant_netwr_currency_key TYPE waers .
    DATA mv_sales_org_currency TYPE waers .
    CLASS-DATA st_block_reason TYPE zsd_tab_oo_block_reason .
    CLASS-DATA st_bill_block TYPE zsd_tab_oo_block_reason .
    CLASS-DATA st_delivery_block TYPE zsd_tab_oo_block_reason .

    "! <p class="shorttext synchronized" lang="en">Select order with schedule line</p>
    METHODS select_with_sched_line .
    "! <p class="shorttext synchronized" lang="en">Select order w/o schedule line</p>
    METHODS select_wo_sched_line .
    "! <p class="shorttext synchronized" lang="en">Sales Document Business Data (Table VBKD)</p>
    METHODS retrieve_business_data .
    "! <p class="shorttext synchronized" lang="en">Select Package Contract w/ Schedule Lines</p>
    "!
    "! @parameter ir_order | <p class="shorttext synchronized" lang="en">Sales Order Structure for ZOOR</p>
    METHODS select_ref_doc_w_schedule_line
      IMPORTING
        !ir_order TYPE REF TO zsd_tab_open_order_new .
    "! <p class="shorttext synchronized" lang="en">Select Package Contract w/o Schedule Lines</p>
    "!
    "! @parameter ir_order | <p class="shorttext synchronized" lang="en">Sales Order Structure for ZOOR</p>
    METHODS select_ref_doc_wo_sched_line
      IMPORTING
        !ir_order TYPE REF TO zsd_tab_open_order_new .
    "! <p class="shorttext synchronized" lang="en">Find Unique Order nubmers</p>
    "!
    "! @parameter rt_lookup | <p class="shorttext synchronized" lang="en">Table type for unique orders</p>
    METHODS find_unique_orders
      RETURNING
        VALUE(rt_lookup) TYPE zsd_tab_oo_lookup .
    "! <p class="shorttext synchronized" lang="en">Find Customer Information</p>
    "!
    "! @parameter it_lookup | <p class="shorttext synchronized" lang="en">Table type for unique orders</p>
    METHODS customer_information
      IMPORTING
        !it_lookup TYPE zsd_tab_oo_lookup .
    "! <p class="shorttext synchronized" lang="en">Find an end user price</p>
    "!
    "! @parameter it_lookup | <p class="shorttext synchronized" lang="en">Table type for unique orders</p>
    METHODS end_user_price
      IMPORTING
        !it_lookup TYPE zsd_tab_oo_lookup .
    "! <p class="shorttext synchronized" lang="en">Commission ZRCM</p>
    "!
    "! @parameter it_lookup | <p class="shorttext synchronized" lang="en">Table type for unique orders</p>
    METHODS commission_zrcm
      IMPORTING
        !it_lookup TYPE zsd_tab_oo_lookup .
    "! <p class="shorttext synchronized" lang="en">Conversion Rate</p>
    "!
    "! @parameter it_lookup | <p class="shorttext synchronized" lang="en">Table type for unique orders</p>
    METHODS conversion_rate
      IMPORTING
        !it_lookup TYPE zsd_tab_oo_lookup .
    "! <p class="shorttext synchronized" lang="en">Completion log</p>
    "!
    "! @parameter it_lookup | <p class="shorttext synchronized" lang="en">Table type for unique orders</p>
    METHODS completion_log
      IMPORTING
        !it_lookup TYPE zsd_tab_oo_lookup .
    "! <p class="shorttext synchronized" lang="en">Purchase documents</p>
    METHODS purchase_documents .
    "! <p class="shorttext synchronized" lang="en">Billing plan</p>
    METHODS billing_plan .
    "! <p class="shorttext synchronized" lang="en">Outbound document information</p>
    "!
    "! @parameter it_lookup | <p class="shorttext synchronized" lang="en">Table type for unique orders</p>
    METHODS outbound_doc_info
      IMPORTING
        !it_lookup TYPE zsd_tab_oo_lookup .
    METHODS commission
      IMPORTING
        !ir_open_order TYPE REF TO zsd_str_open_order_new .
    METHODS miscellaneous
      IMPORTING
        !ir_open_order TYPE REF TO zsd_str_open_order_new
        !iv_schedule   TYPE zsd_schedule DEFAULT zsd_if_open_order=>mc_sales_order_w_schedule .
    METHODS cust_info
      IMPORTING
        !ir_open_order TYPE REF TO zsd_str_open_order_new .
    METHODS cost
      IMPORTING
        !ir_open_order TYPE REF TO zsd_str_open_order_new .
    METHODS set_breakdown_element_value
      IMPORTING
        !ir_open_order TYPE REF TO zsd_str_open_order_new
        !iv_factor     TYPE p .
    METHODS factory_net_value
      IMPORTING
        !ir_open_order TYPE REF TO zsd_str_open_order_new .
    METHODS determine_order_type
      IMPORTING
        !ir_open_order TYPE REF TO zsd_str_open_order_new .
    METHODS factory_net_value_local
      IMPORTING
        !ir_open_order TYPE REF TO zsd_str_open_order_new .
    METHODS set_value
      IMPORTING
        !ir_open_order TYPE REF TO zsd_str_open_order_new
        !iv_factor     TYPE int1 DEFAULT 0 .
    METHODS currency_conversion
      IMPORTING
        ir_open_order TYPE REF TO zsd_str_open_order_new.
ENDCLASS.



CLASS zsd_cl_open_order IMPLEMENTATION.


  METHOD billing_plan.

    DATA: lv_billing_date TYPE datum.

    DATA(lt_open_orders) = VALUE zsd_tab_open_order_new(
      FOR <lw_open_order> IN mt_open_orders WHERE ( schedule_item = zsd_if_open_order~mc_sales_order_w_schedule )
      (
        <lw_open_order>
      )
    ).

    SELECT FROM vbkd JOIN fplt
      ON vbkd~fplnr = fplt~fplnr
    FIELDS
      vbkd~vbeln,
      vbkd~posnr,
      vbkd~fplnr,
      fplt~afdat,
      fplt~fakwr,
      fplt~fksaf,
      fplt~fkarv,
      fplt~tetxt
    FOR ALL ENTRIES IN @lt_open_orders
      WHERE vbkd~vbeln = @lt_open_orders-vbeln
        AND vbkd~posnr = @lt_open_orders-posnr
        AND fplt~fksaf IN ('A','C')
        AND fplt~fkarv IN ( SELECT fkart FROM tvfk WHERE vbtyp IN ('M','N','O','P') )
        AND tetxt NOT IN ('Y001','ZIFZ')
          INTO TABLE @mt_buff_billing_plan.

    DATA(lt_buff_plan) = mt_buff_billing_plan[].
    DELETE lt_buff_plan WHERE fksaf = 'C'.

    LOOP AT lt_buff_plan ASSIGNING FIELD-SYMBOL(<lw_billing_plan>).
      AT NEW posnr.
        DATA(lv_billed_amt) = 0.
        CLEAR: lv_billing_date.
      ENDAT.

      lv_billed_amt = lv_billed_amt + <lw_billing_plan>-fakwr.
      lv_billing_date = <lw_billing_plan>-afdat.

      AT END OF posnr.
        <lw_billing_plan>-fakwr = lv_billed_amt.
        <lw_billing_plan>-afdat = lv_billing_date.
        APPEND VALUE #( BASE <lw_billing_plan> fakwr = lv_billed_amt afdat = lv_billing_date ) TO mt_billing_plan.
      ENDAT.
    ENDLOOP.

  ENDMETHOD.


  METHOD class_constructor.

    DATA: lrt_region TYPE RANGE OF land1.

    " Fill the Sales document type int.table
    SELECT FROM tvakt
      FIELDS auart, bezei
    WHERE spras = @( cl_abap_syst=>get_language( ) )
      INTO TABLE @st_sales_document_type.

    " Split in two selections because I would be selecting bypassing buffer
    " Profitcenter descriptions
    SELECT FROM cepc
      FIELDS *
    WHERE kokrs = 'BRKR'
      AND datbi >= @sy-datum
      AND datab <= @sy-datum
        INTO TABLE @DATA(lt_cepc).

    SELECT FROM cepct
      FIELDS *
    FOR ALL ENTRIES IN @lt_cepc
      WHERE spras = @( cl_abap_syst=>get_language( ) )
        AND prctr = @lt_cepc-prctr
        AND datbi >= @sy-datum
          INTO TABLE @DATA(lt_cepct).

    st_profit_center = VALUE #(
      FOR <lw_cepc> IN lt_cepc
      FOR <lw_cepct> IN lt_cepct WHERE ( prctr = <lw_cepc>-prctr )
        ( prctr = <lw_cepc>-prctr       " Profit Center
          ltext = <lw_cepct>-ltext      " Profit Center Description
        )
    ).

    " Fill the Product Hierarchy int.table
    SELECT FROM t179t
      FIELDS
        prodh,   " Product hierarchy
        vtext    " Description (Product hierarchy)(40)
    WHERE spras = @( cl_abap_syst=>get_language( ) )
      INTO TABLE @st_product_hierarchy.

    " Fill the Sales district int.table
    SELECT FROM t171t
      FIELDS
        bzirk,
        bztxt
      WHERE spras = @( cl_abap_syst=>get_language( ) )
        INTO TABLE @st_sales_district.

    " Fill the Usage Field Description
    SELECT FROM tvlvt
      FIELDS
        abrvw,
        bezei AS abrvw_txt
    WHERE spras = @( cl_abap_syst=>get_language( ) )
      INTO TABLE @st_usage_descr.

    " Fill the Customer group HASHED int.table
    SELECT FROM t151t           " Customers: Customer groups: Texts
      FIELDS
        kdgrp,                  " Customer group
        ktext                   " Name (Customer group)(20)
    WHERE spras = @( cl_abap_syst=>get_language( ) )
      INTO TABLE @st_customer_group.

    " Split in two selections because I would be selecting bypassing buffer
    " Fill the customer region data
    SELECT FROM t005t
      FIELDS *
    WHERE spras = @( cl_abap_syst=>get_language( ) )
      INTO TABLE @DATA(lt_t005t).

    SELECT FROM t005u
      FIELDS *
    FOR ALL ENTRIES IN @lt_t005t
      WHERE spras = @lt_t005t-spras
        AND land1 = @lt_t005t-land1
          INTO TABLE @DATA(lt_t005u).

    st_region = VALUE #(
      FOR <lw_t005t> IN lt_t005t
      FOR <lw_t005u> IN lt_t005u WHERE ( land1 = <lw_t005t>-land1 )
        ( bland = <lw_t005u>-bland
          bezei = <lw_t005u>-bezei
          land1 = <lw_t005t>-land1
          landx = <lw_t005t>-landx
        )
    ).

    lrt_region = VALUE #(
      FOR GROUPS <lw_group> OF <lw_t005u> IN lt_t005u GROUP BY ( land1 = <lw_t005u>-land1 )
      (
         sign   = 'E'
         option = 'EQ'
         low    = <lw_group>-land1
      )
    ).

    SELECT FROM t005t
      FIELDS ' ' AS bland, ' ' AS bezei, land1, landx
    WHERE spras = @( cl_abap_syst=>get_language( ) )
      AND land1 IN @lrt_region
        APPENDING TABLE @st_region.

    " Fill the Primary Market int.table
    SELECT FROM tvkbt    "Organizational Unit: Sales Offices: Texts
      FIELDS
        vkbur,    " Primary market
        bezei     " Description
    WHERE spras = @( cl_abap_syst=>get_language( ) )
      INTO TABLE @st_primary_market.

    " Fill the reason of rejection description table
    SELECT FROM tvagt
      FIELDS
        abgru AS reason_code,
        bezei AS reason_desc
      WHERE spras = @( cl_abap_syst=>get_language( ) )
        INTO TABLE @st_block_reason.

  ENDMETHOD.


  METHOD commission.

    " Commission ZRCM
    LOOP AT mt_commission_zrcm ASSIGNING FIELD-SYMBOL(<lw_condition>)
      WHERE knumv = ir_open_order->*-knumv
        AND kposn = ir_open_order->*-vbelp
        AND kschl = 'ZRCM'.
      ADD <lw_condition>-kwert TO ir_open_order->*-commission_betr.
      ir_open_order->*-commission_curr = <lw_condition>-waers.
    ENDLOOP.

  ENDMETHOD.


  METHOD commission_zrcm.

    SELECT FROM konv
      FIELDS
        knumv,
        kposn,
        kschl,
        kwert,
        kbetr,
        waers
      FOR ALL ENTRIES IN @it_lookup
    WHERE knumv = @it_lookup-order_num
      AND kschl = 'ZRCM'
    INTO TABLE @mt_commission_zrcm.

  ENDMETHOD.


  METHOD completion_log.

    SELECT FROM vbuv
      FIELDS
        vbeln,
        tdid
      FOR ALL ENTRIES IN @it_lookup
    WHERE vbeln = @it_lookup-order_num
      INTO TABLE @mt_completion_log.

  ENDMETHOD.


  METHOD constructor.
    super->constructor( ).
  ENDMETHOD.


  METHOD conversion_rate.

    SELECT FROM vbkd
      FIELDS
        vbeln,
        posnr,
        kursk
      FOR ALL ENTRIES IN @it_lookup
    WHERE vbeln = @it_lookup-order_num
      INTO TABLE @mt_conversion_rate.

  ENDMETHOD.


  METHOD cost.

    DATA: lw_cost_breakout TYPE zdsd_cost_brk.
    DATA: lt_cost_bucket TYPE STANDARD TABLE OF zdsd_cost_title.
    DATA: lt_bucket_fields TYPE STANDARD TABLE OF zsds_bucket_field.
    DATA: lt_zdsdcsc TYPE STANDARD TABLE OF zdsdcsc.
    DATA: lv_factor TYPE p DECIMALS 2.

    FIELD-SYMBOLS: <lv_pointer> TYPE any.
    FIELD-SYMBOLS: <lv_rec> TYPE any.

    " check for enough authorization to display costs
    AUTHORITY-CHECK OBJECT 'Z_COST_COM'
             ID 'WERKS' FIELD ir_open_order->*-dwerk
             ID 'ACTVT' FIELD '03'.
    IF xsdbool( sy-subrc = 0 ) = abap_false.
      " VBAP-WAVWR is the cost saved on the sales order
      ir_open_order->*-costs-wavwr = 0.
      RETURN.
    ENDIF.

    IF xsdbool( ir_open_order->*-wrk02 IS INITIAL ) = abap_true.
      " Determine if and which special procurement plant the material comes from
      SELECT SINGLE FROM t460a
        JOIN marc
          ON t460a~sobsl = marc~sobsl
         AND t460a~werks = marc~werks
      FIELDS wrk02
        WHERE t460a~werks = @ir_open_order->*-dwerk
          AND marc~matnr  = @ir_open_order->*-matnr
            INTO @ir_open_order->*-wrk02.
    ENDIF.

    " Get costs breakdown
    IF xsdbool( ir_open_order->*-pstyv = 'IRRE' OR ir_open_order->*-pstyv = 'IRAL' OR ir_open_order->*-pstyv = 'IRAT' ) = abap_true.
      " Item category not 'Return for repair' or 'Delivery'
      RETURN.
    ENDIF.

    IF xsdbool( ir_open_order->*-mtart = 'KMAT' ) = abap_true.
      " configured item parameters for the routine

      IF xsdbool( ir_open_order->*-wrk02 IS INITIAL ) = abap_false.
***        ibu_total_factory_costs( ).
      ENDIF.

      SELECT FROM kanz
        FIELDS MIN( kalnr_keko )
      WHERE vbeln = @ir_open_order->*-vbeln
        AND posnr = @ir_open_order->*-posnr
          INTO @lw_cost_breakout-kaln1.

      lw_cost_breakout = VALUE #( BASE lw_cost_breakout
        bwkey   = ir_open_order->*-dwerk
        bzobj   = 'B'
        feh_sta = 'KA'
        " For Material Cost estimates use today's date - Authorized by Todd Kennedy 4/30/2009
        lfgja   = sy-datum(4)
      ).

    ELSE.
      " non-configured item, get the rolled cost in CK13N
      SELECT FROM kanz
        FIELDS MIN( kalnr_keko )
      WHERE vbeln = @ir_open_order->*-vbeln
        AND posnr = @ir_open_order->*-posnr
          INTO @lw_cost_breakout-kaln1.
      lw_cost_breakout = VALUE #( BASE lw_cost_breakout
        bzobj = 'B'
        matnr = ir_open_order->*-matnr
        " For Material Cost estimates use today's date - Authorized by Todd Kennedy 4/30/2009
        lfgja = sy-datum(4)
        bwkey = COND #( WHEN xsdbool( ir_open_order->*-wrk02 IS INITIAL ) = abap_false THEN ir_open_order->*-wrk02 ELSE ir_open_order->*-dwerk )
      ).
      IF xsdbool( lw_cost_breakout-kaln1 IS INITIAL ) = abap_true.
        SELECT SINGLE FROM mbew
          FIELDS kaln1
        WHERE matnr = @ir_open_order->*-matnr
          AND bwkey = @ir_open_order->*-dwerk
            INTO @lw_cost_breakout-kaln1.
        lw_cost_breakout-bzobj = '0'.
      ENDIF.

    ENDIF.

    CALL FUNCTION 'ZDSD_BB_COST_BREAKOUT'
      EXPORTING
        date_work          = sy-datum
      TABLES
        cost_bucket_titles = lt_cost_bucket
        et_bucket_fields   = lt_bucket_fields[]
        et_cost_struc_comp = lt_zdsdcsc[]
      CHANGING
        zmm_cost_brk       = lw_cost_breakout.

    SORT: lt_zdsdcsc BY elehk.

    " The total of the costs components
    IF xsdbool( lw_cost_breakout-cost_sum > 0 ) = abap_true.
      ir_open_order->*-costs-sum_wavwr = lw_cost_breakout-cost_sum.

      LOOP AT lt_cost_bucket ASSIGNING FIELD-SYMBOL(<lw_cost_bucket>).
        DATA(lv_tabix) = CONV string( sy-tabix ).
        IF xsdbool( sy-tabix < 10 ) = abap_true.
          ##NO_TEXT
          CONCATENATE 'lw_cost_breakout-COST_BUCKET_' '0' lv_tabix
                       INTO DATA(lv_target_field_name).
        ELSE.
          ##NO_TEXT
          CONCATENATE 'lw_cost_breakout-COST_BUCKET_' lv_tabix
                       INTO lv_target_field_name.
        ENDIF.
        ASSIGN (lv_target_field_name) TO <lv_pointer>.

        READ TABLE lt_zdsdcsc ASSIGNING FIELD-SYMBOL(<lw_zdsdcsc>)
          WITH KEY elemt = <lw_cost_bucket>-cost_comp
          BINARY SEARCH.
        IF xsdbool( sy-subrc = 0 ) = abap_true.
          <lw_zdsdcsc>-ccfs = |MW_BOOKING|.
          DATA(lv_field_name) = |{ <lw_zdsdcsc>-ccfs }-{ <lw_zdsdcsc>-ccf }|.
          ASSIGN (lv_field_name) TO <lv_rec>.
          ADD <lv_pointer> TO <lv_rec>.
        ENDIF.

      ENDLOOP.

    ELSE.
      " No costing profile created in CK13N found, use the standard costs
      ir_open_order->*-costs-sum_wavwr = lw_cost_breakout-stprs / lw_cost_breakout-peinh.
    ENDIF.

    " Check if the costs has been marked or not
    IF xsdbool( ir_open_order->*-mtart = 'KMAT' ) = abap_false.
      ir_open_order->*-costs-costing_status = |Non-KMAT|.
    ELSE.
      IF xsdbool( lw_cost_breakout-feh_sta = 'VO' ) = abap_true.
        ir_open_order->*-costs-costing_status = |Marked|.
      ELSE.
        ir_open_order->*-costs-costing_status = |Not Marked|.
      ENDIF.
    ENDIF.

    " Costing status code
    ir_open_order->*-costs-feh_sta = lw_cost_breakout-feh_sta.

    " Logic for Commercial Price 3
    IF xsdbool( ir_open_order->*-wrk02 IS INITIAL ) = abap_true.
      SELECT SINGLE FROM mbew
        FIELDS vjbwh, peinh
      WHERE matnr = @ir_open_order->*-matnr
        AND bwkey = @ir_open_order->*-dwerk
          INTO (@ir_open_order->*-vjbwh,@DATA(lv_peinh)).
    ELSE.
      SELECT SINGLE FROM mbew
        FIELDS vjbwh, peinh
      WHERE matnr = @ir_open_order->*-matnr
        AND bwkey = @ir_open_order->*-wrk02
          INTO (@ir_open_order->*-vjbwh,@lv_peinh).
    ENDIF.

    IF xsdbool( lv_peinh = 0 ) = abap_false.
      lv_factor = ( 1 / lv_peinh * ir_open_order->*-qty ).
    ELSE.
      lv_factor = 0.
    ENDIF.

    set_breakdown_element_value( ir_open_order = ir_open_order iv_factor = lv_factor ).

    IF xsdbool( lw_cost_breakout-cost_key IS INITIAL ) = abap_true.
      ir_open_order->*-sum_wavwr_key = ir_open_order->*-waerk.
    ELSE.
      ir_open_order->*-sum_wavwr_key = lw_cost_breakout-cost_key.
    ENDIF.
    ir_open_order->*-zvjwaers = 'USD'.

    " Extra-Rule: If ZLOH is present, you will set kwert to labor overhead
    IF xsdbool( ir_open_order->*-kalsm = 'ZVC210' ) = abap_true.
      SELECT SINGLE FROM konv
        FIELDS *
      WHERE knumv = @ir_open_order->*-knumv
        AND kposn = @ir_open_order->*-posnr
        AND kschl = 'ZLOH'
          INTO @DATA(lw_konv).
      IF xsdbool( sy-subrc = 0 ) = abap_true.
        ir_open_order->*-sum_lab_ovrh = ir_open_order->*-sum_lab_ovrh + lw_konv-kwert.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD customer_information.

    " Everything else w/o internal sales agent and sales employee
    SELECT FROM vbpa AS partner JOIN adrc AS addresses
      ON partner~adrnr = addresses~addrnumber
    FIELDS
      partner~vbeln,
      partner~posnr,
      partner~parvw,
      partner~kunnr,
      partner~lifnr,
      partner~adrnr,
      addresses~name1,
      addresses~country,
      addresses~region,
      addresses~city1,
      addresses~city2 AS district,
      addresses~post_code1
        FOR ALL ENTRIES IN @it_lookup
    WHERE vbeln = @it_lookup-order_num
      AND nation = @space
        INTO TABLE @mt_customer_information.

    " Internal sales agent
    SELECT FROM vbpa AS partner JOIN pa0001 AS employee
       ON partner~pernr = employee~pernr
      AND employee~endda > @sy-datum
    FIELDS
      partner~vbeln,
      partner~posnr,
      partner~parvw,
      partner~lifnr,
      partner~adrnr,
      employee~sname AS name1,
      employee~pernr
    FOR ALL ENTRIES IN @it_lookup
      WHERE vbeln = @it_lookup-order_num
        AND parvw IN ('VE', 'ZY')
      INTO TABLE @mt_sales_agents.

  ENDMETHOD.


  METHOD cust_info.
    ir_open_order->* = VALUE #(
      LET
        ag = VALUE #( mt_customer_information[ vbeln = ir_open_order->*-c_ord_num parvw = 'AG' ] OPTIONAL )
        re = VALUE #( mt_customer_information[ vbeln = ir_open_order->*-c_ord_num parvw = 'RE' ] OPTIONAL )
        rg = VALUE #( mt_customer_information[ vbeln = ir_open_order->*-c_ord_num parvw = 'RG' ] OPTIONAL )
        zj = VALUE #( mt_customer_information[ vbeln = ir_open_order->*-c_ord_num parvw = 'ZJ' ] OPTIONAL )
        y6 = VALUE #( mt_customer_information[ vbeln = ir_open_order->*-c_ord_num parvw = 'Y6' ] OPTIONAL )
      IN
      BASE ir_open_order->*

      " Get Sold-to party customer #
      kunag      = ag-kunnr
      soldtoname = ag-name1

      " Get Bill-to party customer #
      billto     = re-kunnr
      billtoname = re-name1

      " Get Alternative Payer
      payer     = rg-kunnr
      payername = rg-name1

      " Get APP Person party customer #
      contactpersonnum = zj-kunnr
      contactperson    = zj-name1

      " Get sales representative
      salesrepnum = y6-lifnr
      salesrep    = y6-name1

      " Get Customer group text
      kdgrp_txt = VALUE #( st_customer_group[ kdgrp = ir_open_order->*-kdgrp ]-ktext OPTIONAL )
    ).

    " Internal Sales Agent
    TRY.
        ir_open_order->* = VALUE #( BASE ir_open_order->*
          int_sales_agt_num = mt_sales_agents[ vbeln = ir_open_order->*-c_ord_num parvw = 'ZY' ]-pernr
          int_sales_agt     = mt_sales_agents[ vbeln = ir_open_order->*-c_ord_num parvw = 'ZY' ]-name1
        ).
      CATCH cx_sy_itab_line_not_found.
        " Sales Employee
        ir_open_order->* = VALUE #( BASE ir_open_order->*
          int_sales_agt_num = VALUE #( mt_sales_agents[ vbeln = ir_open_order->*-c_ord_num parvw = 'VE' ]-pernr OPTIONAL )
          int_sales_agt     = VALUE #( mt_sales_agents[ vbeln = ir_open_order->*-c_ord_num parvw = 'VE' ]-name1 OPTIONAL )
        ).
    ENDTRY.

    " Internal Sales Person
    IF xsdbool( xsdbool( ir_open_order->*-int_sales_agt_num IS INITIAL ) = abap_true
      AND xsdbool( ir_open_order->*-int_sales_agt IS INITIAL ) = abap_true ) = abap_true.
      TRY.
          " Internal Sales Person
          ir_open_order->* = VALUE #( BASE ir_open_order->*
            int_sales_agt     = mt_sales_agents[ vbeln = ir_open_order->*-c_ord_num parvw = 'Y5' ]-name1
            int_sales_agt_num = mt_sales_agents[ vbeln = ir_open_order->*-c_ord_num parvw = 'Y5' ]-kunnr
          ).
        CATCH cx_sy_itab_line_not_found.
          TRY.
              ir_open_order->*-int_sales_agt = mt_sales_agents[ vbeln = ir_open_order->*-c_ord_num parvw = 'XF' ]-name1.
              LOOP AT mt_sales_agents ASSIGNING FIELD-SYMBOL(<lw_customer_info>)
                WHERE vbeln = ir_open_order->*-c_ord_num
                  AND NOT parnr IS INITIAL.
                ir_open_order->*-int_sales_agt_num = <lw_customer_info>-parnr.
                SELECT SINGLE FROM knvk
                  FIELDS concat( name1, ' ' && namev )
                WHERE parnr = @<lw_customer_info>-parnr
                  INTO @ir_open_order->*-int_sales_agt.
                EXIT.
              ENDLOOP.
            CATCH cx_sy_itab_line_not_found.
              " Sales Employee
              ir_open_order->*-int_sales_agt_num = VALUE #( mt_sales_agents[ vbeln = ir_open_order->*-c_ord_num parvw = 'VE' ]-pernr OPTIONAL ).
              IF xsdbool( VALUE #( mt_sales_agents[ vbeln = ir_open_order->*-c_ord_num parvw = 'VE' ]-pernr OPTIONAL ) IS INITIAL ) = abap_false.
                " Retrieve name of a sales employee
                SELECT SINGLE FROM pa0002
                  FIELDS nachn
                WHERE pernr = @( VALUE #( mt_sales_agents[ vbeln = ir_open_order->*-c_ord_num parvw = 'VE' ]-pernr OPTIONAL ) )
                  INTO @ir_open_order->*-int_sales_agt.
              ENDIF.
          ENDTRY.
      ENDTRY.
    ENDIF.

    IF xsdbool( ir_open_order->*-salespersonnum IS INITIAL ) = abap_true.
      " Sales Employee
      ir_open_order->*-salespersonnum = VALUE #( mt_sales_agents[ vbeln = ir_open_order->*-c_ord_num parvw = 'VE' ]-pernr OPTIONAL ).
      IF xsdbool( VALUE #( mt_sales_agents[ vbeln = ir_open_order->*-c_ord_num parvw = 'VE' ]-pernr OPTIONAL ) IS INITIAL ) = abap_false.
        " Retrieve name of a sales employee
        SELECT SINGLE FROM pa0002
          FIELDS
            CASE natio WHEN 'JP' THEN concat( fnamr, ' ' && lnamr ) ELSE concat( vorna, ' ' && nachn ) END
        WHERE pernr = @( VALUE #( mt_sales_agents[ vbeln = ir_open_order->*-c_ord_num parvw = 'VE' ]-pernr OPTIONAL ) )
          INTO @ir_open_order->*-salesperson.
      ENDIF.
    ENDIF.

    " Get Ship-to party customer #
    ir_open_order->* = VALUE #(
      LET
        we = VALUE #( mt_customer_information[ vbeln = ir_open_order->*-c_ord_num parvw = 'WE' ] OPTIONAL )
      IN
      BASE ir_open_order->*

      shipto         = we-kunnr
      shiptoname     = we-name1
      shiptodistrict = we-district
      shiptocity     = we-city1
      shiptozip      = we-post_code1
      shiptoland     = we-country
    ).

    IF xsdbool( VALUE #( mt_customer_information[ vbeln = ir_open_order->*-c_ord_num parvw = 'WE' ]-region OPTIONAL ) IS INITIAL ) = abap_true.
      ir_open_order->*-landx = VALUE #( st_region[ land1 = ir_open_order->*-shiptoland ]-landx OPTIONAL ).
    ELSE.
      ir_open_order->*-shiptoregion = VALUE #( st_region[ bland = VALUE #( mt_customer_information[ vbeln = ir_open_order->*-c_ord_num parvw = 'WE' ]-region OPTIONAL ) land1 = ir_open_order->*-shiptoland ]-bezei OPTIONAL ).
      ir_open_order->*-landx        = VALUE #( st_region[ bland = VALUE #( mt_customer_information[ vbeln = ir_open_order->*-c_ord_num parvw = 'WE' ]-region OPTIONAL ) land1 = ir_open_order->*-shiptoland ]-landx OPTIONAL ).
    ENDIF.

    IF xsdbool( ir_open_order->*-c_sec_ord_num IS INITIAL ) = abap_true.
      DATA(lv_ord_num) = ir_open_order->*-c_ord_num.
    ELSE.
      lv_ord_num = ir_open_order->*-c_sec_ord_num.
    ENDIF.

    " Get End-Customer
    IF xsdbool( line_index( mt_customer_information[ vbeln = lv_ord_num parvw = 'Y8' ] ) > 0 ) = abap_true.
      SELECT SINGLE FROM adrc
        FIELDS name1
      WHERE addrnumber = @( VALUE #( mt_customer_information[ vbeln = lv_ord_num parvw = 'Y8' ]-adrnr OPTIONAL ) )
        INTO @ir_open_order->*-endcustname.
      ir_open_order->* = VALUE #( BASE ir_open_order->*
        endcust     = VALUE #( mt_customer_information[ vbeln = lv_ord_num parvw = 'Y8' ]-kunnr OPTIONAL )
        endcustland = VALUE #( mt_customer_information[ vbeln = lv_ord_num parvw = 'Y8' ]-country OPTIONAL )
      ).
    ELSE.
      IF xsdbool( line_index( mt_customer_information[ vbeln = lv_ord_num parvw = 'EN' ] ) > 0 ) = abap_true.
        SELECT SINGLE FROM adrc
          FIELDS name1
        WHERE addrnumber = @( VALUE #( mt_customer_information[ vbeln = lv_ord_num parvw = 'EN' ]-adrnr OPTIONAL ) )
          INTO @ir_open_order->*-endcustname.
        ir_open_order->* = VALUE #( BASE ir_open_order->*
          endcust     = VALUE #( mt_customer_information[ vbeln = lv_ord_num parvw = 'EN' ]-kunnr OPTIONAL )
          endcustland = VALUE #( mt_customer_information[ vbeln = lv_ord_num parvw = 'EN' ]-country OPTIONAL )
        ).
      ELSE.
        IF xsdbool( line_index( mt_customer_information[ vbeln = lv_ord_num parvw = 'ZE' ] ) > 0 ) = abap_true.
          SELECT SINGLE FROM adrc
            FIELDS name1
          WHERE addrnumber = @( VALUE #( mt_customer_information[ vbeln = lv_ord_num parvw = 'ZE' ]-adrnr OPTIONAL ) )
            INTO @ir_open_order->*-endcustname.
          ir_open_order->* = VALUE #( BASE ir_open_order->*
            endcust     = VALUE #( mt_customer_information[ vbeln = lv_ord_num parvw = 'ZE' ]-kunnr OPTIONAL )
            endcustland = VALUE #( mt_customer_information[ vbeln = lv_ord_num parvw = 'ZE' ]-country OPTIONAL )
          ).
        ELSE.
          IF xsdbool( line_index( mt_customer_information[ vbeln = lv_ord_num parvw = 'YE' ] ) > 0 ) = abap_true.
            SELECT SINGLE FROM adrc
              FIELDS name1
            WHERE addrnumber = @( VALUE #( mt_customer_information[ vbeln = lv_ord_num parvw = 'YE' ]-adrnr OPTIONAL ) )
              INTO @ir_open_order->*-endcustname.
            ir_open_order->* = VALUE #( BASE ir_open_order->*
              endcust     = VALUE #( mt_customer_information[ vbeln = lv_ord_num parvw = 'YE' ]-kunnr OPTIONAL )
              endcustland = VALUE #( mt_customer_information[ vbeln = lv_ord_num parvw = 'YE' ]-country OPTIONAL )
            ).
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.

    " Get Account Assignment Group
    " From table TVKT
    " 01 = Customer
    " Z1 = Subsidy / InterCompany
    IF xsdbool( ir_open_order->*-ktgrd IS INITIAL ) = abap_false.
      SELECT SINGLE FROM tvktt
        FIELDS vtext
      WHERE ktgrd = @ir_open_order->*-ktgrd
        AND spras = @( cl_abap_syst=>get_language( ) )
        INTO @ir_open_order->*-ktgrd.
    ENDIF.

    " Get Primary market text
    ir_open_order->* = VALUE #( BASE ir_open_order->*
      vkbur_txt = VALUE #( st_primary_market[ vkbur = ir_open_order->*-vkbur ]-bezei OPTIONAL )
      vkgrp_txt = VALUE #( st_primary_application[ vkgrp = ir_open_order->*-vkgrp ]-bezei OPTIONAL )
    ).

  ENDMETHOD.


  METHOD determine_order_type.

    " Plant currency
    SELECT SINGLE FROM t001k
      FIELDS bukrs
    WHERE bwkey = @ir_open_order->*-dwerk
      INTO @DATA(lv_plant_bukrs).

    " Plant Net Value Currency
    SELECT SINGLE FROM t001
      FIELDS waers
    WHERE bukrs = @lv_plant_bukrs
      INTO @mv_plant_netwr_currency_key.

    " Sales Organization company code
    SELECT SINGLE FROM t001k
      FIELDS bukrs
    WHERE bwkey = @ir_open_order->*-vkorg
      INTO @DATA(lv_sales_org_bukrs).

    " Sales Organization currency
    SELECT SINGLE FROM t001
      FIELDS waers
    WHERE bukrs = @lv_sales_org_bukrs
      INTO @mv_sales_org_currency.

    " Receive Document company code to plant company code
    IF xsdbool( ir_open_order->*-bukrs_vf = lv_plant_bukrs ) = abap_false.
      " Intercompany
      ir_open_order->*-dtype = 'I'.
    ELSE.
      " Domestic
      ir_open_order->*-dtype = 'D'.
    ENDIF.

  ENDMETHOD.


  METHOD end_user_price.

    SELECT FROM konv
      FIELDS
        knumv,
        kposn,
        kschl,
        kwert,
        kbetr,
        waers
      FOR ALL ENTRIES IN @it_lookup
        WHERE knumv = @it_lookup-knumv
          AND kschl = 'ZECP'
      INTO TABLE @mt_end_user_price.

  ENDMETHOD.


  METHOD factory_net_value.

    DATA: lv_fact_netwr TYPE kbetr.

    " Intercompany
    IF xsdbool( ir_open_order->*-dtype = 'I' ) = abap_true.
      IF xsdbool( ir_open_order->*-mtart = 'KMAT' ) = abap_true.
        SELECT FROM konv
          FIELDS kwert, waers
        WHERE knumv = @ir_open_order->*-knumv
          AND kposn = @ir_open_order->*-posnr
          AND ( kschl = 'PI02'
           OR   kschl = 'IV02' )
            INTO (@DATA(lv_kawrt), @ir_open_order->*-fact_netwr_key).
          ir_open_order->*-factory_netwr  = ir_open_order->*-factory_netwr + lv_kawrt.
          ir_open_order->*-fact_netwr_key = 'USD'.
        ENDSELECT.
        IF xsdbool( sy-subrc = 0 ) = abap_false.
          SELECT FROM konv
            FIELDS kbetr, waers
          WHERE knumv = @ir_open_order->*-knumv
            AND kposn = @ir_open_order->*-posnr
            AND ( kschl = 'ZICV'
             OR   kschl = 'ZICO' )
          INTO (@lv_fact_netwr, @ir_open_order->*-fact_netwr_key).
            ir_open_order->*-factory_netwr = ir_open_order->*-factory_netwr + lv_fact_netwr.
            CLEAR: lv_fact_netwr.
          ENDSELECT.
        ENDIF.
      ENDIF.

      " Not a KMAT material or variant config transfer pricing not found
      IF xsdbool( ir_open_order->*-factory_netwr = 0 ) = abap_true.

        ##WARN_OK
        SELECT SINGLE FROM konv
          FIELDS
            kwert, waers
        WHERE knumv = @ir_open_order->*-knumv
          AND kposn = @ir_open_order->*-posnr
          AND ( kschl = 'PI02'
           OR   kschl = 'IV02' )
              INTO (@lv_fact_netwr,  @ir_open_order->*-fact_netwr_key).

        ir_open_order->*-factory_netwr = lv_fact_netwr.
        IF sy-subrc <> 0.
          ##WARN_OK
          SELECT SINGLE FROM konv
            FIELDS
              kawrt, waers
          WHERE knumv = @ir_open_order->*-knumv
            AND kposn = @ir_open_order->*-posnr
            AND ( kschl = 'PI02'
             OR   kschl = 'IV02' )
              INTO (@lv_kawrt, @ir_open_order->*-fact_netwr_key).
          IF xsdbool( sy-subrc = 0 ) = abap_true.
            ir_open_order->*-factory_netwr = lv_kawrt.
          ENDIF.
          ir_open_order->*-fact_netwr_key = 'USD'.
        ENDIF.
      ENDIF.

      " Refurbished materials -R with ZICR condition in transfer price
      CLEAR: lv_fact_netwr.
      ##WARN_OK
      SELECT SINGLE FROM konv
        FIELDS
          kbetr, waers
       WHERE knumv = @ir_open_order->*-knumv
         AND kposn = @ir_open_order->*-posnr
         AND kschl = 'ZICR'
           INTO (@lv_fact_netwr, @ir_open_order->*-fact_netwr_key).
      IF xsdbool( sy-subrc = 0 ) = abap_true.
        ir_open_order->*-factory_netwr = lv_fact_netwr.
      ENDIF.
      ir_open_order->*-fact_netwr_key = ir_open_order->*-waerk.
    ELSE.
      " T.Kieser / 3/26/2018
      " ISM01,02,03 Factory Net Value (DC) out of ZZWI9
      CASE ir_open_order->*-kalsm.
        WHEN 'ZISM01' OR 'ZISM02' OR 'ZISM03'.
          ir_open_order->*-factory_netwr = ir_open_order->*-zzwi9.
        WHEN OTHERS.
          ir_open_order->*-factory_netwr  = ir_open_order->*-netwr.
      ENDCASE.
      " T.Kieser / 3/26/2018
      ir_open_order->*-fact_netwr_key = ir_open_order->*-waerk.
    ENDIF.

    IF xsdbool( ir_open_order->*-fact_netwr_key IS INITIAL ) = abap_true.
      ir_open_order->*-fact_netwr_key = ir_open_order->*-waerk.
    ENDIF.

    factory_net_value_local( ir_open_order ).

    ir_open_order->*-fact_loc_netwr = ir_open_order->*-factory_netwr.

  ENDMETHOD.


  METHOD factory_net_value_local.
    IF ir_open_order->*-dtype = 'I'.
      ir_open_order->*-factory_netwr_local_key = mv_plant_netwr_currency_key.
      CALL FUNCTION 'CONVERT_TO_LOCAL_CURRENCY'
        EXPORTING
          date             = ir_open_order->*-prsdt
          foreign_amount   = ir_open_order->*-factory_netwr
          foreign_currency = ir_open_order->*-fact_netwr_key
          local_currency   = ir_open_order->*-factory_netwr_local_key
          type_of_rate     = 'EURX'
        IMPORTING
          local_amount     = ir_open_order->*-factory_netwr_local
          exchange_rate    = ir_open_order->*-rate  "TCURR-UKURS
        EXCEPTIONS
          no_rate_found    = 1
          overflow         = 2
          no_factors_found = 3
          no_spread_found  = 4
          derived_2_times  = 5
          OTHERS           = 6.
    ELSE.
      ir_open_order->*-factory_netwr_local = ir_open_order->*-factory_netwr.
      ir_open_order->*-factory_netwr_local_key = ir_open_order->*-fact_netwr_key.
    ENDIF.
  ENDMETHOD.


  METHOD find_unique_orders.

    " Find unique Sales order numbers.
    rt_lookup = VALUE #(
      FOR GROUPS <lw_group> OF <lw_open_order> IN mt_open_orders GROUP BY ( so_num = <lw_open_order>-vbeln knumv = <lw_open_order>-knumv ) ASCENDING
      (
        order_num = <lw_group>-so_num
        knumv = <lw_group>-knumv
      )
    ).

  ENDMETHOD.


  METHOD miscellaneous.

    DATA: lv_gi_num TYPE menge_d.
    DATA: lv_gr_num TYPE menge_d.
    DATA: lv_sto_qty TYPE menge_d.
    DATA: lv_object_name TYPE tdobname.
    DATA: lt_line TYPE STANDARD TABLE OF tline.

    " Get Purchase Document
    LOOP AT mt_purchase_documents ASSIGNING FIELD-SYMBOL(<lw_purchase_document>)
      WHERE vbeln = ir_open_order->*-vbeln
        AND vbelp = ir_open_order->*-vbelp.

      ir_open_order->*-ebeln = <lw_purchase_document>-ebeln.
      ir_open_order->*-ebelp = <lw_purchase_document>-ebelp.
      lv_sto_qty = <lw_purchase_document>-qty.

      IF xsdbool( <lw_purchase_document>-vgabe = 1 ) = abap_true.
        lv_gr_num = <lw_purchase_document>-menge + lv_gr_num.
      ENDIF.

      IF xsdbool( <lw_purchase_document>-vgabe = 6 ) = abap_true.
        lv_gi_num = <lw_purchase_document>-menge + lv_gi_num.
      ENDIF.
    ENDLOOP.

    " Get Procurement type
    SELECT SINGLE FROM t001w
      FIELDS werks
    WHERE vkorg = @ir_open_order->*-vkorg
      INTO @DATA(lv_plant).

    SELECT SINGLE FROM marc
      FIELDS beskz, dismm
    WHERE matnr = @ir_open_order->*-matnr
      AND werks = @lv_plant
        INTO (@ir_open_order->*-beskz,@ir_open_order->*-dismm).

    IF xsdbool( ir_open_order->*-beskz IS INITIAL ) = abap_true.
      SELECT SINGLE FROM mvke
        FIELDS dwerk
      WHERE vkorg = @ir_open_order->*-vkorg
        AND matnr = @ir_open_order->*-matnr
          INTO @lv_plant.

      SELECT SINGLE FROM marc
        FIELDS beskz, dismm
      WHERE matnr = @ir_open_order->*-matnr
        AND werks = @lv_plant
          INTO (@ir_open_order->*-beskz,@ir_open_order->*-dismm).

    ENDIF.

    " Get Sales document type text
    ir_open_order->*-bezei = st_sales_document_type[ auart = ir_open_order->*-auart ]-bezei.

    " Get Proft Center description
    ir_open_order->*-prctr_txt = st_profit_center[ prctr = ir_open_order->*-prctr ]-ltext.

    " Product hierarchy from alternative source
    " (when prodh is missing from the SD item)
    IF xsdbool( ir_open_order->*-prodh IS INITIAL ) = abap_true.
      SELECT SINGLE FROM  mvke
        FIELDS prodh
      WHERE matnr = @ir_open_order->*-matnr
        INTO @ir_open_order->*-prodh.
    ENDIF.

    " Get Product hierarchy text
    ir_open_order->*-vtext = st_product_hierarchy[ prodh = ir_open_order->*-prodh ]-vtext.

    " Get top level product hierarchy
    ir_open_order->*-top_prodh = st_product_hierarchy[ prodh = ir_open_order->*-prodh(5) ]-vtext.

    " Incompletion indicator
    IF xsdbool( line_exists( mt_completion_log[ vbeln = ir_open_order->*-vbeln ] ) ) = abap_true.
      ir_open_order->*-incomplete = abap_true.
    ENDIF.

    " Get the District/Group data
    ir_open_order->* = VALUE #(
      LET business = mt_business_data[ vbeln = ir_open_order->*-vbeln ]
      IN
      BASE ir_open_order->*

      bstkd         = business-bstkd
      bstkd_e      = business-bstkd_e
      bzirk        = business-bzirk
      kdgrp        = business-kdgrp
      bemot        = business-bemot
      podkz        = business-podkz
      inco1        = business-inco1
      inco2        = business-inco2
      ihrez_e      = business-ihrez_e
      so_curr_rate = business-kursk
    ).

    IF xsdbool( ir_open_order->*-zterm IS INITIAL ) = abap_true.
      ir_open_order->*-zterm = mt_business_data[ vbeln = ir_open_order->*-vbeln ]-zterm.
    ENDIF.

    " Get Sales district text
    ir_open_order->*-bztxt = st_sales_district[ bzirk = ir_open_order->*-bzirk ]-bztxt.

    " Get Usage Description
    ir_open_order->*-abrvw_txt = st_usage_descr[ abrvw = ir_open_order->*-abrvw ]-abrvw_txt.

    " Line Usage Description.
    ir_open_order->*-vkaus_txt = st_usage_descr[ abrvw = ir_open_order->*-vkaus ]-abrvw_txt.

    " Add the extended net value
    IF xsdbool( ir_open_order->*-target_qty IS INITIAL ) = abap_false.
      ir_open_order->*-netwr = ir_open_order->*-netwr / ir_open_order->*-target_qty * ir_open_order->*-qty.
    ENDIF.

    " Get the amount already billed from the billing plan
    IF xsdbool( iv_schedule = zsd_if_open_order=>mc_sales_order_w_schedule ) = abap_true.  " Billing plan not for ZRAS order types
      TRY.
          DATA(lw_billing_plan) = mt_billing_plan[ vbeln = ir_open_order->*-vbeln posnr = ir_open_order->*-posnr ].
          " Get qty shipped
          DATA(lv_shipped) = 0.
          IF xsdbool( line_exists( mt_buff_outb_doc_info[ vbelv = ir_open_order->*-vbeln posnv = ir_open_order->*-posnr ] ) ) = abap_true.
            lv_shipped = mt_buff_outb_doc_info[ vbelv = ir_open_order->*-vbeln posnv = ir_open_order->*-posnr ]-rfmng.
          ENDIF.
          ir_open_order->*-netwr = lw_billing_plan-fakwr / ( ir_open_order->*-target_qty - lv_shipped ) * ir_open_order->*-qty.
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.
    ENDIF.

    CASE ir_open_order->*-kalsm.
      WHEN 'ZISM01' OR 'ZISM02' OR 'ZISM03'.
        ir_open_order->*-corp_netwr = ir_open_order->*-netwr.
      WHEN OTHERS.
        ir_open_order->*-corp_netwr = mt_billing_plan[ vbeln = ir_open_order->*-vbeln posnr = ir_open_order->*-posnr ]-fakwr.
    ENDCASE.

    ir_open_order->*-kzwi6_key  = ir_open_order->*-waerk.
    ir_open_order->*-waerk_corp_netwr = ir_open_order->*-waerk.

    " Adjust the cost to schedule level
    IF xsdbool( iv_schedule = zsd_if_open_order=>mc_sales_order_w_schedule ) = abap_true.
      ir_open_order->*-wavwr = ( ir_open_order->*-wavwr / ir_open_order->*-target_qty ) * ir_open_order->*-qty.
    ENDIF.

    IF xsdbool( lv_gi_num = 0 ) = abap_true.
      ir_open_order->*-gistat = 'I'.
    ELSEIF xsdbool( lv_gi_num = lv_sto_qty ) = abap_true.
      ir_open_order->*-gistat = 'C'.
    ELSE.
      ir_open_order->*-gistat = 'P'.
    ENDIF.

    IF xsdbool( lv_gr_num = 0 ) = abap_true.
      ir_open_order->*-grstat = 'I'.
    ELSEIF xsdbool( lv_gr_num = lv_sto_qty ) = abap_true.
      ir_open_order->*-grstat = 'C'.
    ELSE.
      ir_open_order->*-grstat = 'P'.
    ENDIF.

    "Retrieve tax codes
    SELECT SINGLE FROM konv
      FIELDS
        mwsk1,
        mwsk2
    WHERE knumv = @ir_open_order->*-knumv
      AND kposn = @ir_open_order->*-posnr
      AND kschl = 'MWST'
        INTO (@ir_open_order->*-mwsk1, @ir_open_order->*-mwsk2).

    " Get the End User Price populated
    ir_open_order->* = VALUE #(
      LET end_user_price = mt_end_user_price[ knumv = ir_open_order->*-knumv kposn = ir_open_order->*-posnr ]
      IN
      BASE ir_open_order->*

      enduserprc     = end_user_price-kbetr * ir_open_order->*-qty
      enduserprc_key = end_user_price-waers
    ).

    " Change Return values to negative
    IF xsdbool(
         xsdbool( ir_open_order->*-vbtyp = 'H' ) = abap_true
      OR xsdbool( ir_open_order->*-vbtyp = 'K' ) = abap_true ) = abap_true.
      " Returns or Credit Memo request
      set_value( ir_open_order = ir_open_order iv_factor = -1 ).
    ENDIF.

    " Add the reasons for rejection and adjust cancelled order
    IF xsdbool( ir_open_order->*-abgru IS INITIAL ) = abap_false.
      ir_open_order->*-rej_reason = st_block_reason[ reason_code = ir_open_order->*-abgru ]-reason_desc.
      set_value( ir_open_order ).
    ENDIF.

    " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Get billing block and delivery block description
    " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Billing Block
    IF xsdbool( ir_open_order->*-faksk IS INITIAL ) = abap_false.
      ir_open_order->*-faksk_desc = st_bill_block[ reason_code = ir_open_order->*-faksk ]-reason_desc.
    ENDIF.

    " Delivery block
    IF xsdbool( ir_open_order->*-lifsk IS INITIAL ) = abap_false.
      ir_open_order->*-lifsk_desc = st_delivery_block[ reason_code = ir_open_order->*-lifsk ]-reason_desc.
    ENDIF.
    " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Add Production memo field
    " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    lv_object_name = |{ ir_open_order->*-vbeln }{ ir_open_order->*-posnr }|.

    CALL FUNCTION 'READ_TEXT'
      EXPORTING
        client    = cl_abap_syst=>get_client( )
        id        = '0006'
        language  = 'E'
        name      = lv_object_name
        object    = 'VBBP'
      TABLES
        lines     = lt_line
      EXCEPTIONS
        id        = 1
        language  = 2
        name      = 3
        not_found = 4
        OTHERS    = 8.
    IF xsdbool( sy-subrc = 0 ) = abap_false.
      " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " Get ISM Production Memo
      " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      SELECT FROM stxh
        FIELDS *
      WHERE tdobject = 'VBBP'
        AND tdname = @lv_object_name
        AND tdid = 'ZI06'
          INTO TABLE @DATA(lt_stxh).
      LOOP AT lt_stxh ASSIGNING FIELD-SYMBOL(<lw_stxh>).
        CALL FUNCTION 'READ_TEXT'
          EXPORTING
            id        = 'ZI06'
            language  = <lw_stxh>-tdspras
            name      = <lw_stxh>-tdname
            object    = 'VBBP'
          TABLES
            lines     = lt_line
          EXCEPTIONS
            id        = 1
            language  = 2
            name      = 3
            not_found = 4
            OTHERS    = 8.
        SELECT SINGLE FROM t002
          FIELDS laiso
        WHERE spras = @<lw_stxh>-tdspras
          INTO @DATA(lv_laiso).
        LOOP AT lt_line ASSIGNING FIELD-SYMBOL(<lw_line>).
          IF xsdbool( sy-tabix = 1 ) = abap_true.
            IF xsdbool( ir_open_order->*-prod_memo IS INITIAL ) = abap_true.
              ir_open_order->*-prod_memo = |{ lv_laiso }: { <lw_line>-tdline }|.
            ELSE.
              ir_open_order->*-prod_memo = |{ ir_open_order->*-prod_memo }#{ lv_laiso }: { <lw_line>-tdline }|.
            ENDIF.
          ELSE.
            ir_open_order->*-prod_memo = |{ ir_open_order->*-prod_memo }{ <lw_line>-tdline }|.
          ENDIF.
        ENDLOOP.

      ENDLOOP.
    ELSE.
      LOOP AT lt_line ASSIGNING <lw_line>.
        ir_open_order->*-prod_memo = |{ ir_open_order->*-prod_memo }{ <lw_line>-tdline }|.
      ENDLOOP.
    ENDIF.
    " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Get Posting period
    " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    CALL FUNCTION 'DATE_TO_PERIOD_CONVERT'
      EXPORTING
        i_date  = ir_open_order->*-audat
        i_periv = 'K4'  "Calendar year, 4 spec. periods
      IMPORTING
        e_buper = ir_open_order->*-poper
        e_gjahr = ir_open_order->*-bdatj.
    " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "  Get the group key
    " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ir_open_order->*-type = 'BACKLOG'.

  ENDMETHOD.


  METHOD outbound_doc_info.

    DATA: lt_buff_outb_doc_info TYPE zsd_tab_oo_buff_outb_doc_info.

    SELECT FROM vbfa JOIN vbup
      ON vbfa~vbeln = vbup~vbeln
     AND vbfa~posnn = vbup~posnr
        JOIN vbap
          ON vbfa~vbelv = vbap~vbeln
         AND vbfa~posnv = vbap~posnr
    FIELDS
      vbfa~vbelv,
      vbfa~posnv,
      vbfa~vbeln,
      vbfa~posnn,
      vbfa~meins,
      vbap~matnr,
      vbap~zieme,
      vbfa~vbtyp_n,
      vbfa~rfmng
    FOR ALL ENTRIES IN @it_lookup
      WHERE vbfa~vbelv = @it_lookup-order_num
        AND vbfa~vbtyp_n IN ('J','T')
        AND vbup~wbsta = 'C'
      INTO TABLE @DATA(lt_outbound_doc).

    " Adding to calculate unit of measures.
    LOOP AT lt_outbound_doc ASSIGNING FIELD-SYMBOL(<lw_outbound_doc>).
      IF xsdbool( <lw_outbound_doc>-meins = <lw_outbound_doc>-zieme ) = abap_false.
        SELECT SINGLE FROM marm
          FIELDS umren * @<lw_outbound_doc>-rfmng
        WHERE matnr = @<lw_outbound_doc>-matnr
          AND meinh = @<lw_outbound_doc>-zieme
        INTO @<lw_outbound_doc>-rfmng.
      ENDIF.
      APPEND CORRESPONDING #( <lw_outbound_doc> ) TO lt_buff_outb_doc_info.
    ENDLOOP.

    LOOP AT lt_buff_outb_doc_info ASSIGNING FIELD-SYMBOL(<lw_buf_outb_doc_info>).
      COLLECT <lw_buf_outb_doc_info> INTO mt_buff_outb_doc_info.
    ENDLOOP.

  ENDMETHOD.


  METHOD purchase_documents.

    DATA: lt_ekbe TYPE zsd_tab_oo_purchase_documents.

    SELECT FROM ekkn JOIN ekko
      ON ekkn~ebeln = ekko~ebeln
        JOIN ekpo
          ON ekkn~ebeln = ekpo~ebeln
         AND ekkn~ebelp = ekpo~ebelp
    FIELDS
      ekkn~vbeln,
      ekkn~vbelp,
      ekkn~ebeln,
      ekkn~ebelp,
      ekkn~menge AS qty,
      ekpo~netwr AS factory_netwr,
      ekko~waers
    FOR ALL ENTRIES IN @mt_open_orders
      WHERE ekkn~vbeln = @mt_open_orders-vbeln
        AND ekkn~vbelp = @mt_open_orders-vbelp
        AND ekpo~loekz = @abap_false
      INTO TABLE @DATA(lt_ekkn).

    LOOP AT lt_ekkn ASSIGNING FIELD-SYMBOL(<lw_ekkn>).
      SELECT FROM ekbe
        FIELDS
          ebeln,
          ebelp,
          vgabe,
          menge
        WHERE ebeln = @<lw_ekkn>-ebeln
          AND ebelp = @<lw_ekkn>-ebelp
          AND vgabe IN (1,6)
        INTO CORRESPONDING FIELDS OF TABLE @lt_ekbe.

      IF xsdbool( lt_ekbe IS INITIAL ) = abap_false.
        LOOP AT lt_ekbe ASSIGNING FIELD-SYMBOL(<lw_ekbe>).
          <lw_ekbe> = CORRESPONDING #( BASE ( <lw_ekbe> ) <lw_ekkn> MAPPING factory_netwr = factory_netwr qty = qty waers = waers ).
        ENDLOOP.
        MOVE-CORRESPONDING lt_ekbe TO mt_purchase_documents KEEPING TARGET LINES.
      ELSE.
        APPEND CORRESPONDING #( <lw_ekkn> ) TO mt_purchase_documents.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD retrieve_business_data.

    IF xsdbool( mt_open_orders IS INITIAL ) = abap_true.
      RETURN.
    ENDIF.

    " Fill the District/Group HASHED int.table
    SELECT FROM vbkd
      FIELDS vbeln,   " Sales and distribution document number
             bstkd,   " Customer purchase order number
             bstkd_e, " Ship-to party PO
             bzirk,   " Sales district
             kdgrp,   " Customer group
             bemot,   " Account Indicator
             podkz,   " Proof-of-delivery flag
             inco1,   " Incoterms 1
             inco2,   " Incoterms 2
             ihrez_e, " Ship-to party character
             zterm,
             kursk
        FOR ALL ENTRIES IN @mt_open_orders
      WHERE vbeln = @mt_open_orders-vbeln
        AND posnr = 000000
          INTO TABLE @DATA(lt_business_data).

    MOVE-CORRESPONDING lt_business_data TO mt_business_data.

  ENDMETHOD.


  METHOD select_ref_doc_wo_sched_line.

    " ZIPK
    TYPES:
      BEGIN OF lty_ref_doc,
        ref_doc      TYPE zsd_doc_num_pkg_contr,
        ref_doc_item TYPE zsd_doc_itm_pkg_contr,
      END OF lty_ref_doc.

    DATA: lt_vbfa TYPE STANDARD TABLE OF vbfa.
    DATA: lt_ref_doc TYPE HASHED TABLE OF lty_ref_doc
                     WITH UNIQUE KEY ref_doc ref_doc_item.

    LOOP AT ir_order->* REFERENCE INTO DATA(lr_order)
          WHERE ( ref_doc_pkg <> ''
            AND   ref_itm_pkg <> '' )
             OR   auart = 'ZIPK'.

      IF xsdbool( lr_order->*-auart = 'ZIPK' ) = abap_true.

        CLEAR: lt_vbfa[].

        CALL FUNCTION 'RV_ORDER_FLOW_INFORMATION'
          EXPORTING
            aufbereitung  = '2'
            comwa         = VALUE vbco6( vbeln = lr_order->*-vbeln posnr = lr_order->*-posnr )
            nachfolger    = abap_true
            n_stufen      = '01'
          TABLES
            vbfa_tab      = lt_vbfa
          EXCEPTIONS
            no_vbfa       = 1
            no_vbuk_found = 2
            OTHERS        = 3.
        IF xsdbool( sy-subrc = 0 ) = abap_true.

          ASSIGN lt_vbfa[ vbelv = lr_order->*-vbeln vbtyp_v = 'G' vbtyp_n = 'C' ] TO FIELD-SYMBOL(<lw_vbfa>).
          IF xsdbool( sy-subrc = 0 ) = abap_true.
            IF xsdbool( <lw_vbfa>-vbeln IS INITIAL ) = abap_false.
              IF xsdbool( line_exists( ir_order->*[ vbeln = <lw_vbfa>-vbeln posnr = <lw_vbfa>-posnn ] ) ) = abap_false.
                INSERT VALUE #( ref_doc = <lw_vbfa>-vbeln ref_doc_item = <lw_vbfa>-posnn ) INTO TABLE lt_ref_doc.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDIF.
      ELSE.

        IF xsdbool( line_exists( ir_order->*[ vbeln = lr_order->*-ref_doc_pkg posnr = lr_order->*-ref_itm_pkg ] ) ) = abap_false.
          SELECT SINGLE FROM vbak FIELDS auart, vbtyp
            WHERE vbeln = @lr_order->*-ref_doc_pkg
              INTO (@DATA(lv_auart), @DATA(lv_vbtyp)).
          IF xsdbool( sy-subrc = 0 ) = abap_true.
            IF xsdbool(
  " -------------------------------------------------------------------------------
                  xsdbool(
                        xsdbool( lr_order->*-auart = 'ZIPK' ) = abap_false
                    AND xsdbool( lv_auart = 'ZIPK' ) = abap_true ) = abap_true
  " -------------------------------------------------------------------------------
              OR xsdbool(
                 xsdbool( lr_order->*-auart = 'ZIPK' ) = abap_true
             AND xsdbool( lv_vbtyp = 'C' ) = abap_true ) = abap_true
  " -------------------------------------------------------------------------------
            ) = abap_true.
              IF xsdbool( line_exists( lt_ref_doc[ ref_doc = lr_order->*-ref_doc_pkg ref_doc_item = lr_order->*-ref_itm_pkg ] ) ) = abap_false.
                INSERT VALUE #( ref_doc = lr_order->*-ref_doc_pkg ref_doc_item = lr_order->*-ref_itm_pkg  ) INTO TABLE lt_ref_doc.
              ENDIF.
            ENDIF.

          ENDIF.
        ENDIF.
      ENDIF.

    ENDLOOP.

    IF xsdbool( lt_ref_doc IS INITIAL ) = abap_false.
      SELECT FROM zsd_open_orders
        FIELDS *
      FOR ALL ENTRIES IN @lt_ref_doc
        WHERE vbeln = @lt_ref_doc-ref_doc
          AND posnr = @lt_ref_doc-ref_doc_item
          AND fksta <> 'C'      " Billing Status (Delivery-related)
          AND fksaa <> 'C'      " Billing Status (Order-related)
          AND fkstk <> 'C'      " Billing Status.
            APPENDING CORRESPONDING FIELDS OF TABLE @ir_order->*.
      ir_order->*[ schedule_item = space ]-schedule_item = zsd_if_open_order~mc_sales_order_wo_schedule.
    ENDIF.

    LOOP AT ir_order->* REFERENCE INTO lr_order
      WHERE auart = 'ZIPK'.
      CLEAR: lr_order->*-ref_doc_pkg.
      CLEAR: lr_order->*-ref_itm_pkg.
    ENDLOOP.

  ENDMETHOD.


  METHOD select_ref_doc_w_schedule_line.

    " ZIPK
    TYPES:
      BEGIN OF lty_ref_doc,
        ref_doc      TYPE zsd_doc_num_pkg_contr,
        ref_doc_item TYPE zsd_doc_itm_pkg_contr,
      END OF lty_ref_doc.

    DATA: lt_vbfa TYPE STANDARD TABLE OF vbfa.
    DATA: lt_ref_doc TYPE HASHED TABLE OF lty_ref_doc
                     WITH UNIQUE KEY ref_doc ref_doc_item.


    LOOP AT ir_order->* REFERENCE INTO DATA(lr_order)
          WHERE ( ref_doc_pkg <> ''
            AND   ref_itm_pkg <> '' )
             OR   auart = 'ZIPK'.

      IF xsdbool( lr_order->*-auart = 'ZIPK' ) = abap_true.

        CLEAR: lt_vbfa[].

        CALL FUNCTION 'RV_ORDER_FLOW_INFORMATION'
          EXPORTING
            aufbereitung  = '2'
            comwa         = VALUE vbco6( vbeln = lr_order->*-vbeln posnr = lr_order->*-posnr )
            nachfolger    = abap_true
            n_stufen      = '01'
          TABLES
            vbfa_tab      = lt_vbfa
          EXCEPTIONS
            no_vbfa       = 1
            no_vbuk_found = 2
            OTHERS        = 3.
        IF xsdbool( sy-subrc = 0 ) = abap_true.

          ASSIGN lt_vbfa[ vbelv = lr_order->*-vbeln vbtyp_v = 'G' vbtyp_n = 'C' ] TO FIELD-SYMBOL(<lw_vbfa>).
          IF xsdbool( sy-subrc = 0 ) = abap_true.
            IF xsdbool( <lw_vbfa>-vbeln IS INITIAL ) = abap_false.
              IF xsdbool( line_exists( ir_order->*[ vbeln = <lw_vbfa>-vbeln posnr = <lw_vbfa>-posnn ] ) ) = abap_false.
                INSERT VALUE #( ref_doc = <lw_vbfa>-vbeln ref_doc_item = <lw_vbfa>-posnn ) INTO TABLE lt_ref_doc.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDIF.
      ELSE.

        IF xsdbool( line_exists( ir_order->*[ vbeln = lr_order->*-ref_doc_pkg posnr = lr_order->*-ref_itm_pkg ] ) ) = abap_false.
          SELECT SINGLE FROM vbak FIELDS auart, vbtyp
            WHERE vbeln = @lr_order->*-ref_doc_pkg
              INTO (@DATA(lv_auart), @DATA(lv_vbtyp)).
          IF xsdbool( sy-subrc = 0 ) = abap_true.
            IF xsdbool(
  " -------------------------------------------------------------------------------
                  xsdbool(
                        xsdbool( lr_order->*-auart = 'ZIPK' ) = abap_false
                    AND xsdbool( lv_auart = 'ZIPK' ) = abap_true ) = abap_true
  " -------------------------------------------------------------------------------
              OR xsdbool(
                 xsdbool( lr_order->*-auart = 'ZIPK' ) = abap_true
             AND xsdbool( lv_vbtyp = 'C' ) = abap_true ) = abap_true
  " -------------------------------------------------------------------------------
            ) = abap_true.
              IF xsdbool( line_exists( lt_ref_doc[ ref_doc = lr_order->*-ref_doc_pkg ref_doc_item = lr_order->*-ref_itm_pkg ] ) ) = abap_false.
                INSERT  VALUE #( ref_doc = lr_order->*-ref_doc_pkg ref_doc_item = lr_order->*-ref_itm_pkg  ) INTO TABLE lt_ref_doc.
              ENDIF.
            ENDIF.

          ENDIF.
        ENDIF.
      ENDIF.

    ENDLOOP.

    IF xsdbool( lt_ref_doc IS INITIAL ) = abap_false.
      SELECT FROM zsd_open_orders
        FIELDS *
      FOR ALL ENTRIES IN @lt_ref_doc
        WHERE vbeln = @lt_ref_doc-ref_doc
          AND posnr = @lt_ref_doc-ref_doc_item
          AND fksta <> 'C'      " Billing Status (Delivery-related)
          AND fksaa <> 'C'      " Billing Status (Order-related)
          AND fkstk <> 'C'      " Billing Status.
            APPENDING CORRESPONDING FIELDS OF TABLE @ir_order->*.
      ir_order->*[ schedule_item = space ]-schedule_item = zsd_if_open_order~mc_sales_order_w_schedule.
    ENDIF.

    LOOP AT ir_order->* REFERENCE INTO lr_order
      WHERE auart = 'ZIPK'.
      CLEAR: lr_order->*-ref_doc_pkg.
      CLEAR: lr_order->*-ref_itm_pkg.
    ENDLOOP.

  ENDMETHOD.


  METHOD select_with_sched_line.

    DATA: lt_orders TYPE zsd_tab_open_order_new.

    DATA(lt_sales_doc_type) = mw_select_options-sales_doc_type[].
    lt_sales_doc_type[] = VALUE #( BASE lt_sales_doc_type[]
      ( sign = 'E' option = 'EQ' low = 'ZRSS' ) " Repair/Service(FIX)
      ( sign = 'E' option = 'EQ' low = 'ZIRA' ) " Repair ISM
      ( sign = 'E' option = 'EQ' low = 'ZRAS' ) " Repair/Service
      ( sign = 'E' option = 'EQ' low = 'ZDR' )  " Debit Memo
      ( sign = 'E' option = 'EQ' low = 'ZIL2' ) " ISM Debit Memo
      ( sign = 'E' option = 'EQ' low = 'ZIG2' ) " ISM Credit Memo
      ( sign = 'E' option = 'EQ' low = 'ZCR' )  " Credit Memo
    ).

    SELECT FROM zsd_open_orders
      FIELDS *
    WHERE ( qty <> 0                                          " Confirmed Quantity
       OR lifsk IN ('ZE', 'ZB', 'ZH', '')                     " Delivery block (document header)
      )
      AND bukrs_vf IN @mw_select_options-ccode                " Company code to be billed
      AND vkorg    IN @mw_select_options-sales_organization   " Sales organization
      AND vtweg    IN @mw_select_options-distribution_channel " Distribution channel
      AND spart    IN @mw_select_options-division             " Division
      AND vkbur    IN @mw_select_options-sales_office         " Sales Office
      AND dwerk    IN @mw_select_options-delivery_plant       " Delivering plant
      AND kunnr    IN @mw_select_options-sold_customer        " Sold-to party
      AND audat    IN @mw_select_options-document_date        " Document date (date received/sent)
      AND vdatu    IN @mw_select_options-req_del_date         " Requested delivery date
      AND cmfre    IN @mw_select_options-cred_rel_date        " Credit Release Date
      AND edatu    IN @mw_select_options-sched_line_date      " Schedule line date
      AND vbeln    IN @mw_select_options-sales_document       " Sales document
      AND posnr    IN @mw_select_options-sales_doc_item       " Sales document item
      AND auart    IN @lt_sales_doc_type                      " Sales document type
      AND ernam    IN @mw_select_options-created_by           " Created By
      AND matnr    IN @mw_select_options-material_number      " Material number
      AND abgru    IN @mw_select_options-reason_reject        " reason of rejection
      AND prodh    IN @mw_select_options-prod_hier            " Product hierarchy
      AND abrvw    IN @mw_select_options-usage                " Header Usage
      AND fksta    <> 'C'                                     " Billing Status (Delivery-related)
      AND fksaa    <> 'C'                                     " Billing Status (Order-related)
      AND fkstk    <> 'C'                                     " Billing Status
        INTO TABLE @DATA(lt_order).

    IF xsdbool( lt_order[] IS INITIAL ) = abap_false.
      SELECT FROM tvap
        FIELDS *
      FOR ALL ENTRIES IN @lt_order
        WHERE pstyv = @lt_order-pstyv
          INTO TABLE @DATA(lt_tvap).

      mt_open_orders = VALUE #(
        FOR <lw_order> IN lt_order
        FOR <lw_tvap> IN lt_tvap WHERE ( pstyv = <lw_order>-pstyv AND eterl = abap_true )
        ( CORRESPONDING #( BASE ( VALUE #( schedule_item = zsd_if_open_order~mc_sales_order_w_schedule ) ) <lw_order> ) )
      ).

    ENDIF.

    SORT mt_open_orders BY bukrs_vf vbeln posnr edatu.

    select_ref_doc_w_schedule_line( REF #( mt_open_orders ) ).

  ENDMETHOD.


  METHOD select_wo_sched_line.

    DATA: lt_orders TYPE zsd_tab_open_order_new.

    DATA(lt_sales_doc_type) = mw_select_options-sales_doc_type[].
    lt_sales_doc_type[] = VALUE #( BASE lt_sales_doc_type[]
      ( sign = 'I' option = 'EQ' low = 'ZRSS' ) " Repair/Service(FIX)
      ( sign = 'I' option = 'EQ' low = 'ZIRA' ) " Repair ISM
      ( sign = 'I' option = 'EQ' low = 'ZRAS' ) " Repair/Service
      ( sign = 'I' option = 'EQ' low = 'ZDR' )  " Debit Memo
      ( sign = 'I' option = 'EQ' low = 'ZIL2' ) " ISM Debit Memo
      ( sign = 'I' option = 'EQ' low = 'ZIG2' ) " ISM Credit Memo
      ( sign = 'I' option = 'EQ' low = 'ZCR' )  " Credit Memo
      ( sign = 'I' option = 'EQ' low = 'ZIPK' ) " ISM Package Contract
      ( sign = 'I' option = 'EQ' low = 'ZISC' ) " ISM Service Contract
    ).

    SELECT FROM zsd_open_orders
      FIELDS *
    WHERE gbstk     <> 'C'                                     " Overall status of document
      AND bukrs_vf  IN @mw_select_options-ccode                " Company code to be billed
      AND vkorg     IN @mw_select_options-sales_organization   " Sales organization
      AND vtweg     IN @mw_select_options-distribution_channel " Distribution channel
      AND spart     IN @mw_select_options-division             " Division
      AND vkbur     IN @mw_select_options-sales_office         " Sales Office
      AND dwerk     IN @mw_select_options-delivery_plant       " Delivering plant
      AND kunnr     IN @mw_select_options-sold_customer        " Sold-to party
      AND audat     IN @mw_select_options-document_date        " Document date (date received/sent)
      AND vdatu     IN @mw_select_options-req_del_date         " Requested delivery date
      AND cmfre     IN @mw_select_options-cred_rel_date        " Release Date
      AND vbeln     IN @mw_select_options-sales_document       " Sales document
      AND posnr     IN @mw_select_options-sales_doc_item       " Sales document item
      AND auart     IN @mw_select_options-sales_doc_type       " Sales document type
      AND ernam     IN @mw_select_options-created_by           " Created By
      AND matnr     IN @mw_select_options-material_number      " Material number
      AND prodh     IN @mw_select_options-prod_hier            " Product hierarchy
      AND abgru     IN @mw_select_options-reason_reject        " Reason of rejection
      AND abrvw     IN @mw_select_options-usage                " Header Usage
      AND fksta NOT IN ('B','C')                               " Billing status of delivery-related billing documents
      AND fksaa NOT IN ('B','C')                               " Billing Status for Order-Related Billing Documents
      AND fksak     <> 'C'                                     " Billing Status (Order-Related Billing Document)
      AND fkstk     <> 'C'                                     " Billing Status (Order-Related Billing Document)
        INTO TABLE @DATA(lt_order).

    IF xsdbool( lt_order[] IS INITIAL ) = abap_false.
      SELECT FROM tvap
        FIELDS *
      FOR ALL ENTRIES IN @lt_order
        WHERE pstyv = @lt_order-pstyv
          INTO TABLE @DATA(lt_tvap).

      mt_open_orders = VALUE #( BASE mt_open_orders
        FOR <lw_order> IN lt_order
        FOR <lw_tvap> IN lt_tvap WHERE ( pstyv = <lw_order>-pstyv AND eterl = abap_false )
        ( CORRESPONDING #( BASE ( VALUE #( schedule_item = zsd_if_open_order~mc_sales_order_w_schedule ) ) <lw_order> ) )
      ).

    ENDIF.

    SORT mt_open_orders BY bukrs_vf vbeln posnr edatu schedule_item.

    select_ref_doc_wo_sched_line( REF #( mt_open_orders ) ).

  ENDMETHOD.


  METHOD set_breakdown_element_value.
    ir_open_order->* = VALUE #( BASE ir_open_order->*
      sum_wavwr     = ir_open_order->*-sum_wavwr      * iv_factor
      burdened_cost = ir_open_order->*-burdened_cost  * iv_factor
      raw_mat       = ir_open_order->*-raw_mat        * iv_factor
      semi_mat      = ir_open_order->*-semi_mat       * iv_factor
      labor         = ir_open_order->*-labor          * iv_factor
      setup_time    = ir_open_order->*-setup_time     * iv_factor
      osp           = ir_open_order->*-osp            * iv_factor
      mfg_ovhd      = ir_open_order->*-mfg_ovhd       * iv_factor
      non_mfg_ovhd  = ir_open_order->*-non_mfg_ovhd   * iv_factor
      matnr_ovhd    = ir_open_order->*-matnr_ovhd     * iv_factor
      sum_material  = ir_open_order->*-sum_material   * iv_factor
      sum_other     = ir_open_order->*-sum_other      * iv_factor
      sum_lab       = ir_open_order->*-sum_lab        * iv_factor
      sum_lab_ovrh  = ir_open_order->*-sum_lab_ovrh   * iv_factor
      sum_mat_ovrh  = ir_open_order->*-sum_mat_ovrh   * iv_factor
      sum_oth_ovrh  = ir_open_order->*-sum_oth_ovrh   * iv_factor
      sum_oth_u     = ir_open_order->*-sum_oth_u      * iv_factor
      sum_out_s     = ir_open_order->*-sum_out_s      * iv_factor
      sum_over      = ir_open_order->*-sum_over       * iv_factor
    ).
  ENDMETHOD.


  METHOD set_value.
    ir_open_order->* = VALUE #(
      enduserprc    = ir_open_order->*-enduserprc    * iv_factor
      netwr         = ir_open_order->*-netwr         * iv_factor
      local_netwr   = ir_open_order->*-local_netwr   * iv_factor
      group_netwr   = ir_open_order->*-group_netwr   * iv_factor
      factory_netwr = ir_open_order->*-factory_netwr * iv_factor
      wavwr         = ir_open_order->*-wavwr         * iv_factor
    ).
    set_breakdown_element_value( ir_open_order = ir_open_order iv_factor = 0 ).
  ENDMETHOD.


  METHOD zsd_if_base_reports~determine.

    " Sales Document Business Data (Table VBKD)
    retrieve_business_data( ).

    DATA(lt_lookup) = find_unique_orders( ).

    customer_information( lt_lookup ).

    end_user_price( lt_lookup ).

    commission_zrcm( lt_lookup ).

    conversion_rate( lt_lookup ).

    completion_log( lt_lookup ).

    purchase_documents( ).

    billing_plan( ).

    outbound_doc_info( lt_lookup ).

    rr_selection_result = this.

  ENDMETHOD.


  METHOD zsd_if_base_reports~select.
    " Selection of open order w/ schedule lines
    select_with_sched_line( ).

    " Selection of open order w/o schedule lines
    select_wo_sched_line( ).

    rr_selection_result = this.
  ENDMETHOD.


  METHOD zsd_if_open_order~determine.
    rr_result = CAST zsd_if_open_order( CAST zsd_if_base_reports( this )->determine( ) ).
  ENDMETHOD.


  METHOD zsd_if_open_order~process.
    rr_result = CAST zsd_if_open_order( CAST zsd_if_rep_processing( this )->processing( ) ).
  ENDMETHOD.


  METHOD zsd_if_open_order~select.
    rr_open_order = CAST zsd_if_open_order( CAST zsd_if_base_reports( this )->select( ) ).
  ENDMETHOD.


  METHOD zsd_if_rep_processing~miscellaneous.

  ENDMETHOD.


  METHOD zsd_if_rep_processing~processing.

    DATA: lv_insert_flag TYPE boolean.
    DATA: lv_qty_shipped TYPE p DECIMALS 3.

    LOOP AT mt_open_orders ASSIGNING FIELD-SYMBOL(<lw_open_order>).

      " Subtract freight from net Value
      <lw_open_order>-netwr = <lw_open_order>-netwr - <lw_open_order>-kzwi3.

      " Free of charge items do not have billing status.
      " If the overall delivery flag on the line is complete, then discard
      " the whole line from the backlog report.
      IF xsdbool(
        " ------------------------------------------------------------------------------------------------------
         xsdbool( <lw_open_order>-lfsta = 'C' ) = abap_true
        " ------------------------------------------------------------------------------------------------------
          AND xsdbool(
        " ------------------------------------------------------------------------------------------------------
              xsdbool( <lw_open_order>-pstyv = 'ZSNN' ) = abap_true
           OR xsdbool( <lw_open_order>-pstyv = 'ZTAX' ) = abap_true
           OR xsdbool( <lw_open_order>-pstyv = 'TANN' ) = abap_true ) = abap_true
        ) = abap_true.
        " ------------------------------------------------------------------------------------------------------
        CONTINUE.
      ENDIF.

      " Add credit status
      SELECT SINGLE FROM tvbst
        FIELDS bezei
      WHERE spras = @( cl_abap_syst=>get_language( ) )
        AND tbnam = 'VBUK'
        AND fdnam = 'CMGST'
        AND statu = @<lw_open_order>-cmgst
          INTO @<lw_open_order>-bezei2.

      " Adjust the quantity which has been zero out by
      " ZB - CS Hold: w/o MRPTTO
      IF xsdbool(
        " ------------------------------------------------------------------------------------------------------
         xsdbool( <lw_open_order>-lifsk = 'ZB' ) = abap_true
        OR xsdbool( <lw_open_order>-lifsk = 'ZE' ) = abap_true
        OR xsdbool( <lw_open_order>-lifsk = 'ZH' ) = abap_true
        ) = abap_true.
        " ------------------------------------------------------------------------------------------------------
        <lw_open_order>-qty = <lw_open_order>-wmeng.
      ENDIF.

      DATA(lw_buffer) = <lw_open_order>.

      AT NEW posnr.
        CLEAR: lv_insert_flag.
        CLEAR: lv_qty_shipped.
        lv_qty_shipped = VALUE #( mt_outbound_doc_info[ vbelv = lw_buffer-vbeln posnv = lw_buffer-posnr ]-rfmng OPTIONAL ).
      ENDAT.

      commission( REF #( <lw_open_order> ) ).

      " If the schedule line quantity to ship is greater the quantity
      " shipped
      IF xsdbool( <lw_open_order>-qty > lv_qty_shipped ) = abap_true.
        <lw_open_order>-qty = <lw_open_order>-qty - lv_qty_shipped.
        CLEAR: lv_qty_shipped.
        determine_order_type( REF #( <lw_open_order> ) ).
        miscellaneous( REF #( <lw_open_order> ) ).
        cust_info( REF #( <lw_open_order> ) ).
        cost( REF #( <lw_open_order> ) ).
        factory_net_value( REF #( <lw_open_order> ) ).
        currency_conversion( REF #( <lw_open_order> ) ).



***        PERFORM buf_fill USING 'SCHED'.
***        PERFORM get_curr_conv.
***        CHECK wa_buf-bstkd IN s_bstkd.                      "CTX01

        " ZIPK
***        PERFORM follow_up_orders.
***        INSERT wa_buf INTO TABLE: it_res .
        lv_insert_flag = abap_true.
      ELSE.
*** When the schedule line quantity to ship is less than or equal to
*** quantity shipped
        lv_qty_shipped = lv_qty_shipped - <lw_open_order>-qty.
      ENDIF.


    ENDLOOP.

  ENDMETHOD.

  METHOD currency_conversion.

  ENDMETHOD.

ENDCLASS.
