module Schedule



  CONFIG = {
    items_uri:  'http://services.tsi.lv/schedule/api/service.asmx/GetItems',
    events_uri: 'http://services.tsi.lv/schedule/api/service.asmx/GetEvents',
    param_str:  '?from=%s&to=%s&teachers=%s&rooms=%s&groups=%s'
  }



  class Grabber



    require 'net/http'



    def self.get_events(args={})
      param_str = CONFIG[:param_str] % [
        args[:from],
        args[:to],
        args[:teachers],
        args[:rooms],
        args[:groups]
      ]

      uri = URI.parse(CONFIG[:events_uri] + param_str)
      Rails.logger.debug Time.now.to_s << " Events grabbed from: " << uri.to_s

      raw_content = Net::HTTP.get uri
      d = ActiveSupport::JSON.decode(raw_content.gsub(/^\(|\)$/, ''))["d"]
      events = ActiveSupport::JSON.decode(d)["events"]

      beautify events
    end



    private



      def self.beautify(source)
        output = []
        source["values"].each do |item_data|
          next unless item_data[2].present? || item_data[4] == 'Subject of Free Choice'
          output << {
            time:    Time.at(item_data[0]).utc,
            room:    item_data[1].map { |room_code| Room.find_by_code room_code },
            groups:  item_data[2].map { |group_code| Group.find_by_code group_code },
            teacher: Teacher.find_by_code(item_data[3]),
            name:    item_data[4],
            comment: item_data[5],
            class:   item_data[6]
          }
        end
        output
      end



  end



end