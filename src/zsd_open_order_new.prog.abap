*&---------------------------------------------------------------------*
*& Report zsd_open_order_new
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsd_open_order_new.

INCLUDE zsd_open_order_globals. " Globals
INCLUDE zsd_open_order_scr.     " Screen definition
INCLUDE zsd_open_order_cld.     " Class definition
INCLUDE zsd_open_order_cli.     " Class implementation

START-OF-SELECTION.
  zcl_application=>start( ).
