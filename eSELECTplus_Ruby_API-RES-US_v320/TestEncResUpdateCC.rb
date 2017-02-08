#!c:\ruby\bin\rubyw.exe
require './usmpgapi4r.rb' #path to usmpgapi4r.rb 
p = ReqMod::USEncResUpdateCC.new

p.data_key = "X4S24VF13XF99U4302eBKw3I0"
p.cust_id = "john smith"
p.phone = "416-555-5555"
p.email = "bob@smith.com"
p.note = "this is my note"
p.enc_track2 = ""
p.device_type = "idtech"
p.crypt_type = "7"

#AvsInfo Variables
avs = ReqMod::AvsInfo.new
avs.avs_street_number = "1"
avs.avs_street_name = "bloor st"
avs.avs_zipcode = "90210"

p.avs_info = avs

r = ReqMod::Request.new

r.store_id = 'monusqa002'
r.api_token = 'qatoken'

r.us_enc_res_update_cc = p

response = HttpsPoster.post(r)
print "\nDataKey = " + response.receipt.datakey.to_s
print "\nResponse Code = " + response.receipt.responsecode.to_s
print "\nMessage = " + response.receipt.message.to_s
print "\nTransaction Date = " + response.receipt.transdate.to_s
print "\nTransaction Time = " + response.receipt.transtime.to_s
print "\nComplete = " + response.receipt.complete.to_s
print "\nTimedOut = " + response.receipt.timedout.to_s
print "\nResSuccess = " + response.receipt.ressuccess.to_s
print "\nPaymentType = " + response.receipt.paymenttype.to_s

#ResolveData
print "\n\nCust ID = " + response.receipt.resolvedata[0].cust_id.to_s
print "\nPhone = " + response.receipt.resolvedata[0].phone.to_s
print "\nEmail = " + response.receipt.resolvedata[0].email.to_s
print "\nNote = " + response.receipt.resolvedata[0].note.to_s
print "\nMasked Pan = " + response.receipt.resolvedata[0].masked_pan.to_s
print "\nExpDate = " + response.receipt.resolvedata[0].expdate.to_s
print "\nCrypt Type = " + response.receipt.resolvedata[0].crypt_type.to_s
print "\nAvs Street Number = " + response.receipt.resolvedata[0].avs_street_number.to_s
print "\nAvs Street Name = " + response.receipt.resolvedata[0].avs_street_name.to_s
print "\nAvs Zipcode = " + response.receipt.resolvedata[0].avs_zipcode.to_s
print "\nPresentation Type = " + response.receipt.resolvedata[0].presentation_type.to_s
print "\nP Account Number = " + response.receipt.resolvedata[0].p_account_number.to_s
print "\nSec = " + response.receipt.resolvedata[0].sec.to_s
print "\nCust First Name = " + response.receipt.resolvedata[0].cust_first_name.to_s
print "\nCust Last Name = " + response.receipt.resolvedata[0].cust_last_name.to_s
print "\nCust Address 1 = " + response.receipt.resolvedata[0].cust_address1.to_s
print "\nCust Address 2 = " + response.receipt.resolvedata[0].cust_address2.to_s
print "\nCust City = " + response.receipt.resolvedata[0].cust_city.to_s
print "\nCust State = " + response.receipt.resolvedata[0].cust_state.to_s
print "\nCust Zip = " + response.receipt.resolvedata[0].cust_zip.to_s
print "\nRouting Num = " + response.receipt.resolvedata[0].routing_num.to_s
print "\nMasked Account Num = " + response.receipt.resolvedata[0].masked_account_num.to_s
print "\nCheck Num = " + response.receipt.resolvedata[0].check_num.to_s
print "\nAccount Type = " + response.receipt.resolvedata[0].account_type.to_s