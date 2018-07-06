@AbapCatalog.sqlViewName: 'zsdOpenOrderView'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Open Orders'
define view zsd_open_orders as 
  select distinct from vbak
    join vbap
      on vbak.vbeln = vbap.vbeln
        join vbuk
          on vbuk.vbeln = vbak.vbeln
            join vbep
              on vbap.vbeln = vbep.vbeln
             and vbap.posnr = vbep.posnr
                join vbup
                  on vbap.vbeln = vbup.vbeln
                 and vbap.posnr = vbup.posnr
                    left outer join vbkd
                      on vbap.vbeln = vbkd.vbeln
                     and vbap.posnr = vbkd.posnr
                        join mara
                          on vbap.matnr = mara.matnr
{
  vbak.bukrs_vf,             // Company code to be billed
  vbak.vkorg,                // Sales organization
  vbak.vtweg,                // Distribution channel
  vbak.spart,                // Division
  vbap.werks as dwerk,       // Delivering plant
  vbak.vbeln,                // Sales document
  vbap.posnr as vbelp,       // Sales item number
  vbak.audat,                // Document date (date received/sent)
  vbak.vdatu,                // Requested delivery date
  vbak.kunnr,                // Sold-to party
  vbak.vkgrp,                // Sales group
  vbak.auart,                // Sales document type
  vbak.vbtyp,                // SD document category
  vbak.vkbur,                // Primary market (SALES OFFICE)
  vbak.knumv,                // Condition Document number
  vbak.ernam,                // Name of Person who Created the Object
  vbak.abrvw,                // Header Usage
  vbak.cmfre,                // Release date
  vbap.posnr,                // Sales document item
  vbap.pstyv,                // Sales document item category
  vbap.prodh,                // Product hierarchy
  vbap.matnr,                // Material number
  vbap.arktx,                // Short text for sales order item
  mara.mtart,                // Material type
  vbap.netpr,                // Net price
  vbap.netwr,                // Net Value
  vbap.waerk,                // SD Document currency
  vbap.wavwr,                // Cost
  vbap.abgru,                // Reasons for reject
  vbak.faksk,                // Billing block
  vbak.lifsk,                // Delivery block
  vbap.prctr,                // Profit Center
  vbap.lprio,                // Delivery Priority
  vbap.vstel,                // Shipping Point
  vbap.kwmeng as target_qty, // Cumulative Order Quantity
  vbep.bmeng as qty,         // Confirmed.ord.quant.in sales units
  vbep.wmeng,                // Order qty on schedule level
  vbep.etenr,                // Schedule line
  vbep.edatu,                // Schedule line date
  vbep.ettyp,                // Schedule line category
  vbup.fksta,                // Billing Status
  vbup.gbsta,                // Overall processing status
  vbup.lfsta,                // Overall delivery status
  vbap.ktgrm,                // Acct asgnmt grp
  vbap.zzcommitdate,         // Commit Date 
  vbap.vkaus,                // Line level usage indicator
  vbak.erdat,                // Date on Which Record Was Created
  vbuk.cmgst,                // Credit status
  vbap.lgort,                // Storage Location
  vbkd.zterm,                // Payment Terms
  vbap.kzwi3,                // Freight
  vbap.kzwi5,                // Tax Amount
  vbap.kmein,                // Units of Measure
  vbap.kzwi6,                // Subtotal 6 from pricing procedure for condition
  vbap.mvgr1,                // Material group 1
  vbap.mvgr2,                // Material group 2
  vbap.mvgr3,                // Material group 3
  vbap.mvgr4,                // Material group 4
  vbap.mvgr5,                // Material group 5
  vbup.fksaa,                // Billing Status for Order-Related Billing Documents
  vbuk.fkstk,                // Billing status
  vbuk.gbstk,                // Overall processing status of document
  vbuk.fksak                 // Billing Status (Order-Related Billing Document)
}
where ( vbak.vbtyp = 'C'     // Orders
   or vbak.vbtyp = 'H'       // Returns
   or vbak.vbtyp = 'I'       // Orders without Charge
   or vbak.vbtyp = 'K'       // Credit Memo Request
   or vbak.vbtyp = 'L'       // Debit Memo Request
   or vbak.vbtyp = 'G'       // Contracts
)