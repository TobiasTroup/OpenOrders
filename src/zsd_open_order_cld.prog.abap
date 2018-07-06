*&---------------------------------------------------------------------*
*&  Include  zsd_open_order_cld
*&---------------------------------------------------------------------*

"! <p class="shorttext synchronized" lang="en"><strong>Open Order</strong></p>
CLASS zcl_application DEFINITION.
  PUBLIC SECTION.
    "! <p class="shorttext synchronized" lang="en">Beginning of processing in Open Order</p>
    CLASS-METHODS start.

    "! <p class="shorttext synchronized" lang="en">Saving parameters of the input screen</p>
    "! @parameter ir_parameters | <p class="shorttext synchronized" lang="en">Selection Parameter</p>
    "! @parameter er_parameters | <p class="shorttext synchronized" lang="en">Returning Selection Parameter</p>
    CLASS-METHODS parameters
      IMPORTING
        ir_parameters        TYPE REF TO zsd_if_selection_parameter
      RETURNING
        VALUE(er_parameters) TYPE REF TO zsd_if_selection_parameter.

ENDCLASS.
