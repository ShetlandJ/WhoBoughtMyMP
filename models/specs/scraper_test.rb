require('minitest/autorun')
require('minitest/rg')

require_relative('../scraper')

class TestExcelReader < MiniTest::Test
  def setup()
    @scraper_util = Scraper.new()
  end

  def test_can_split_sentences()
    assert_equal("true", @scraper_util.sentence_splitter("This is a testAnd I hope it works"))
  end

end
