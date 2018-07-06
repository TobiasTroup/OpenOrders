"! <p class="shorttext synchronized" lang="en">Open Order</p>
interface ZSD_IF_OPEN_ORDER
  public .


  constants MC_SALES_ORDER_W_SCHEDULE type ZSD_SCHEDULE value 1 ##NO_TEXT.
  constants MC_SALES_ORDER_WO_SCHEDULE type ZSD_SCHEDULE value 2 ##NO_TEXT.

  "! <p class="shorttext synchronized" lang="en">Selection of datas</p>
  methods SELECT
    returning
      value(RR_OPEN_ORDER) type ref to ZSD_IF_OPEN_ORDER .
  methods DETERMINE
    returning
      value(RR_RESULT) type ref to ZSD_IF_OPEN_ORDER .
  methods PROCESS
    returning
      value(RR_RESULT) type ref to ZSD_IF_OPEN_ORDER .
endinterface.
