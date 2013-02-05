local ACCOUNTSID = 'ACcd4fd39d524a70f6db244dfb51adc318'
local AUTHTOKEN = '26946965af09d519cc066753b5f89164'
local twilio_sms_number = '+14844986324'

send_sms = function(from, to, body) 
  twilio.sms(ACCOUNTSID, AUTHTOKEN, from, to, body)
end

send_pin_request = function(phone_id)
  local to = get_phone_number(phone_id)
  local body = 'What\'s your bluelink PIN?'
  send_sms(twilio_sms_number, to, body)
  set_status(phone_id, SENT_PIN_REQUEST)
end

send_phone_number_request = function(phone_id)
  local to = get_phone_number(phone_id)
  local body = 'What\'s your bluelink phone number?'
  send_sms(twilio_sms_number, to, body)
  set_status(phone_id, SENT_PHONE_CONFIRMATION_REQUEST)
end

send_car_options = function(phone_id)
  local to = get_phone_number(phone_id)
  local body = 'send "start engine" to start the engine'
  send_sms(twilio_sms_number, to, body)
  set_status(phone_id, SENT_CAR_OPTIONS)
end