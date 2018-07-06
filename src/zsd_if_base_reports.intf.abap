"! <p class="shorttext synchronized" lang="en">Base Reports</p>
interface ZSD_IF_BASE_REPORTS
  public .


  interfaces ZSD_IF_REP_PROCESSING .

  "! <p class="shorttext synchronized" lang="en">Selection of datas</p>
  "! @parameter rr_selection_result | <p class="shorttext synchronized" lang="en">Base Reports</p>
  methods SELECT default ignore
    returning
      value(RR_SELECTION_RESULT) type ref to ZSD_IF_BASE_REPORTS .
  "! <p class="shorttext synchronized" lang="en">Determine of particular information</p>
  "! @parameter rr_selection_result | <p class="shorttext synchronized" lang="en">Base Reports</p>
  methods DETERMINE default ignore
    returning
      value(RR_SELECTION_RESULT) type ref to ZSD_IF_BASE_REPORTS .
endinterface.
