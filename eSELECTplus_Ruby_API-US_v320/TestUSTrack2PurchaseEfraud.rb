#!/usr/local/bin/ruby

require './usmpgapi4r.rb'

p = ReqMod::USTrack2Purchase.new
a = ReqMod::AvsInfo.new

p.order_id = "usrubyapitrack2test15234324"
p.cust_id = "john smith"
p.amount = "10.42"
p.pan = ""
p.expdate = ""
p.pos_code = "12"
p.commcard_invoice = "123"
p.commcard_tax_amount = "0.15"
#This is the track2 portion on a swiped card
p.track2 = ";5258968987035454=06061015454001060101?"

#Efraud Variables
p.avs_info=a
p.avs_info.avs_street_number="123"
p.avs_info.avs_street_name="East Street"
p.avs_info.avs_zipcode="M1M2M2"

r = ReqMod::Request.new

r.store_id = 'monusqa002'
r.api_token = 'qatoken'

r.us_track2_purchase = p

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

if response.receipt.avsresultcode != nil
	print "\nAvsResponse = " + response.receipt.avsresultcode.to_s
end