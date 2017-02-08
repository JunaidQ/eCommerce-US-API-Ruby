#!c:\ruby\bin\rubyw.exe
require './usmpgapi4r.rb' #path to usmpgapi4r.rb 
p = ReqMod::USResPreauthCC.new

r = ReqMod::Request.new
c = ReqMod::CvdInfo.new
a = ReqMod::AvsInfo.new

p.cvd_info=c
p.avs_info=a

r.store_id = 'monusqa002'
r.api_token = 'qatoken'

p.data_key = "m212408dAO3y1E4rRJ71H42Zm"
p.order_id = "rubytest25"
p.cust_id = "john smith"
p.amount = "1.00"
p.crypt_type = "1"

#Efraud Variables
p.cvd_info.cvd_indicator="1"
p.cvd_info.cvd_value="099"

p.avs_info.avs_street_number="123"
p.avs_info.avs_street_name="East Street"
p.avs_info.avs_zipcode="M1M2M2"

r.us_res_preauth_cc = p

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
print "\nAVSResponse = " + response.receipt.avsresultcode.to_s
print "\nCVDResponse = " + response.receipt.cvdresultcode.to_s

#ResolveData
print "\n\nCust ID = " + response.receipt.resolvedata[0].cust_id.to_s
print "\nPhone = " + response.receipt.resolvedata[0].phone.to_s
print "\nEmail = " + response.receipt.resolvedata[0].email.to_s
print "\nNote = " + response.receipt.resolvedata[0].note.to_s
print "\nMasked Pan = " + response.receipt.resolvedata[0].masked_pan.to_s
print "\nExpdate = " + response.receipt.resolvedata[0].expdate.to_s
print "\nCrypt Type = " + response.receipt.resolvedata[0].crypt_type.to_s
print "\nAvs Street Number = " + response.receipt.resolvedata[0].avs_street_number.to_s
print "\nAvs Street Name = " + response.receipt.resolvedata[0].avs_street_name.to_s
print "\nAvs Zipcode = " + response.receipt.resolvedata[0].avs_zipcode.to_s