require('sinatra')
require "sinatra/json"

require_relative('./models/scraper')

get '/' do
  erb( :home )
end

get '/test' do
  @scraper_util = Scraper.new
  the_test = @scraper_util.scrape("https://publications.parliament.uk/pa/cm/cmregmem/180122/baker_steve.htm")
  json the_test
end
