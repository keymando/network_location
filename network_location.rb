Command.to_run :description => 'Wifi', :remember => true do
  add_block do 
    `scselect "Wifi Only" > /dev/null`
  end
end

Command.to_run :description => 'Ethernet', :remember => true do
  add_block do 
    `scselect "Ethernet Only" > /dev/null`
  end
end

command 'Change Network Location', :remember => true do
  locations = `scselect 2>&1 | grep -v "* =="`.chomp.split("\n").map do |line|
    location = /\((.+)\)/.match(line)[1]
    DisplayItem.new(location, location)
  end
  trigger_item_with(locations, ChangeNetworkLocation.new)                                                                                                                                                             
end
