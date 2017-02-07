#!c:\ruby\bin\rubyw.exe
require './usmpgapi4r.rb' #path to usmpgapi4r.rb 
p = ReqMod::USACHDebit.new
rec = ReqMod::Recur.new
p.recur=rec

p.order_id = "usrudyachtest773423"
p.cust_id = "john smith"
p.amount = "1.00"

#ACHInfo Variables
ach = ReqMod::ACHInfo.new
ach.sec = "pop"
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
ach.micr = "t071000013t742941347o323"
ach.magstripe = "no"
ach.dl_num = "CO-12312312"
ach.image_front = ""
ach.image_back = ""


p.ach_info = ach

#recur variables
p.recur.recur_unit = "day"
p.recur.start_date = "2008/11/30"
p.recur.num_recurs = "4"
p.recur.period = "10"
p.recur.recur_amount = "31.00"
p.recur.start_now = "true"


r = ReqMod::Request.new

r.store_id = 'monusqa002'
r.api_token = 'qatoken'

r.us_ach_debit = p

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
