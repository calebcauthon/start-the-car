local ACCOUNTSID = 'ACcd4fd39d524a70f6db244dfb51adc318'
local AUTHTOKEN = '26946965af09d519cc066753b5f89164'

local send_sms = function(from, to, body) 
  twilio.sms(ACCOUNTSID, AUTHTOKEN, from, to, body)
end