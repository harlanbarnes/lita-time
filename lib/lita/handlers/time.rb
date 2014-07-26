module Lita
  module Handlers
    class Time < Handler
      URL = "http://api.worldweatheronline.com/free/v1/tz.ashx"

      route(/(?:what\s)?time(?:\sis\sit)?(?:\sin)?\s([^\?]+)(?:\?)?/, :fetch, command: true, help: {
        t("help.time_key") => t("help.time_value")
      })

      def self.default_config(handler_config)
        handler_config.apikey = nil
      end

      def fetch(response)
        location = response.matches[0][0]

        apikey = Lita.config.handlers.time.apikey

        http_response = http.get(
          URL,
          q: location,
          key: apikey,
          format: 'json'
        )

        data = MultiJson.load(http_response.body)["data"]

        begin
          type  = data['request'][0]['type']
          query = data['request'][0]['query']
          time  = data['time_zone'][0]['localtime'].split(/ /)[1]
          response.reply t("response.success", :type => type, :query => query, :time => time)
        rescue
          response.reply t("response.failure", :location => location)
        end
      end
    end

    Lita.register_handler(Time)
  end
end
