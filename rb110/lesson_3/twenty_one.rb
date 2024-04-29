# Twenty-One by Joshua Hall
require 'yaml'
MESSAGES = YAML.load_file('twenty_one_mess.yml')

# CONSTANTS
SUITS = ["H", "D", "S", "C"]
CARDS = [["2", 2], ["3", 3], ["4", 4], ["5", 5], ["6", 6], ["7", 7], ["8", 8], ["9", 9], ["J", 10], ["Q", 10], ["K", 10], ["A", 1]]

# DEFINING METHODS

# Display Helpers

def display_prompt(msg)
  print " => #{msg}"
end

def display_title
  system 'clear'
  puts "\e[36m\e[1m\e[4m\e[40m#{MESSAGES['title']}\e[0m"
end

def display_intro
  display_welcome
  prompt_rules_option
end

def display_welcome
  display_title
  puts "\n#{MESSAGES['welcome']}"
  prompt_enter()
end

def display_rules
  rules = [MESSAGES['rules'], MESSAGES['rules_2'], MESSAGES['rules_3'], MESSAGES['rules_4']]
  rules.each do |rule|
    display_title
  puts rule
  prompt_enter()
  end
end

def display_computer_player(computer_name)
  system 'clear'
  display_title
  puts (MESSAGES['comp_intro_1']) + computer_name.to_s +
       (MESSAGES['comp_intro_2'])
  sleep(2)
end

def display_welcome_player(player_name)
  display_title
  puts "\n" + MESSAGES['hello'] + "#{player_name}!\n\n"
  prompt_enter()
end

def display_computer_hand(computer_hand)
  puts " +-----+"
  puts " |#{computer_hand[0][0][1]}    |"
  if computer_hand[0][0] == '10'
    puts " |  #{computer_hand[0][0][0]} |"
  else
    puts " |  #{computer_hand[0][0][0]}  |"
  end
  puts " |    #{computer_hand[0][0][1]}|"
  puts " +-----+"
end

def display_player_hand(player_hand)
  num_cards = player_hand.count
  num_cards.times {print " +-----+ "}
  puts ''
  player_hand.each do |e|
    print " |#{e[0][1]}    | "
  end
  puts ''
  player_hand.each do |e|
    if e[0][0] == '10'
      print " |  #{e[0][0]} | "
    else
      print " |  #{e[0][0]}  | "
    end
  end
  puts ''
  player_hand.each do |e|
    print " |    #{e[0][1]}| "
  end
  puts ''
  num_cards.times {print " +-----+ "}
  puts ''
end

def display_hands(computer_name, player_name, player_hand, computer_hand)
  display_title
  puts "\n#{computer_name}#{MESSAGES['contains']}"
  display_computer_hand(computer_hand)
  puts "\n#{player_name}#{MESSAGES['contains_2']}"
  display_player_hand(player_hand)
  sleep(1)
end

def display_scores(player_score, computer_score, player_name, computer_name)
  puts "\n#{computer_name}#{MESSAGES['score_update_1']}#{computer_score}#{MESSAGES['score_update_2']}"
  puts "\n#{player_name}#{MESSAGES['score_update_1']}#{player_score}#{MESSAGES['score_update_2']}"
end

def display_winner_message(winner, computer_name, player_name)
  case winner
  when "#{computer_name}"
    puts "\n#{computer_name}#{MESSAGES['won']}"
  when "#{player_name}"
    puts "\n#{player_name}#{MESSAGES['won']}"
  when "tie"
    puts "\n#{MESSAGES['tie']}"
  end
end

def display_winner(computer_name, player_name, player_hand, computer_hand)
  display_title
  scores = determine_scores!(player_hand, computer_hand)
  player_score = scores[0]
  computer_score = scores[1]
  winner = determine_winner!(player_score, computer_score, player_name, computer_name)
  display_scores(player_score, computer_score, player_name, computer_name)
  display_winner_message(winner, computer_name, player_name)
end

def display_conclusion(computer_name)
  system 'clear'
  display_title
  puts MESSAGES['thanks'] + computer_name
end  

# display_prompt for Input Helpers

def prompt_input
  print " => "
  gets.chomp
end

def prompt_enter
  puts "\n#{MESSAGES['enter_to_continue']}"
  gets.chomp
