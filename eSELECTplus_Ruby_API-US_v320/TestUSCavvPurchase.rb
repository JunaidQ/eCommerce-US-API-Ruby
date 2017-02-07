#!c:\ruby\bin\rubyw.exe
require './usmpgapi4r.rb' #path to usmpgapi4r.rb 
p = ReqMod::USCavvPurchase.new

p.order_id = "us_rudy_cavv_purch_test_6"
p.cust_id = "john smith"
p.amount = "1.00"
p.pan = "5454545454545454"
p.expdate = "0909"
p.cavv = "jHyn+7YFi1EUAREAAAAvNUe6Hv8="
#p.dynamic_descriptor = "123456"

r = ReqMod::Request.new

r.store_id = 'monusqa002'
r.api_token = 'qatoken'
#r.status_check = 'true'

r.us_cavv_purchase = p

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
print "\nCavvResultCode = " + response.receipt.cavvresultcode.to_s
#print "\nStatusCode = " + response.receipt.statuscode.to_s
#print "\nStatusMessage = " + response.receipt.statusmessage.to_s
