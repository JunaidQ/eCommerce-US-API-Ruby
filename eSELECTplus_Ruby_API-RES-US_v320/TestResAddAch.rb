#!c:\ruby\bin\rubyw.exe
require './usmpgapi4r.rb' #path to usmpgapi4r.rb 
p = ReqMod::USResAddAch.new

p.cust_id = "john smith"
p.phone = "416-555-5555"
p.email = "bob@smith.com"
p.note = "this is my note"

#ACHInfo Variables
ach = ReqMod::ACHInfo.new
ach.sec = "ccd"
ach.cust_first_name = "john"
ach.cust_last_name = "smith"
ach.cust_address1 = "3300"
ach.cust_address2 = "bloor st w"
ach.cust_city = "toronto"
ach.cust_state = "ON"
ach.cust_zip = "90210"
ach.routing_num = "490000018"
ach.account_num = "222222"
ach.check_num = "11"
ach.account_type = "checking"

p.ach_info = ach

r = ReqMod::Request.new

r.store_id = 'monusqa002'
r.api_token = 'qatoken'

r.us_res_add_ach = p

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

