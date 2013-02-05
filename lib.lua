string.is_ten_digits = function(txt) 
  txt = string.gsub(txt, '[^0-9]', '')
  if(string.len(txt) == 10) then
    return true
  else
    return false
  end
end

string.is_four_digits = function(txt) 
  txt = string.gsub(txt, '[^0-9]', '')
  if(string.len(txt) == 4) then
    return true
  else
    return false
  end
end