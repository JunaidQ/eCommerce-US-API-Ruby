#!/usr/local/bin/ruby

require './usmpgapi4r.rb'

p = ReqMod::USRefund.new

p.order_id = "mvt6196643335"
p.txn_number = "1026-0_1"
p.amount = "1.00"
p.crypt_type = "7"

r = ReqMod::Request.new

r.store_id = 'monusqa002'
r.api_token = 'qatoken'
#r.status_check = 'true'

r.us_refund = p

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
#print "\nStatusCode = " + response.receipt.statuscode.to_s
#print "\nStatusMessage = " + response.receipt.statusmessage.to_s