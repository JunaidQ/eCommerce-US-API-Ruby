#!c:\ruby\bin\rubyw.exe
require './usmpgapi4r.rb' #path to mpgapi4r.rb 
require './xml.rb'

p = ReqMod::USRecurUpdate.new

p.order_id = "mrt0579246239"

#The following fields can be updated for a CC,ACH or Pinless Debit transaction
p.cust_id = "bob"
p.recur_amount = "21.00"
p.add_num_recurs = "2"
p.total_num_recurs = "999"
p.hold = "false"
p.terminate = "false"

#The pan & expdate can be updated for a Credit Card or Pinless Debit transaction
p.pan = "5454545454545454"
p.expdate = "1111"

#The AVS details can only be updated for a Credit Card transaction
p.avs_street_number = "112"
p.avs_street_name = "bloor st"
p.avs_zipcode = "123123"

#The p_account_number & presentation_type can only be updated for a Pinless Debit transaction
p.p_account_number = "213123213"
p.presentation_type = "X"

r = ReqMod::Request.new

r.store_id = 'monus00001'
r.api_token = 'montoken'

r.us_recur_update = p

response = HttpsPoster.post(r)
print "\nReceiptID = " + response.receipt.receiptid.to_s
print "\nResponse Code = " + response.receipt.responsecode.to_s
print "\nMessage = " + response.receipt.message.to_s
print "\nComplete = " + response.receipt.complete.to_s
print "\nTransaction Date = " + response.receipt.transdate.to_s
print "\nTransaction Time = " + response.receipt.transtime.to_s
print "\nTimedOut = " + response.receipt.timedout.to_s
print "\nRecurUpdateSuccess = " + response.receipt.recurupdatesuccess.to_s
print "\nNextRecurDate = " + response.receipt.nextrecurdate.to_s
print "\nRecurEndDate = " + response.receipt.recurenddate.to_s