end

def prompt_rules_option
  display_title
  puts "\n#{MESSAGES['rules_option']}"
  puts MESSAGES['enter_to_continue']
  entry = gets.chomp
  if entry.downcase == 'r'
    display_rules
  end
end

def prompt_player_name
  name = ''
  loop do
  display_prompt(MESSAGES['name_display_prompt'])
  name = prompt_input
  break unless name == '' || name == ' ' || name == '  ' || name == '   ' || name == '    '
  puts ("\n" + MESSAGES['invalid'])
  end
  "\e[34m\e[1m#{name}\e[0m"
end

def prompt_play_again()
  answer = ''
  loop do
    display_prompt(MESSAGES['play_again'] + "\n")
    answer = prompt_input.downcase.chars.first
    if answer == 'y' || answer == 'n'
      break
    else
      puts MESSAGES['invalid']
    end
  end
  answer
end

# Game Logic Helpers

def determine_players!(computer_name, player_name)
  display_computer_player(computer_name)
  player_name = prompt_player_name
  display_welcome_player(player_name)
  player_name
end


def determine_initial_hands!(player_hand, computer_hand)
  2.times do
    player_hand << determine_deal_card!
    computer_hand << determine_deal_card!
  end
end

def determine_deal_card!()
  suit = SUITS.sample
  card_num_value = CARDS.sample
  card = [card_num_value[0], suit]
  value = card_num_value[1]
  [card, value]
end

def determine_player_plays!(computer_name, player_name, player_hand, computer_hand)
  loop do
    display_hands(computer_name, player_name, player_hand, computer_hand)
    puts MESSAGES['player_plays']
    choice = prompt_input
    if choice.downcase.start_with?('h')
      player_hand << determine_deal_card!
      scores = determine_scores!(player_hand, computer_hand)
      if determine_lose?(scores[0])
        system 'clear'
        puts "#{player_name} BUSTED!"
        sleep(2)
        break
      end
    elsif choice.downcase.start_with?('s')
      break
    else
      system 'clear'
      puts MESSAGES['invalid']
      sleep(2)
    end
  end
end

def determine_computer_plays!(computer_hand, player_score)
  if determine_lose?(player_score)
    return computer_hand
  else
    loop do
      score = calculate_score!(computer_hand)
      if score < 17
        computer_hand << determine_deal_card!
      else
        break
      end
    end
  end
end

def determine_scores!(player_hand, computer_hand)
  player_score = calculate_score!(player_hand)
  computer_score = calculate_score!(computer_hand)
  return [player_score, computer_score]
end

def determine_winner!(player_score, computer_score, player_name, computer_name)
  if determine_lose?(player_score)
    return computer_name
  elsif determine_lose?(computer_score) && !determine_lose?(player_score)
    puts "#{computer_name} BUSTED!"
    return player_name
  elsif player_score > computer_score
    return player_name
  elsif player_score < computer_score
    return computer_name
  else
    return 'tie'
  end
end

def calculate_score!(hand)
  score = 0
  determine_num_aces = determine_num_aces(hand)
  hand.each{|e|score += e[1]}
  determine_num_aces.times do
    if score < 13
      score += 9
    end
  end
  score
end

def determine_num_aces(hand)
  count = 0
  hand.each do |arr|
    if arr[0][0..2] == "Ace"
      count += 1
    end
  end
  count
end

def determine_lose?(score)
  score > 21
end

# INITIALIZING VARIABLES
player_name = ''
computer_name = "\e[31m\e[1mSerious George\e[0m"

# LOGIC OF PROGRAM

display_intro
player_name = determine_players!(computer_name, player_name)

loop do
  player_hand = []
  computer_hand = []
  player_score = 0
  
  determine_initial_hands!(player_hand, computer_hand)
  display_hands(computer_name, player_name, player_hand, computer_hand)
  determine_player_plays!(computer_name, player_name, player_hand, computer_hand)
  determine_computer_plays!(computer_hand, player_score)
  display_hands(computer_name, player_name, player_hand, computer_hand)
  display_winner(computer_name, player_name, player_hand, computer_hand)
  break unless prompt_play_again() == 'y'
end

display_conclusion(computer_name)
