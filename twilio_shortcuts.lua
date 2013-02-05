local ACCOUNTSID = 'ACcd4fd39d524a70f6db244dfb51adc318'
local AUTHTOKEN = '26946965af09d519cc066753b5f89164'
local twilio_sms_number = '+14844986324'
local twilio_voice_number = '+14844986324'
local BLUELINK_CALL_CENTER = '8552258354'

twilio.call = function (accountsid, authtoken, from, to, url, sendDigits)
	return http.request {
		method = 'POST',
		url = string.format('https://api.twilio.com/2010-04-01/Accounts/%s/Calls.json', accountsid),
		data={ From=from, To=to, Url=url, SendDigits=sendDigits},
		auth={accountsid, authtoken}
	}
end

send_get_started_message = function(phone_id) 
  local body = 'Welcome to 484HYUNDAI. We are not officially affiliated with Hyundai. For more info, visit 484HYUNDAI.com.'
  send_sms(phone_id, body)
  
  local body = 'What would you like to do? text "1" or "start engine", text "2" or "flash lights"'
  send_sms(phone_id, body)
end

send_call_to_bluelink_to_start_engine = function(phone_id)
  local confirmed_phone_number = get_bluelink_phone_number(phone_id)
	local pin = get_bluelink_pin(phone_id)
	local callback_url = 'https://bluelink.webscript.io/start-engine-twilio-script'
	local digits = 'ww1ww1wwwwwwwwwwwwwwwwwwwwwwww1ww'..confirmed_phone_number..'www'..pin..'wwwwwwwwwwwwww'
	send_phonecall(BLUELINK_CALL_CENTER, callback_url, digits)
end

send_phonecall = function(to, callback_url, numbers_to_press_after_answer) 
  local from = twilio_voice_number
  twilio.call(ACCOUNTSID, AUTHTOKEN, from, to, callback_url, numbers_to_press_after_answer)
end

send_sms = function(phone_id, body) 
  local to = get_phone_number(phone_id)
  twilio.sms(ACCOUNTSID, AUTHTOKEN, twilio_sms_number, to, body)
end

send_unknown_action_message = function(phone_id, car_action) 
  local body = 'Sorry, "'..car_action..'" is not valid. try "start engine"'
  send_sms(phone_id, body)
end

send_bad_phone_number_message = function(phone_id, msg) 
  local body = 'Sorry, "'..msg..'" is not a valid phone number. Try again. The phone number must be 10 digits.'
  send_sms(phone_id, body)
end

send_pin_request = function(phone_id)
  local body = 'What\'s your bluelink PIN?'
  send_sms(phone_id, body)
  set_status(phone_id, SENT_PIN_REQUEST)
end

send_phone_number_request = function(phone_id)
  local body = 'What\'s your bluelink phone number? (or text "me" if you\'re calling from your bluelink-associated phone number)'
  send_sms(phone_id, body)
  set_status(phone_id, SENT_PHONE_CONFIRMATION_REQUEST)
end

send_car_options = function(phone_id)
  local body = 'send "start engine" to start the engine'
  send_sms(phone_id, body)
  set_status(phone_id, SENT_CAR_OPTIONS)
end
