#!/usr/local/bin/ruby

require './usmpgapi4r.rb'

p = ReqMod::USReauth.new

p.order_id = "rubyreauth1"
#p.cust_id = "customer1"
p.orig_order_id = "apr18test9"
p.txn_number = "59067-0_10"
p.amount = "1.00"
p.crypt_type = "7"

r = ReqMod::Request.new

r.store_id = 'monusqa002'
r.api_token = 'qatoken'

r.us_reauth = p

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

if response.receipt.cardlevelresult != nil
  print "\nCardLevelResult = " + response.receipt.cardlevelresult.to_s
end