Pay2go.setup do |pay2go|
  if Rails.env.development?
    pay2go.merchant_id = "12046344"  # 放測試站的 key


    pay2go.hash_key    = "VZevFPfd0xlnMSHwcz9bMlqEFV95LWzG"
    pay2go.hash_iv     = "VNcADsOE0a2M2Jif"
    pay2go.service_url = "https://capi.pay2go.com/MPG/mpg_gateway"
  else
    pay2go.merchant_id = "12046344"  # 放正式站的 key


    pay2go.hash_key    = "VZevFPfd0xlnMSHwcz9bMlqEFV95LWzG"
    pay2go.hash_iv     = "VNcADsOE0a2M2Jif"
    pay2go.service_url = "https://api.pay2go.com/MPG/mpg_gateway"
  end
end
