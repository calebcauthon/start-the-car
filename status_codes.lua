RECEIVED_INITIAL_TEXT = 'received initial text' 
SENT_PHONE_CONFIRMATION_REQUEST = 'sent phone confirmation text'
RECEIVED_CONFIRMED_PHONE_NUMBER = 'received phone number'
SENT_PIN_REQUEST = 'sent pin request'
RECEIVED_PIN = 'received pin'
SENT_CAR_OPTIONS = 'sent car options'

set_status = function(phone_id, status)
  local status_id = phone_id..'_status' 
  storage[status_id] = status
end

get_status = function(phone_id) 
  local status_id = phone_id..'_status' 
  return storage[status_id]
end

set_car_action = function(phone_id, car_action)
  local car_action_id = phone_id..'_caraction' 
  storage[car_action_id] = car_action
end

get_car_action = function(phone_id)
  local car_action_id = phone_id..'_caraction' 
  return storage[car_action_id]
end

get_description_of = function(car_action) 
  if(car_action == "start engine") then
    return "start your engine"
  end
end

set_bluelink_pin = function(phone_id, pin) 
  local bluelink_pin_id = phone_id..'_pin'
  storage[bluelink_pin_id] = pin
end

get_bluelink_pin = function(phone_id) 
  local bluelink_pin_id = phone_id..'_pin'
  return storage[bluelink_pin_id]
end

set_bluelink_phone_number = function(phone_id, phone_number) 
  local bluelink_phone_number_id = phone_id..'_bluelink_number'
  storage[bluelink_phone_number_id] = phone_number
end

get_bluelink_phone_number = function(phone_id) 
  local bluelink_phone_number_id = phone_id..'_bluelink_number'
  return storage[bluelink_phone_number_id]
end

get_phone_number = function(phone_id)
  local phone_number_id = phone_id..'_number'
  return storage[phone_number_id]
end

set_phone_number = function(phone_id, phone_number) 
  local phone_number_id = phone_id..'_number'
  storage[phone_number_id] = phone_number
end
