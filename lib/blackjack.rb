require 'pry'

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(total)
  puts "Your cards add up to #{total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(total)
  puts "Sorry, you hit #{total}. Thanks for playing!"
end

def initial_round
  hand = deal_card + deal_card
  display_card_total(hand)
  hand
end

def hit?(total)
  prompt_user
  input = get_user_input
  if input == "s"
    return total
  elsif input == "h"
    return total += deal_card
  else
    invalid_command
    hit?(total)
  end


end

def invalid_command
  puts ("Please enter a valid command")
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  binding.pry
  welcome
  hand = initial_round
  until hand > 21
    hit?(hand)
    display_card_total(hand)
  end
  end_game(hand)

end
