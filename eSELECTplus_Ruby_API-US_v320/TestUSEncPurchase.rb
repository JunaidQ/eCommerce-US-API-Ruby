#!c:\ruby\bin\rubyw.exe
require './usmpgapi4r.rb' #path to usmpgapi4r.rb 
p = ReqMod::USEncPurchase.new

p.order_id = "usrudyshemtest1june10"
p.cust_id = "john smith"
p.amount = "1.00"
p.crypt_type = "7"
p.commcard_invoice = "123"
p.commcard_tax_amount = "1.00"
#p.dynamic_descriptor = "123456"

p.enc_track2 = ""
p.device_type = "idtech"

r = ReqMod::Request.new

r.store_id = 'monusqa002'
r.api_token = 'qatoken'

r.us_enc_purchase = p

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
print "\nMaskedPan = " + response.receipt.maskedpan.to_s

if response.receipt.cardlevelresult != nil
  print "\nCardLevelResult = " + response.receipt.cardlevelresult.to_s
end