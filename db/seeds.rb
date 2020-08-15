# endpoint is: "https://developer.nps.gov/api/v1/alerts"
# api key is: "hHHg9HXifBdsyYHgHCdNoNLelczxHadbfay5cDO1"

require 'json'
require 'httparty'

PARKS_URL = "https://developer.nps.gov/api/v1/parks?limit=150&start=0&api_key=hHHg9HXifBdsyYHgHCdNoNLelczxHadbfay5cDO1"
response = HTTParty.get(PARKS_URL)

binding.pry

# read this documentation: https://medium.com/@mendes.develop/populating-your-tables-using-data-from-an-external-api-with-rest-client-and-ruby-on-rails-62817099ff90

# activities = response["data"].collect{|i| i["activities"]}
# states = response["data"].collect{|i| i["states"]}


# https://developer.nps.gov/api/v1/parks?limit=100&start=0&sort=designation&api_key=hHHg9HXifBdsyYHgHCdNoNLelczxHadbfay5cDO1
# collect parks where "designation" key includes "National Park"