#!c:\ruby\bin\rubyw.exe

require './usmpgapi4r.rb'

p = ReqMod::USBatchClose.new

p.ecr_number = "64000001"

r = ReqMod::Request.new

r.store_id = 'monusqa002'
r.api_token = 'qatoken'

r.us_batchclose = p

response = HttpsPoster.post(r)

#loop through all card types
response.receipt.banktotals.ecr.card.each do |x|
	if x.cardtype != nil
		print "\n\nCard type = " + x.cardtype.to_s
		print "\nPurchase Count = " + x.purchase.count.to_s
		print "\nPurchase Amount = " + x.purchase.amount.to_s
		print "\nRefund Count = " + x.refund.count.to_s
		print "\nRefund Amount = " + x.refund.amount.to_s
		print "\nCorrection Count = " + x.correction.count.to_s
		print "\nCorrection Amount = " + x.correction.amount.to_s
	end
end