require './card_check'

card = CardCheck.new(ARGV[0])
puts "You #{card.cardtype} card #{card.valid? ? 'is valid' : 'is invalid'}"
