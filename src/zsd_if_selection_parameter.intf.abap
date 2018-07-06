"! <p class="shorttext synchronized" lang="en">Selection Parameter</p>
INTERFACE zsd_if_selection_parameter
  PUBLIC.

  "! <p class="shorttext synchronized" lang="en">Add Parameter</p>
  "! @parameter iv_param_name  | <p class="shorttext synchronized" lang="en">Parameter name</p>
  "! @parameter ir_param_value | <p class="shorttext synchronized" lang="en">Parameter value</p>
  "! @parameter rr_parameter   | <p class="shorttext synchronized" lang="en">Selection Parameter</p>
  METHODS add_param
    IMPORTING
      !iv_param_name      TYPE string
      !ir_param_value     TYPE REF TO data
    RETURNING
      VALUE(rr_parameter) TYPE REF TO zsd_if_selection_parameter .
ENDINTERFACE.
