*&---------------------------------------------------------------------*
*&  Include  zsd_open_order_scr
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK blk_1 WITH FRAME TITLE TEXT-001.
SELECT-OPTIONS: s_bukrs FOR vbak-bukrs_vf MEMORY ID buk. " Company code to be billed
SELECT-OPTIONS: s_vkorg FOR vbak-vkorg MEMORY ID vko.    " Sales Organization
SELECT-OPTIONS: s_vtweg FOR vbak-vtweg.                  " Distribution channel
SELECT-OPTIONS: s_spart FOR vbak-spart.                  " Division
SELECT-OPTIONS: s_vkbur FOR vbak-vkbur.                  " Sales Office
SELECT-OPTIONS: s_werks FOR vbap-werks.                  " Delivering plant
SELECTION-SCREEN END OF BLOCK blk_1.

SELECTION-SCREEN BEGIN OF BLOCK blk_2 WITH FRAME TITLE TEXT-002.
SELECT-OPTIONS: s_audat FOR vbak-audat. " Document date
SELECT-OPTIONS: s_vdatu FOR vbak-vdatu. " Requested delivery date
SELECT-OPTIONS: s_edatu FOR vbep-edatu. " Schedule line date
SELECT-OPTIONS: s_crrel FOR vbak-cmfre. " Credit Release Date
PARAMETERS: p_exdte TYPE edatu_vbak.    " Currency exchange rate date
SELECTION-SCREEN END OF BLOCK blk_2.

SELECTION-SCREEN BEGIN OF BLOCK blk_3 WITH FRAME TITLE TEXT-003.
SELECT-OPTIONS: s_vbeln FOR vbak-vbeln.                     " Sales document
SELECT-OPTIONS: s_posnr FOR vbap-posnr.                     " Sales document item
SELECT-OPTIONS: s_auart FOR vbak-auart.                     " Sales document type
SELECT-OPTIONS: s_kunnr FOR vbak-kunnr.                     " Sold-to party
SELECT-OPTIONS: s_bstkd FOR vbkd-bstkd.                     " Customer PO number
SELECT-OPTIONS: s_ernam FOR vbak-ernam.                     " Created By
PARAMETERS: p_reject TYPE c AS CHECKBOX DEFAULT abap_false. " Rejected
SELECT-OPTIONS: s_abgru FOR vbap-abgru NO-DISPLAY.          " Reasons of reject
SELECTION-SCREEN END OF BLOCK blk_3.

SELECTION-SCREEN BEGIN OF BLOCK blk_4 WITH FRAME TITLE TEXT-004.
SELECT-OPTIONS: s_matnr FOR vbap-matnr. " Material number
SELECT-OPTIONS: s_prodh FOR vbap-prodh. " Product hierarchy
SELECTION-SCREEN END OF BLOCK blk_4.

SELECTION-SCREEN BEGIN OF BLOCK blk_5 WITH FRAME TITLE TEXT-005.
SELECT-OPTIONS: s_abrvw FOR vbak-abrvw. " Usage
SELECTION-SCREEN END OF BLOCK blk_5.

SELECTION-SCREEN BEGIN OF BLOCK block6 WITH FRAME TITLE TEXT-006.
PARAMETERS: p_vari TYPE slis_vari.
SELECTION-SCREEN END OF BLOCK block6.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_vari.
  CALL FUNCTION 'REUSE_ALV_VARIANT_F4'
    EXPORTING
      is_variant    = VALUE disvariant( report = sy-repid )
      i_save        = 'A'
    IMPORTING
      es_variant    = gw_variant
    EXCEPTIONS
      not_found     = 1
      program_error = 2
      OTHERS        = 3.
  IF xsdbool( sy-subrc = 0 ) = abap_true.
    p_vari = gw_variant-variant.
  ENDIF.
