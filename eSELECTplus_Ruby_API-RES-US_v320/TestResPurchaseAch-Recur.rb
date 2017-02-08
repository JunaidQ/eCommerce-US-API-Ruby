#!c:\ruby\bin\rubyw.exe
require './usmpgapi4r.rb' #path to usmpgapi4r.rb 
p = ReqMod::USResPurchaseAch.new

r = ReqMod::Request.new
rec = ReqMod::Recur.new
p.recur=rec

r.store_id = 'monusqa002'
r.api_token = 'qatoken'

p.data_key = "43013q1422hxGOsRL2193GFLc"
p.order_id = "rubypurchaseachtest4"
p.cust_id = "john smith"
p.amount = "1.00"

#recur variables
p.recur.recur_unit = "day"
p.recur.start_date = "2009/11/30"
p.recur.num_recurs = "4"
p.recur.period = "10"
p.recur.recur_amount = "31.00"
p.recur.start_now = "true"

r.us_res_purchase_ach = p

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
print "\nSec = " + response.receipt.resolvedata[0].sec.to_s
print "\nCust First Name = " + response.receipt.resolvedata[0].cust_first_name.to_s
print "\nCust Last Name = " + response.receipt.resolvedata[0].cust_last_name.to_s
print "\nCust Address 1 = " + response.receipt.resolvedata[0].cust_address1.to_s
print "\nCust Address 2 = " + response.receipt.resolvedata[0].cust_address2.to_s
print "\nCust City = " + response.receipt.resolvedata[0].cust_city.to_s
print "\nCust State = " + response.receipt.resolvedata[0].cust_state.to_s
print "\nCust Zip = " + response.receipt.resolvedata[0].cust_zip.to_s
print "\nRouting Num = " + response.receipt.resolvedata[0].routing_num.to_s
print "\nMasked Account Num = " + response.receipt.resolvedata[0].masked_account_num.to_s
print "\nCheck Num = " + response.receipt.resolvedata[0].check_num.to_s
print "\nAccount Type = " + response.receipt.resolvedata[0].account_type.to_s