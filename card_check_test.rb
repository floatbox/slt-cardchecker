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

  describe "Cardnumber 3417 1234 5678 911" do
    it "is AMEX" do
      @card = CardCheck.new '3417 1234 5678 911'
      @card.cardtype.must_equal 'AMEX'
    end
  end

  describe "Cardnumber 6011 1234 5678 9112" do
    it "is Discover" do
      @card = CardCheck.new '6011 1234 5678 9112'
      @card.cardtype.must_equal 'Discover'
    end
  end

  describe "Cardnumber 5117 1234 5678 9112" do
    it "is MasterCard" do
      @card = CardCheck.new '5117 1234 5678 9112'
      @card.cardtype.must_equal 'MasterCard'
    end
  end

  describe "Cardnumber 4417 1234 5678 9112" do
    it "is Visa" do
      @card = CardCheck.new '4417 1234 5678 9112'
      @card.cardtype.must_equal 'Visa'
    end
  end

  describe "Cardnumber 4417 1234 5678 9" do
    it "is Visa" do
      @card = CardCheck.new '4417 1234 5678 9'
      @card.cardtype.must_equal 'Visa'
    end
  end

  describe "Cardnumber 5517 1234 5678 9" do
    it "is Unknown" do
      @card = CardCheck.new '5517 1234 5678 9'
      @card.cardtype.must_equal 'Unknown'
    end
  end

end

