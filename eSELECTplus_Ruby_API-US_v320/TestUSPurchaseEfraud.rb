#!/usr/local/bin/ruby

require './usmpgapi4r.rb'

p = ReqMod::USPurchase.new
c = ReqMod::CvdInfo.new
a = ReqMod::AvsInfo.new

p.cvd_info=c
p.avs_info=a

p.order_id = "patrick_avs_test100"
p.cust_id = "customer name"
p.amount = "10.36"
p.crypt_type = "7"

p.pan = "4242424242424242"
p.expdate = "1111"

#Efraud Variables
p.cvd_info.cvd_indicator=""
p.cvd_info.cvd_value=""

p.avs_info.avs_street_number="123"
p.avs_info.avs_street_name="East Street"
p.avs_info.avs_zipcode="M1M2M2"

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

if response.receipt.avsresultcode != nil
	print "\nAvsResponse = " + response.receipt.avsresultcode.to_s
end

if response.receipt.cvdresultcode != nil
	print "\nCvdResponse = " + response.receipt.cvdresultcode.to_s
end