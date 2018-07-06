interface ZSD_IF_REP_PROCESSING
  public .


  methods PROCESSING
    returning
      value(RR_RESULT) type ref to ZSD_IF_REP_PROCESSING .
  methods FACTORY_NETWR .
  methods CUSTOMER_INFORMATION .
  methods COST .
  methods CURRENCY_CONVERSATION .
  methods MISCELLANEOUS .
endinterface.
