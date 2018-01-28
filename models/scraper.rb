require 'httparty'
require 'nokogiri'

class Scraper

  attr_accessor :parse_page

  def initialize()

    @mp_objects = []

    scrape("https://publications.parliament.uk/pa/cm/cmregmem/180122/baker_steve.htm")

  end

  def scrape(url)
    @doc = HTTParty.get(url)
    parse_page ||= Nokogiri::HTML(@doc)
    data = parse_page.css(".indent").children
    p data
    my_array = []
    test_object = {}
    for line in data
      my_array.push(line.text)
    end
    for element in my_array
      if (element == "")
        my_array.delete(element)
      else
        split_sentence = sentence_splitter(element)

        test_object.merge!(split_sentence[0] => split_sentence[1])
      end
      my_overall_object = {
        "Steve Baker" => test_object
      }
    end

    return my_overall_object
  end

  def sentence_splitter(sentence)
    splat = sentence.split(": ")
  end

  scraper = Scraper.new

end
