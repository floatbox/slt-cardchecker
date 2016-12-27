# Checking Credit Cards by the Luhn algorithm
class CardCheck
  def initialize(number_string)
    @cardnumber = number_string.gsub(/\D/, '')
  end

  def valid?
    luhn_algorithm
  end

  private

  def luhn_algorithm
    check_digits = ''
    @cardnumber.split('').reverse.each_with_index do |digit, i|
      check_digits += i.odd? ? digit : (digit.to_i * 2).to_s
    end
    (check_digits.split('').map(&:to_i).reduce(:+) % 10).zero?
  end
end
