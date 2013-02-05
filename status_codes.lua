local RECEIVED_INITIAL_TEXT = 'received initial text'
local SENT_PHONE_CONFIRMATION_REQUEST = 'sent phone confirmation text'
local RECEIVED_CONFIRMED_PHONE_NUMBER = 'received phone number'
local SENT_PIN_REQUEST = 'sent pin request'
local RECEIVED_PIN = 'received pin'
local SENT_CAR_OPTIONS = 'sent car options'

local set_status = function(phone_id, status)
  local status_id = phone_id..'_status' 
  storage[status_id] = RECEIVED_INITIAL_TEXT
end

get_status = function(phone_id) 
  local status_id = phone_id..'_status' 
  return storage[status_id]
end

local set_bluelink_pin = function(phone_id, pin) 
  local bluelink_pin_id = phone_id..'_pin'
  storage[bluelink_pin_id] = pin
end

local set_bluelink_phone_number = function(phone_id, phone_number) 
  local bluelink_phone_number_id = phone_id..'_bluelink_number'
  storage[bluelink_phone_number_id] = phone_number
end

local get_phone_number = function(phone_id)
  local phone_number_id = phone_id..'_number'
  return storage[phone_number_id]
end

local set_phone_number = function(phone_id, phone_number) 
  local phone_number_id = phone_id..'_number'
  storage[phone_number_id] = phone_number
end