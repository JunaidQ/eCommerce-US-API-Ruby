#!/usr/local/bin/ruby

require './usmpgapi4r.rb'

p = ReqMod::USPinlessDebitPurchase.new
rec = ReqMod::Recur.new
p.recur=rec

p.order_id = "usrudyshemtest123"
p.cust_id = "john smith"
p.amount = "1.00"
p.pan = "4496270000164824"
p.expdate = "1111"
p.presentation_type = "X"
p.intended_use = "0"
p.p_account_number = "1231231231231231231231231"

#recur variables
p.recur.recur_unit = "day"
p.recur.start_date = "2006/11/30"
p.recur.num_recurs = "4"
p.recur.period = "10"
p.recur.recur_amount = "31.00"
p.recur.start_now = "true"

r = ReqMod::Request.new

r.store_id = 'monusqa002'
r.api_token = 'qatoken'

r.us_purchase = p

response = HttpsPoster.post(r)
print "\nCard Type = " + response.receipt.cardtype.to_s
print "\nTransaction Amount = " + response.receipt.transamount.to_s
print "\nTxnNumber = " + response.receipt.transid.to_s
print "\nReceiptID = " + response.receipt.receiptid.to_s
print "\nTransaction Type = " + response.receipt.transtype.to_s
print "\nReference Number = " + response.receipt.referencenum.to_s
print "\nResponse Code = " + response.receipt.responsecode.to_s
print "\nMessage = " + response.receipt.message.to_s
print "\nAuthcode = " + response.receipt.authcode.to_s
print "\nComplete = " + response.receipt.complete.to_s
print "\nTransaction Date = " + response.receipt.transdate.to_s
print "\nTransaction Time = " + response.receipt.transtime.to_s
print "\nTimedOut = " + response.receipt.timedout.to_s
if response.receipt.recursuccess != nil
  print "\nRecurSuccess = " + response.receipt.recursuccess.to_s
end