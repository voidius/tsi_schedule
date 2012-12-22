namespace :schedule do



  CONFIG = {
    debug_mode: true,
    items_uri:  'http://services.tsi.lv/schedule/api/service.asmx/GetItems',
    events_uri: 'http://services.tsi.lv/schedule/api/service.asmx/GetEvents',
    param_str:  '?from=%s&to=%s&teachers=%s&rooms=%s&groups=%s'
  }



  desc "Synchronize with TSI server"
  task :sync => :environment do
    require 'net/http'

    raw_content = Net::HTTP.get URI.parse(CONFIG[:items_uri])
    items = ActiveSupport::JSON.decode ActiveSupport::JSON.decode(raw_content.gsub(/^\(|\)$/, ''))["d"]

    if (teachers = items["teachers"]).any?
      Teacher.destroy_all
      teachers.each do |code, name|
        Teacher.create code: code, name: name
      end
      puts "Synchronization of 'Teachers' succeeded"
    else
      puts "Synchronization of 'Teachers' failed"
    end

    if (rooms = items["rooms"]).any?
      Room.destroy_all
      rooms.each do |code, name|
        Room.create code: code, name: name
      end
      puts "Synchronization of 'Rooms' succeeded"
    else
      puts "Synchronization of 'Rooms' failed"
    end


    if (groups = items["groups"]).any?
      Group.destroy_all
      groups.each do |code, name|
        Group.create code: code, name: name
      end
      puts "Synchronization of 'Groups' succeeded"
    else
      puts "Synchronization of 'Groups' failed"
    end
  end



end