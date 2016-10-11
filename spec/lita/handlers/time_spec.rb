require "spec_helper"

describe Lita::Handlers::Time, lita_handler: true do

  it { is_expected.to route_command("time Mableton, GA").to(:fetch) }
  it { is_expected.to route_command("time Mableton, GA?").to(:fetch) }
  it { is_expected.to route_command("time in Mableton, GA").to(:fetch) }
  it { is_expected.to route_command("time in Mableton, GA?").to(:fetch) }
  it { is_expected.to route_command("what time in Mableton, GA").to(:fetch) }
  it { is_expected.to route_command("what time in Mableton, GA?").to(:fetch) }
  it { is_expected.to route_command("what time is it in Mableton, GA").to(:fetch) }
  it { is_expected.to route_command("what time is it in Mableton, GA?").to(:fetch) }
  it { is_expected.to_not route_command("I think it's time for lunch") }

  describe "#fetch" do
    let(:response) { double("Faraday::Response") }

    before do
      allow_any_instance_of(
        Faraday::Connection
      ).to receive(:get).and_return(response)
    end

    it "replies with the current time of the given location" do
      allow(response).to receive(:body).and_return(<<-JSON.chomp
{
   "data" : {
      "request" : [
         {
            "query" : "Mableton, United States Of America",
            "type" : "City"
         }
      ],
      "time_zone" : [
         {
            "localtime" : "2014-07-26 03:59",
            "utcOffset" : "-4.0"
         }
      ]
   }
}
JSON
      )
      send_command("time Mableton, GA")
      expect(replies.last).to eq(
        "The current time for the City of Mableton, United States Of America is 03:59"
      )
    end

    it "replies with the current time of the given location" do
      allow(response).to receive(:body).and_return(<<-JSON.chomp
{
   "data" : {
      "error" : [
         {
            "msg" : "Unable to find any matching weather location to the query submitted!"
         }
      ]
   }
}
JSON
      )
      send_command("time not a real place")
      expect(replies.last).to eq(
        "Sorry, couldn't find not a real place"
      )
    end

    it "replies with a helpful message when the API returns non-JSON" do
      allow(response).to receive(:body).and_return("")

      send_command("time Mableton, GA")
      expect(replies.last).to eq(
        "Error parsing API response for Mableton, GA"
      )
    end
  end
end
