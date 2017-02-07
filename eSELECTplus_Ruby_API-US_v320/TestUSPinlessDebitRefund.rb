#!/usr/local/bin/ruby

require './usmpgapi4r.rb'

p = ReqMod::USPinlessDebitRefund.new

p.order_id = "usrudyshempinlesstest2"
p.txn_number = "3251-0_6"
p.amount = "1.00"

r = ReqMod::Request.new

r.store_id = 'monusqa002'
r.api_token = 'qatoken'

r.us_pinless_debit_refund = p

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