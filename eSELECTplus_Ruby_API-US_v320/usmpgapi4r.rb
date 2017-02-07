#v3.2.0
#!c:\ruby\bin\rubyw.exe

require 'net/https'
require 'uri'
require './xml.rb' #path to xml.rb
require 'rexml/document'

class HttpsPoster

  @@uri = URI.parse("https://esplusqa.moneris.com") 

  def HttpsPoster.post(mpg_request)
    http = Net::HTTP.new(@@uri.host,@@uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    #puts "Sending:\n#{mpg_request.to_xml}"

    response = RespMod::Response.new
    
    http.start {
      http.request_post("/gateway_us/servlet/MpgRequest",mpg_request.to_xml) {|res|
        response.from_xml(res.body)
      }
    }
    
    return response
  end
end

############ Request Classes ###################
module ReqMod
class Request < Xml
  @@keys = ["store_id","api_token","status_check","us_purchase","us_refund","us_ind_refund","us_preauth","us_completion","us_purchasecorrection","us_cavv_preauth","us_cavv_purchase","us_track2_purchase","us_track2_refund","us_track2_ind_refund","us_track2_preauth","us_track2_completion","us_track2_purchasecorrection","us_batchclose","us_batchcloseall","us_opentotals","us_track2_forcepost","us_forcepost","us_recur_update","us_pinless_debit_purchase","us_pinless_debit_refund","us_ach_debit","us_ach_credit","us_ach_fi_enquiry","us_ach_reversal",
  "us_res_add_cc","us_res_add_ach","us_res_add_pinless","us_res_update_cc","us_res_update_ach","us_res_update_pinless","us_res_delete","us_res_lookup_full","us_res_lookup_masked","us_res_get_expiring","us_res_purchase_cc","us_res_purchase_ach","us_res_purchase_pinless","us_res_preauth_cc","us_res_ind_refund_cc","us_res_ind_refund_ach",
  "us_contactless_purchase","us_contactless_purchasecorrection","us_contactless_refund","us_card_verification","us_reauth","us_res_tokenize_cc","us_enc_track2_preauth","us_enc_track2_purchase","us_enc_track2_ind_refund","us_enc_track2_forcepost","us_enc_purchase","us_enc_ind_refund","us_enc_preauth","us_enc_forcepost","us_enc_card_verification","us_enc_res_add_cc","us_enc_res_update_cc"]
  make_attrs(Request,@@keys)

  def to_xml(indent="")
    to_xml_low("request",@@keys,indent)
  end
end

class USPurchase < Xml
  @@keys = ["order_id","cust_id","amount","pan","expdate","crypt_type","commcard_invoice","commcard_tax_amount","cust_info","avs_info","cvd_info","recur","dynamic_descriptor"]
  make_attrs(USPurchase,@@keys)

  def to_xml(indent="")
    to_xml_low("us_purchase",@@keys,indent)
  end
end

class USEncPurchase < Xml
  @@keys = ["order_id","cust_id","amount","enc_track2","device_type","crypt_type","commcard_invoice","commcard_tax_amount","cust_info","avs_info","cvd_info","recur","dynamic_descriptor"]
  make_attrs(USEncPurchase,@@keys)

  def to_xml(indent="")
    to_xml_low("us_enc_purchase",@@keys,indent)
  end
end

class USCardVerification < Xml
  @@keys = ["order_id","cust_id","pan","expdate","cvd_info","avs_info"]
  make_attrs(USCardVerification,@@keys)

  def to_xml(indent="")
    to_xml_low("us_card_verification",@@keys,indent)
  end
end

class USEncCardVerification < Xml
  @@keys = ["order_id","cust_id","enc_track2","device_type","cvd_info","avs_info"]
  make_attrs(USEncCardVerification,@@keys)

  def to_xml(indent="")
    to_xml_low("us_enc_card_verification",@@keys,indent)
  end
end

class USContactlessPurchase < Xml
  @@keys = ["order_id","cust_id","amount","track2","pan","expdate","commcard_invoice","commcard_tax_amount","cust_info","avs_info","cvd_info","pos_code"]
  make_attrs(USContactlessPurchase,@@keys)

  def to_xml(indent="")
    to_xml_low("us_contactless_purchase",@@keys,indent)
  end
end

class USRefund < Xml
  @@keys = ["order_id","amount","txn_number","crypt_type"]
  make_attrs(USRefund,@@keys)
  
  def to_xml(indent="")
    to_xml_low("us_refund",@@keys,indent)
  end
end

class USReauth < Xml
  @@keys = ["order_id","cust_id","orig_order_id","txn_number","amount","crypt_type","cust_info","avs_info","cvd_info"]
  make_attrs(USReauth,@@keys)
  
  def to_xml(indent="")
    to_xml_low("us_reauth",@@keys,indent)
  end
end

class USContactlessRefund < Xml
  @@keys = ["order_id","amount","track2", "pos_code", "txn_number"]
  make_attrs(USContactlessRefund,@@keys)
  
  def to_xml(indent="")
    to_xml_low("us_contactless_refund",@@keys,indent)
  end
end

class USIndependentRefund < Xml
  @@keys = ["order_id","cust_id","amount","pan","expdate","crypt_type","dynamic_descriptor"]
  make_attrs(USIndependentRefund,@@keys)
  
  def to_xml(indent="")
    to_xml_low("us_ind_refund",@@keys,indent)
  end
end

class USEncIndependentRefund < Xml
  @@keys = ["order_id","cust_id","amount","enc_track2","device_type","crypt_type","dynamic_descriptor"]
  make_attrs(USEncIndependentRefund,@@keys)
  
  def to_xml(indent="")
    to_xml_low("us_enc_ind_refund",@@keys,indent)
  end
end

class USPreAuth < Xml
  @@keys = ["order_id","cust_id","amount","pan","expdate","crypt_type","cust_info","avs_info","cvd_info","dynamic_descriptor"]
  make_attrs(USPreAuth,@@keys)

  def to_xml(indent="")
    to_xml_low("us_preauth",@@keys,indent)
  end
end

class USEncPreAuth < Xml
  @@keys = ["order_id","cust_id","amount","enc_track2","device_type","crypt_type","cust_info","avs_info","cvd_info","dynamic_descriptor"]
  make_attrs(USEncPreAuth,@@keys)

  def to_xml(indent="")
    to_xml_low("us_enc_preauth",@@keys,indent)
  end
end
class USCompletion < Xml
  @@keys = ["order_id","comp_amount","txn_number","crypt_type","commcard_invoice","commcard_tax_amount"]
  make_attrs(USCompletion,@@keys)

  def to_xml(indent="")
    to_xml_low("us_completion",@@keys,indent)
  end
end

class USPurchaseCorrection < Xml
  @@keys = ["order_id","txn_number","crypt_type"]
  make_attrs(USPurchaseCorrection,@@keys)

  def to_xml(indent="")
    to_xml_low("us_purchasecorrection",@@keys,indent)
  end
end

class USContactlessPurchaseCorrection < Xml
  @@keys = ["order_id","txn_number"]
  make_attrs(USContactlessPurchaseCorrection,@@keys)

  def to_xml(indent="")
    to_xml_low("us_contactless_purchasecorrection",@@keys,indent)
  end
end

class USCavvPurchase < Xml
  @@keys = ["order_id","cust_id","amount","pan","expdate","cavv","commcard_invoice","commcard_tax_amount","cust_info","avs_info","cvd_info","recur","dynamic_descriptor"]
  make_attrs(USCavvPurchase,@@keys)

  def to_xml(indent="")
    to_xml_low("us_cavv_purchase",@@keys,indent)
  end
end

class USCavvPreAuth < Xml
  @@keys = ["order_id","cust_id","amount","pan","expdate","cavv","cust_info","avs_info","cvd_info","dynamic_descriptor"]
  make_attrs(USCavvPreAuth,@@keys)

  def to_xml(indent="")
    to_xml_low("us_cavv_preauth",@@keys,indent)
  end
end

class USForcepost < Xml
  @@keys = ["order_id","cust_id","amount","pan","expdate","crypt_type","pos_code","auth_code","cust_info","dynamic_descriptor"]
  make_attrs(USForcepost,@@keys)

  def to_xml(indent="")
    to_xml_low("us_forcepost",@@keys,indent)
  end
end

class USEncForcepost < Xml
  @@keys = ["order_id","cust_id","amount","enc_track2","device_type","crypt_type","pos_code","auth_code","cust_info","dynamic_descriptor"]
  make_attrs(USEncForcepost,@@keys)

  def to_xml(indent="")
    to_xml_low("us_enc_forcepost",@@keys,indent)
  end
end

class USTrack2Purchase < Xml
  @@keys = ["order_id","cust_id","amount","track2","pan","expdate","pos_code","commcard_invoice","commcard_tax_amount","cust_info","avs_info","dynamic_descriptor"]
  make_attrs(USTrack2Purchase,@@keys)

  def to_xml(indent="")
    to_xml_low("us_track2_purchase",@@keys,indent)
  end
end

class USTrack2PreAuth < Xml
  @@keys = ["order_id","cust_id","amount","track2","pan","expdate","pos_code","cust_info","avs_info","dynamic_descriptor"]
  make_attrs(USTrack2PreAuth,@@keys)

  def to_xml(indent="")
    to_xml_low("us_track2_preauth",@@keys,indent)
  end
end

class USTrack2Completion < Xml
  @@keys = ["order_id","comp_amount","txn_number","pos_code","commcard_invoice","commcard_tax_amount"]
  make_attrs(USTrack2Completion,@@keys)

  def to_xml(indent="")
    to_xml_low("us_track2_completion",@@keys,indent)
  end
end

class USTrack2Forcepost < Xml
  @@keys = ["order_id","cust_id","amount","track2","pan","expdate","pos_code","auth_code","cust_info","dynamic_descriptor"]
  make_attrs(USTrack2Forcepost,@@keys)

  def to_xml(indent="")
    to_xml_low("us_track2_forcepost",@@keys,indent)
  end
end

class USTrack2PurchaseCorrection < Xml
  @@keys = ["order_id","txn_number"]
  make_attrs(USTrack2PurchaseCorrection,@@keys)

  def to_xml(indent="")
    to_xml_low("us_track2_purchasecorrection",@@keys,indent)
  end
end

class USTrack2Refund < Xml
  @@keys = ["order_id","amount","txn_number"]
  make_attrs(USTrack2Refund,@@keys)

  def to_xml(indent="")
    to_xml_low("us_track2_refund",@@keys,indent)
  end
end

class USTrack2IndependentRefund < Xml
  @@keys = ["order_id","cust_id","amount","track2","pan","expdate","pos_code","cust_info","dynamic_descriptor"]
  make_attrs(USTrack2IndependentRefund,@@keys)

  def to_xml(indent="")
    to_xml_low("us_track2_ind_refund",@@keys,indent)
  end
end

class USEncTrack2Preauth < Xml
  @@keys = ["order_id","cust_id","amount","enc_track2","pos_code","device_type"]
  make_attrs(USEncTrack2Preauth,@@keys)

  def to_xml(indent="")
    to_xml_low("us_enc_track2_preauth",@@keys,indent)
  end
end

class USEncTrack2Purchase < Xml
  @@keys = ["order_id","cust_id","amount","enc_track2","pos_code","device_type"]
  make_attrs(USEncTrack2Purchase,@@keys)

  def to_xml(indent="")
    to_xml_low("us_enc_track2_purchase",@@keys,indent)
  end
end

class USEncTrack2IndependentRefund < Xml
  @@keys = ["order_id","cust_id","amount","enc_track2","pos_code","device_type"]
  make_attrs(USEncTrack2IndependentRefund,@@keys)

  def to_xml(indent="")
    to_xml_low("us_enc_track2_ind_refund",@@keys,indent)
  end
end

class USEncTrack2Forcepost < Xml
  @@keys = ["order_id","cust_id","amount","enc_track2","pos_code","device_type","auth_code"]
  make_attrs(USEncTrack2Forcepost,@@keys)

  def to_xml(indent="")
    to_xml_low("us_enc_track2_forcepost",@@keys,indent)
  end
end

class USBatchClose < Xml
  @@keys = ["ecr_number"]
  make_attrs(USBatchClose,@@keys)

  def to_xml(indent="")
    to_xml_low("us_batchclose",@@keys,indent)
  end
end

class USOpenTotals < Xml
  @@keys = ["ecr_number"]
  make_attrs(USOpenTotals,@@keys)

  def to_xml(indent="")
    to_xml_low("us_opentotals",@@keys,indent)
  end
end

class CustInfo < Xml
  @@keys = ["billing","shipping","email","instructions","item"]
  make_attrs(CustInfo,@@keys)

  def to_xml(indent="")
    to_xml_low("cust_info",@@keys,indent)
  end
end

class Billing < Xml
  @@keys = ["first_name","last_name","company_name","address","city","province","postal_code","country","phone_number","fax","tax1","tax2","tax3","shipping_cost"]
  make_attrs(Billing,@@keys)

  def to_xml(indent="")
    to_xml_low("billing",@@keys,indent)
  end
end

class Shipping < Xml
  @@keys = ["first_name","last_name","company_name","address","city","province","postal_code","country","phone_number","fax","tax1","tax2","tax3","shipping_cost"]
  make_attrs(Shipping,@@keys)

  def to_xml(indent="")
    to_xml_low("shipping",@@keys,indent)
  end
end

class AvsInfo < Xml
  @@keys = ["avs_street_number","avs_street_name","avs_zipcode"]
  make_attrs(AvsInfo,@@keys)

  def to_xml(indent="")
    to_xml_low("avs_info",@@keys,indent)
  end
end

class CvdInfo < Xml
  @@keys = ["cvd_indicator","cvd_value"]
  make_attrs(CvdInfo,@@keys)

  def to_xml(indent="")
    to_xml_low("cvd_info",@@keys,indent)
  end
end

class Recur < Xml
  @@keys = ["recur_unit","start_now","start_date","num_recurs","period","recur_amount"]
  make_attrs(Recur,@@keys)

  def to_xml(indent="")
    to_xml_low("recur",@@keys,indent)
  end
end

class Item < Xml
  @@keys = ["name","quantity","product_code","extended_amount"]
  make_attrs(Item,@@keys)

  def to_xml(indent="")
      to_xml_low("item",@@keys,indent)
  end
end

class USACHDebit < Xml
  @@keys = ["order_id","cust_id","amount","cust_info","recur","ach_info"]
  make_attrs(USACHDebit,@@keys)
  
  def to_xml(indent="")
    to_xml_low("us_ach_debit",@@keys,indent)
  end  
end

class USACHCredit < Xml
  @@keys = ["order_id","cust_id","amount","ach_info"]
  make_attrs(USACHCredit,@@keys)
  
  def to_xml(indent="")
    to_xml_low("us_ach_credit",@@keys,indent)
  end  
end

class USACHReversal < Xml
  @@keys = ["order_id","txn_number"]
  make_attrs(USACHReversal,@@keys)
  
  def to_xml(indent="")
    to_xml_low("us_ach_reversal",@@keys,indent)
  end  
end

class USACHFiInquiry < Xml
  @@keys = ["routing_num"]
  make_attrs(USACHFiInquiry,@@keys)
  
  def to_xml(indent="")
    to_xml_low("us_ach_fi_enquiry",@@keys,indent)
  end  
end

class ACHInfo < Xml
  @@keys = ["sec","cust_first_name","cust_last_name","cust_address1","cust_address2","cust_city","cust_state","cust_zip","routing_num","account_num","check_num","account_type","micr","magstripe","dl_num","image_front","image_back"]
  make_attrs(ACHInfo,@@keys)
  
  def to_xml(indent="")
    to_xml_low("ach_info",@@keys,indent)
  end  
end

class USRecurUpdate < Xml
  @@keys = ["order_id","cust_id","recur_amount","pan","expdate","add_num_recurs","total_num_recurs","hold","terminate","p_account_number","presentation_type","avs_street_number","avs_street_name","avs_zipcode"]
  make_attrs(USRecurUpdate,@@keys)

  def to_xml(indent="")
    to_xml_low("us_recur_update",@@keys,indent)
  end
end

class USPinlessDebitPurchase < Xml
  @@keys = ["order_id","cust_id","amount","pan","expdate","presentation_type","intended_use","p_account_number","recur","cust_info"]
  make_attrs(USPinlessDebitPurchase,@@keys)

  def to_xml(indent="")
    to_xml_low("us_pinless_debit_purchase",@@keys,indent)
  end
end

class USPinlessDebitRefund < Xml
  @@keys = ["order_id","txn_number","amount"]
  make_attrs(USPinlessDebitRefund,@@keys)

  def to_xml(indent="")
    to_xml_low("us_pinless_debit_refund",@@keys,indent)
  end
end

class USResAddAch < Xml
  @@keys = ["cust_id","phone","email","note","ach_info"]
  make_attrs(USResAddAch,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_add_ach",@@keys,indent)
  end
end

class USResAddCC < Xml
  @@keys = ["cust_id","phone","email","note","pan","expdate","crypt_type","avs_info"]
  make_attrs(USResAddCC,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_add_cc",@@keys,indent)
  end
end

class USEncResAddCC < Xml
  @@keys = ["cust_id","phone","email","note","enc_track2","device_type","crypt_type","avs_info"]
  make_attrs(USEncResAddCC,@@keys)

  def to_xml(indent="")
    to_xml_low("us_enc_res_add_cc",@@keys,indent)
  end
end

class USResTokenizeCC < Xml
  @@keys = ["order_id","txn_number","cust_id","phone","email","note","avs_info"]
  make_attrs(USResTokenizeCC,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_tokenize_cc",@@keys,indent)
  end
end

class USResAddPinless < Xml
  @@keys = ["cust_id","phone","email","note","pan","expdate","presentation_type","p_account_number"]
  make_attrs(USResAddPinless,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_add_pinless",@@keys,indent)
  end
end

class USResDelete < Xml
  @@keys = ["data_key"]
  make_attrs(USResDelete,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_delete",@@keys,indent)
  end
end

class USResGetExpiring < Xml
  @@keys = []
  make_attrs(USResGetExpiring,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_get_expiring",@@keys,indent)
  end
end

class USResIndRefundAch < Xml
  @@keys = ["data_key","order_id","cust_id","amount"]
  make_attrs(USResIndRefundAch,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_ind_refund_ach",@@keys,indent)
  end
end

class USResIndRefundCC < Xml
  @@keys = ["data_key","order_id","cust_id","amount","crypt_type","dynamic_descriptor"]
  make_attrs(USResIndRefundCC,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_ind_refund_cc",@@keys,indent)
  end
end

class USResLookupFull < Xml
  @@keys = ["data_key"]
  make_attrs(USResLookupFull,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_lookup_full",@@keys,indent)
  end
end

class USResLookupMasked < Xml
  @@keys = ["data_key"]
  make_attrs(USResLookupMasked,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_lookup_masked",@@keys,indent)
  end
end

class USResPreauthCC < Xml
  @@keys = ["data_key","order_id","cust_id","amount","crypt_type","avs_info","cvd_info","cust_info"]
  make_attrs(USResPreauthCC,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_preauth_cc",@@keys,indent)
  end
end

class USResPreauthCC < Xml
  @@keys = ["data_key","order_id","cust_id","amount","crypt_type","avs_info","cvd_info","cust_info","dynamic_descriptor"]
  make_attrs(USResPreauthCC,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_preauth_cc",@@keys,indent)
  end
end

class USResPurchaseAch < Xml
  @@keys = ["data_key","order_id","cust_id","amount","recur","cust_info"]
  make_attrs(USResPurchaseAch,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_purchase_ach",@@keys,indent)
  end
end

class USResPurchaseCC < Xml
  @@keys = ["data_key","order_id","cust_id","amount","crypt_type","avs_info","cvd_info","recur","cust_info","commcard_invoice","commcard_tax_amount","dynamic_descriptor"]
  make_attrs(USResPurchaseCC,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_purchase_cc",@@keys,indent)
  end
end

class USResPurchasePinless < Xml
  @@keys = ["data_key","order_id","cust_id","amount","intended_use","p_account_number","cust_info","recur"]
  make_attrs(USResPurchasePinless,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_purchase_pinless",@@keys,indent)
  end
end

class USResUpdateAch < Xml
  @@keys = ["data_key","cust_id","phone","email","note","ach_info"]
  make_attrs(USResUpdateAch,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_update_ach",@@keys,indent)
  end
end

class USResUpdateCC < Xml
  @@keys = ["data_key","cust_id","phone","email","note","pan","expdate","crypt_type","avs_info"]
  make_attrs(USResUpdateCC,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_update_cc",@@keys,indent)
  end
end

class USEncResUpdateCC < Xml
  @@keys = ["data_key","cust_id","phone","email","note","enc_track2","device_type","crypt_type","avs_info"]
  make_attrs(USEncResUpdateCC,@@keys)

  def to_xml(indent="")
    to_xml_low("us_enc_res_update_cc",@@keys,indent)
  end
end

class USResUpdatePinless < Xml
  @@keys = ["data_key","cust_id","phone","email","note","pan","expdate","presentation_type","p_account_number"]
  make_attrs(USResUpdatePinless,@@keys)

  def to_xml(indent="")
    to_xml_low("us_res_update_pinless",@@keys,indent)
  end
end



end

############## Response Classes ###################
module RespMod
class Response < Xml
        @@keys = ["receipt"]
        make_attrs(Response,@@keys)

        def to_xml(indent="")
                to_xml_low("response",@@keys,indent)
        end
        
        def from_xml(xml)
          doc = REXML::Document.new(xml)
          
          #doc.write($stdout, 1)
          
          receipt = RespMod::Receipt.new
          if doc.root() != nil
            receipt.from_xml(doc.root().get_elements("receipt")[0])
            @map['receipt'] = receipt
          end
          
        end
end

class Receipt < Xml
        @@keys = ["ReceiptId","ReferenceNum","ResponseCode","ISO","AuthCode","TransTime","TransDate",
        "TransType","Complete","Message","TransAmount","CardType","TransID","TimedOut","MaskedPan","BankTotals",
        "Ticket","RecurSuccess","AvsResultCode","CvdResultCode","RecurUpdateSuccess","NextRecurDate",
        "RecurEndDate","DataKey","ResSuccess","PaymentType","ResolveData","CardLevelResult","CavvResultCode",
        "StatusCode","StatusMessage"]
        make_attrs(Receipt,@@keys)

        def to_xml(indent="")
                to_xml_low("receipt",@@keys,indent)
        end
        
        def from_xml(element)
        
          @map['ReceiptId'] = element.get_elements("ReceiptId")[0].get_text
          @map['ReferenceNum'] = element.get_elements("ReferenceNum")[0].get_text
          @map['ResponseCode'] = element.get_elements("ResponseCode")[0].get_text
          @map['AuthCode'] = element.get_elements("AuthCode")[0].get_text
          @map['TransTime'] = element.get_elements("TransTime")[0].get_text
          @map['TransDate'] = element.get_elements("TransDate")[0].get_text
          @map['TransType'] = element.get_elements("TransType")[0].get_text
          @map['Complete'] = element.get_elements("Complete")[0].get_text
          @map['Message'] = element.get_elements("Message")[0].get_text
          @map['TransAmount'] = element.get_elements("TransAmount")[0].get_text
          @map['CardType'] = element.get_elements("CardType")[0].get_text
          @map['TransID'] = element.get_elements("TransID")[0].get_text
          @map['TimedOut'] = element.get_elements("TimedOut")[0].get_text
          #@map['Ticket'] = element.get_elements("Ticket")[0].get_text
          
          if element.get_elements("MaskedPan")[0] != nil
	    @map['MaskedPan'] = element.get_elements("MaskedPan")[0].get_text
          end

          if element.get_elements("RecurSuccess")[0] != nil
            @map['RecurSuccess'] = element.get_elements("RecurSuccess")[0].get_text
          end
        
          if element.get_elements("AvsResultCode")[0] != nil
            @map['AvsResultCode'] = element.get_elements("AvsResultCode")[0].get_text
          end
          
          if element.get_elements("CvdResultCode")[0] != nil
            @map['CvdResultCode'] = element.get_elements("CvdResultCode")[0].get_text
          end
          
          if element.get_elements("CardLevelResult")[0] != nil
            @map['CardLevelResult'] = element.get_elements("CardLevelResult")[0].get_text
          end
          
          if element.get_elements("CavvResultCode")[0] != nil
	    @map['CavvResultCode'] = element.get_elements("CavvResultCode")[0].get_text
          end
          
          if element.get_elements("RecurUpdateSuccess")[0] != nil
            @map['RecurUpdateSuccess'] = element.get_elements("RecurUpdateSuccess")[0].get_text
          end
        
          if element.get_elements("NextRecurDate")[0] != nil
            @map['NextRecurDate'] = element.get_elements("NextRecurDate")[0].get_text
          end
        
          if element.get_elements("RecurEndDate")[0] != nil
            @map['RecurEndDate'] = element.get_elements("RecurEndDate")[0].get_text
          end
          
          if element.get_elements("DataKey")[0] != nil
            @map['DataKey'] = element.get_elements("DataKey")[0].get_text
          end
          
          if element.get_elements("ResSuccess")[0] != nil
            @map['ResSuccess'] = element.get_elements("ResSuccess")[0].get_text
          end
          
          if element.get_elements("PaymentType")[0] != nil
            @map['PaymentType'] = element.get_elements("PaymentType")[0].get_text
          end
          
          if element.get_elements("status_code")[0] != nil
	    @map['StatusCode'] = element.get_elements("status_code")[0].get_text
          end
          
          if element.get_elements("status_message")[0] != nil
	    @map['StatusMessage'] = element.get_elements("status_message")[0].get_text
          end
          
          banktotals = RespMod::Banktotals.new
          banktotals.from_xml(element.get_elements("BankTotals")[0])
          @map['BankTotals'] = banktotals
          
     
          resdatum = Array.new
          if element != nil
            if element.get_elements("ResolveData")[0] != nil
              0.upto(element.get_elements("ResolveData").length-1) do |x|
                resdata = RespMod::ResolveData.new
                resdata.from_xml(element.get_elements("ResolveData")[x])
                resdatum << resdata
              end
            end
          end
          @map['ResolveData'] = resdatum

#          resolvedata = RespMod::ResolveData.new
#          resolvedata.from_xml(element.get_elements("ResolveData")[0])
#          @map['ResolveData'] = resolvedata

        end
end

class Banktotals < Xml
        @@keys = ["ECR"]
        make_attrs(Banktotals,@@keys)

        def to_xml(indent="")
          to_xml_low("BankTotals",@@keys,indent)
        end
        
        def from_xml(element)
        
          if element != nil
            ecr = RespMod::Ecr.new
            ecr.from_xml(element.get_elements("ECR")[0])
            @map['ECR'] = ecr
          end  
        end
end

class CvdResultCode < Xml
        @@keys = ["ECR"]
        make_attrs(CvdResultCode,@@keys)

        def to_xml(indent="")
          to_xml_low("CvdResultCode",@@keys,indent)
        end
        
        def from_xml(element)
        
          ecr = RespMod::Ecr.new
          ecr.from_xml(element.get_elements("ECR")[0])
          @map['ECR'] = ecr
        
        end
end
class Ecr < Xml
        @@keys = ["term_id","closed","Card"]
        make_attrs(Ecr,@@keys)

        def to_xml(indent="")
          to_xml_low("ECR",@@keys,indent)
        end
        
        def from_xml(element)
          
          if element != nil
  
            @map['term_id'] = element.get_elements("term_id")[0].get_text
            @map['closed'] = element.get_elements("closed")[0].get_text
          
            cards = Array.new
          
            card1 = RespMod::Card.new
            card1.from_xml(element.get_elements("Card")[0])
                    
            card2 = RespMod::Card.new
            card2.from_xml(element.get_elements("Card")[1])
                    
            card3 = RespMod::Card.new
            card3.from_xml(element.get_elements("Card")[2])
          
            cards << card1 << card2 << card3
          
            @map['Card'] = cards
          end
        end
end

class Card < Xml
        @@keys = ["CardType","Purchase","Refund","Correction"]
        make_attrs(Card,@@keys)

        def to_xml(indent="")
                to_xml_low("Card",@@keys,indent)
        end
        
        def from_xml(element)
          
          if element != nil
            purchase = RespMod::Purchase.new
            purchase.from_xml(element.get_elements("Purchase")[0])
            @map['Purchase'] = purchase
        
            refund = RespMod::Refund.new
            refund.from_xml(element.get_elements("Refund")[0])
            @map['Refund'] = refund

            correction = RespMod::Correction.new
            correction.from_xml(element.get_elements("Correction")[0])
            @map['Correction'] = correction
          
          
            if element.get_elements("CardType")[0] !=nil
              @map['CardType'] = element.get_elements("CardType")[0].get_text
            end
          end
        end
        
end

class Purchase < Xml
        @@keys = ["Count","Amount"]
        make_attrs(Purchase,@@keys)

        def to_xml(indent="")
                to_xml_low("Purchase",@@keys,indent)
        end
        
        def from_xml(element)
          if element !=nil
            @map['Count'] = element.get_elements("Count")[0].get_text
            @map['Amount'] = element.get_elements("Amount")[0].get_text
          end
        end
end

class Refund < Xml
        @@keys = ["Count","Amount"]
        make_attrs(Refund,@@keys)

        def to_xml(indent="")
                to_xml_low("Refund",@@keys,indent)
        end
        
        def from_xml(element)
          if element !=nil
            @map['Count'] = element.get_elements("Count")[0].get_text
            @map['Amount'] = element.get_elements("Amount")[0].get_text
          end
        end
end

class Correction < Xml
        @@keys = ["Count","Amount"]
        make_attrs(Correction,@@keys)

        def to_xml(indent="")
                to_xml_low("Correction",@@keys,indent)
        end
        
        def from_xml(element)
          if element !=nil
            @map['Count'] = element.get_elements("Count")[0].get_text
            @map['Amount'] = element.get_elements("Amount")[0].get_text
          end
        end
end

class ResolveData < Xml
        @@keys = ["cust_id","phone","email","note","cust_zip","cust_city","masked_account_num","account_num","cust_last_name",
        "cust_first_name","cust_state","sec","routing_num","account_type","check_num","cust_address1","cust_address2",
        "masked_pan","pan","expdate","crypt_type","avs_street_number","avs_street_name","avs_zipcode","presentation_type",
        "p_account_number","data_key","payment_type"]
        make_attrs(ResolveData,@@keys)

        def to_xml(indent="")
                to_xml_low("ResolveData",@@keys,indent)
        end
        
        def from_xml(element)
          if element !=nil
            if element.get_elements("cust_id")[0] != nil
              @map['cust_id'] = element.get_elements("cust_id")[0].get_text
            end              
            if element.get_elements("phone")[0] != nil
              @map['phone'] = element.get_elements("phone")[0].get_text
            end
            if element.get_elements("email")[0] != nil              
              @map['email'] = element.get_elements("email")[0].get_text
            end
            if element.get_elements("note")[0] != nil
              @map['note'] = element.get_elements("note")[0].get_text            
            end
            if element.get_elements("cust_zip")[0] != nil
              @map['cust_zip'] = element.get_elements("cust_zip")[0].get_text            
            end
            if element.get_elements("cust_city")[0] != nil
              @map['cust_city'] = element.get_elements("cust_city")[0].get_text            
            end
            if element.get_elements("cust_state")[0] != nil
              @map['cust_state'] = element.get_elements("cust_state")[0].get_text   
            end
            if element.get_elements("masked_account_num")[0] != nil
              @map['masked_account_num'] = element.get_elements("masked_account_num")[0].get_text            
            end
            if element.get_elements("account_num")[0] != nil
              @map['account_num'] = element.get_elements("account_num")[0].get_text            
            end
            if element.get_elements("cust_last_name")[0] != nil
              @map['cust_last_name'] = element.get_elements("cust_last_name")[0].get_text            
            end
            if element.get_elements("cust_first_name")[0] != nil
              @map['cust_first_name'] = element.get_elements("cust_first_name")[0].get_text            
            end
            if element.get_elements("sec")[0] != nil
              @map['sec'] = element.get_elements("sec")[0].get_text            
            end
            if element.get_elements("routing_num")[0] != nil
              @map['routing_num'] = element.get_elements("routing_num")[0].get_text            
            end
            if element.get_elements("account_type")[0] != nil
              @map['account_type'] = element.get_elements("account_type")[0].get_text            
            end
            if element.get_elements("check_num")[0] != nil
              @map['check_num'] = element.get_elements("check_num")[0].get_text            
            end
            if element.get_elements("cust_address1")[0] != nil
              @map['cust_address1'] = element.get_elements("cust_address1")[0].get_text            
            end
            if element.get_elements("cust_address2")[0] != nil
              @map['cust_address2'] = element.get_elements("cust_address2")[0].get_text            
            end
            if element.get_elements("pan")[0] != nil
              @map['pan'] = element.get_elements("pan")[0].get_text            
            end
            if element.get_elements("masked_pan")[0] != nil
              @map['masked_pan'] = element.get_elements("masked_pan")[0].get_text            
            end
            if element.get_elements("expdate")[0] != nil
              @map['expdate'] = element.get_elements("expdate")[0].get_text            
            end
            if element.get_elements("crypt_type")[0] != nil
              @map['crypt_type'] = element.get_elements("crypt_type")[0].get_text            
            end
            if element.get_elements("avs_street_number")[0] != nil
              @map['avs_street_number'] = element.get_elements("avs_street_number")[0].get_text            
            end
            if element.get_elements("avs_street_name")[0] != nil
              @map['avs_street_name'] = element.get_elements("avs_street_name")[0].get_text            
            end
            if element.get_elements("avs_zipcode")[0] != nil
              @map['avs_zipcode'] = element.get_elements("avs_zipcode")[0].get_text            
            end
            if element.get_elements("presentation_type")[0] != nil
              @map['presentation_type'] = element.get_elements("presentation_type")[0].get_text            
            end
            if element.get_elements("p_account_number")[0] != nil
              @map['p_account_number'] = element.get_elements("p_account_number")[0].get_text            
            end
            if element.get_elements("data_key")[0] != nil
              @map['data_key'] = element.get_elements("data_key")[0].get_text            
            end
            if element.get_elements("payment_type")[0] != nil
              @map['payment_type'] = element.get_elements("payment_type")[0].get_text            
            end
          end
        end
end
end