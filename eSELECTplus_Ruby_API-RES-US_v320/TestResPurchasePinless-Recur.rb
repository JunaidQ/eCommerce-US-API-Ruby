#!c:\ruby\bin\rubyw.exe
require './usmpgapi4r.rb' #path to usmpgapi4r.rb 
p = ReqMod::USResPurchasePinless.new
rec = ReqMod::Recur.new
p.recur=rec

r = ReqMod::Request.new

r.store_id = 'monusqa002'
r.api_token = 'qatoken'

p.data_key = "u09gm3C001bC749F639PLOkL2"
p.order_id = "rubypurchasepinlesstest3"
p.cust_id = "john smith"
p.amount = "1.00"
p.intended_use = "1"
p.p_account_number = "12345678"

#recur variables
p.recur.recur_unit = "day"
p.recur.start_date = "2009/11/30"
p.recur.num_recurs = "4"
p.recur.period = "10"
p.recur.recur_amount = "31.00"
p.recur.start_now = "true"

r.us_res_purchase_pinless = p

response = HttpsPoster.post(r)
print "\nDataKey = " + response.receipt.datakey.to_s
print "\nReceiptId = " + response.receipt.receiptid.to_s
print "\nReferenceNum = " + response.receipt.referencenum.to_s
print "\nResponse Code = " + response.receipt.responsecode.to_s
print "\nAuthCode = " + response.receipt.authcode.to_s
print "\nMessage = " + response.receipt.message.to_s
print "\nTransaction Date = " + response.receipt.transdate.to_s
print "\nTransaction Time = " + response.receipt.transtime.to_s
print "\nTransaction Type = " + response.receipt.transtype.to_s
print "\nComplete = " + response.receipt.complete.to_s
print "\nTransaction Amount = " + response.receipt.transamount.to_s
print "\nCard Type = " + response.receipt.cardtype.to_s
print "\nTxn Number = " + response.receipt.transid.to_s
print "\nTimedOut = " + response.receipt.timedout.to_s
print "\nResSuccess = " + response.receipt.ressuccess.to_s
print "\nPaymentType = " + response.receipt.paymenttype.to_s

#ResolveData
print "\n\nCust ID = " + response.receipt.resolvedata[0].cust_id.to_s
print "\nPhone = " + response.receipt.resolvedata[0].phone.to_s
print "\nEmail = " + response.receipt.resolvedata[0].email.to_s
print "\nNote = " + response.receipt.resolvedata[0].note.to_s
print "\nMasked Pan = " + response.receipt.resolvedata[0].masked_pan.to_s
print "\nExpdate = " + response.receipt.resolvedata[0].expdate.to_s
print "\nPresentation Type = " + response.receipt.resolvedata[0].presentation_type.to_s
print "\nP Account Number = " + response.receipt.resolvedata[0].p_account_number.to_s
print "\nAvs Street Name = " + response.receipt.resolvedata[0].avs_street_name.to_s
print "\nAvs Zipcode = " + response.receipt.resolvedata[0].avs_zipcode.to_s