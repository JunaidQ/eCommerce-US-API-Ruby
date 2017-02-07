#!c:\ruby\bin\rubyw.exe
require './usmpgapi4r.rb' #path to usmpgapi4r.rb 
p = ReqMod::USACHDebit.new
c = ReqMod::CustInfo.new
b = ReqMod::Billing.new
s = ReqMod::Shipping.new
i = ReqMod::Item.new

p.cust_info=c
p.cust_info.billing=b
p.cust_info.shipping=s
p.cust_info.item=i

p.order_id = "usrudyachtest214"
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


#Customer Information Variables
#E-mail
p.cust_info.email="Joe@widgets.com"

#Instructions
p.cust_info.instructions="Make it fast"

#Billing Information
p.cust_info.billing.first_name = "Joe"
p.cust_info.billing.last_name = "Thompson"
p.cust_info.billing.company_name = "Widget Company Inc."
p.cust_info.billing.address = "111 Bolts Ave."
p.cust_info.billing.city = "Toronto"
p.cust_info.billing.province = "Ontario"
p.cust_info.billing.country = "Canada"
p.cust_info.billing.postal_code = "M8T 1T8"
p.cust_info.billing.phone_number = "416-555-5555"
p.cust_info.billing.fax = "416-555-5555"
p.cust_info.billing.tax1 = "123.45"
p.cust_info.billing.tax2 = "123.45"
p.cust_info.billing.tax3 = "15.45"
p.cust_info.billing.shipping_cost = "456.23"

#Shipping Information
p.cust_info.shipping.first_name = "Joe"
p.cust_info.shipping.last_name = "Thompson"
p.cust_info.shipping.company_name = "Widget Company Inc."
p.cust_info.shipping.address = "111 Bolts Ave."
p.cust_info.shipping.city = "Toronto"
p.cust_info.shipping.province = "Ontario"
p.cust_info.shipping.country = "Canada"
p.cust_info.shipping.postal_code = "M8T 1T8"
p.cust_info.shipping.phone_number = "416-555-5555"
p.cust_info.shipping.fax = "416-555-5555"
p.cust_info.shipping.tax1 = "123.45"
p.cust_info.shipping.tax2 = "123.45"
p.cust_info.shipping.tax3 = "15.45"
p.cust_info.shipping.shipping_cost = "456.23"

#Item Information
i1 = ReqMod::Item.new
i1.name = "item1 name"
i1.quantity = "53"
i1.product_code = "item1 product code"
i1.extended_amount = "1.00"

i2 = ReqMod::Item.new
i2.name = "item2 name"
i2.quantity = "24"
i2.product_code = "item2 product code"
i2.extended_amount = "1.00"

p.cust_info.item = Array.new
p.cust_info.item << i1 << i2

p.ach_info = ach

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
