#!c:\ruby\bin\rubyw.exe
require './usmpgapi4r.rb' #path to usmpgapi4r.rb 
p = ReqMod::USTrack2PreAuth.new

p.order_id = "usrubyapitrack2test632432432"
p.cust_id = "john smith"
p.amount = "1.00"
p.pan = ""
p.expdate = "1111"
p.pos_code = "12"
#p.dynamic_descriptor = "123456"

#This is the track2 portion on a swiped card
p.track2 = ";5454545454545454=06061015454001060101?"

r = ReqMod::Request.new

r.store_id = 'monusqa002'
r.api_token = 'qatoken'
#r.status_check = 'true'

r.us_track2_preauth = p

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

if response.receipt.cardlevelresult != nil
  print "\nCardLevelResult = " + response.receipt.cardlevelresult.to_s
end