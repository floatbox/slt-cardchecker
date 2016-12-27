require 'minitest/autorun'
require './card_check'

describe CardCheck do

  describe "Cardnumber 4408 0412 3456 7893" do
    it "is valid" do
      @card = CardCheck.new '4408 0412 3456 7893'
      @card.valid?.must_equal true
    end
  end

  describe "Cardnumber 4417 1234 5678 9112" do
    it "is not valid" do
      @card = CardCheck.new '4417 1234 5678 9112'
      @card.valid?.must_equal false
    end
  end

end

