# Twenty-One by Joshua Hall
require 'yaml'
MESSAGES = YAML.load_file('twenty_one_mess.yml')

# DEFINING METHODS
def prompt(msg)
  print " => #{msg}"
end

def request_input
  print " => "
  gets.chomp
end

def title
  system 'clear'
  puts "\e[36m\e[1m\e[4m\e[40m#{MESSAGES['title']}\e[0m"
end

def intro
  welcome
  rules_option
end

def welcome
  title
  puts "\n#{MESSAGES['welcome']}"
  enter()
end

def enter
  puts "\n#{MESSAGES['enter_to_continue']}"
  gets.chomp
end

def rules_option
  title
  puts "\n#{MESSAGES['rules_option']}"
  puts MESSAGES['enter_to_continue']
  entry = gets.chomp
  if entry.downcase == 'r'
    rules
  end
end

def rules
  rules = [MESSAGES['rules'], MESSAGES['rules_2'], MESSAGES['rules_3'], MESSAGES['rules_4']]
  rules.each do |rule|
  title
  puts rule
  enter()
  end
end

def players(computer_name, player_name)
  intro_computer_player(computer_name)
  player_name = implement_player_name
  welcome_player(player_name)
  player_name
end

def intro_computer_player(computer_name)
  system 'clear'
  title
  puts (MESSAGES['comp_intro_1']) + computer_name.to_s +
       (MESSAGES['comp_intro_2'])
  sleep(2)
end

def implement_player_name
  name = ''
  loop do
  prompt(MESSAGES['name_prompt'])
  name = request_input
  break unless name == ''
  puts ("\n" + MESSAGES['invalid'])
  end
  "\e[34m\e[1m#{name}\e[0m"
end

def welcome_player(player_name)
  title
  puts "\n" + MESSAGES['hello'] + "#{player_name}!\n\n"
  enter()
end

def initial_hands!(player_hand, computer_hand)
  2.times do
    player_hand << deal_card
    computer_hand << deal_card
  end
end

def display_hands(computer_name, player_name, player_hand, computer_hand)
  title
  players = ''
  puts "\n#{computer_name}#{MESSAGES['contains']}#{computer_hand[0][0]}#{MESSAGES['unknown']}!"
  player_hand.each do |e|
    players << "#{MESSAGES['and']}#{e[0]}"
  end
  players = players.slice(5..) + "!"
  puts "#{player_name}#{MESSAGES['contains']}" + players + "\n\n"
  sleep(1)
end

def deal_card()
  suit = SUITS.sample
  card_num_value = CARDS.sample
  card = "#{card_num_value[0]}" + " of " + "#{suit}"
  value = card_num_value[1]
  [card, value]
end

def player_plays!(computer_name, player_name, player_hand, computer_hand)
  loop do
    display_hands(computer_name, player_name, player_hand, computer_hand)
    puts MESSAGES['player_plays']
    choice = request_input
    if choice.downcase.start_with?('h')
      player_hand << deal_card
      scores = determine_scores(player_hand, computer_hand)
      if lose?(scores[0])
        break
      end
    elsif choice.downcase.start_with?('s')
      break
    else
      MESSAGES['invalid']
    end
  end
end

def computer_plays!(computer_hand)
  loop do
    score = calculate_score(computer_hand)
    if score < 17
      computer_hand << deal_card
    else
      break
    end
  end
end

def determine_scores(player_hand, computer_hand)
  player_score = calculate_score(player_hand)
  computer_score = calculate_score(computer_hand)
  return [player_score, computer_score]
end

def determine_winner(player_score, computer_score, player_name, computer_name)
  if lose?(player_score)
    return computer_name
  elsif lose?(computer_score) && !lose?(player_score)
    return player_name
  elsif player_score > computer_score
    return player_name
  elsif player_score < computer_score
    return computer_name
  else
    return 'tie'
  end
end

def display_scores(player_score, computer_score, player_name, computer_name)
  puts "\n#{computer_name}#{MESSAGES['score_update_1']}#{computer_score}#{MESSAGES['score_update_2']}"
  puts "\n#{player_name}#{MESSAGES['score_update_1']}#{player_score}#{MESSAGES['score_update_2']}"
end

def winner_message(winner, computer_name, player_name)
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
  title
  scores = determine_scores(player_hand, computer_hand)
  player_score = scores[0]
  computer_score = scores[1]
  winner = determine_winner(player_score, computer_score, player_name, computer_name)
  display_scores(player_score, computer_score, player_name, computer_name)
  winner_message(winner, computer_name, player_name)
end

def calculate_score(hand)
  score = 0
  num_aces = num_aces(hand)
  hand.each{|e|score += e[1]}
  num_aces.times do
    if score < 13
      score += 9
    end
  end
  score
end

def num_aces(hand)
  count = 0
  hand.each do |arr|
    if arr[0][0..2] == "Ace"
      count += 1
    end
  end
  count
end

def lose?(score)
  score > 21
end

def play_again()
  answer = ''
  loop do
    prompt(MESSAGES['play_again'] + "\n")
    answer = request_input.downcase.chars.first
    if answer == 'y' || answer == 'n'
      break
    else
      puts MESSAGES['invalid']
    end
  end
  answer
end

def conclusion
  system 'clear'
  title
  puts MESSAGES['thanks'] + computer_name
end  

# INITIALIZING VARIABLES
player_name = 'test'
computer_name = "\e[31m\e[1mSerious George\e[0m"

player_hand = []
computer_hand = []
player_hand_value = 0
player_hand_aces = 0
computer_hand_value = 0
computer_hand_aces = 0
player_score = 0
computer_score = 0

whos_next = ''
play_again = ''

SUITS = ["Hearts", "Diamonds", "Spades", "Clubs"]
CARDS = [["2", 2], ["3", 3], ["4", 4], ["5", 5], ["6", 6], ["7", 7], ["8", 8], ["9", 9], ["Jack", 10], ["Queen", 10], ["King", 10], ["Ace", 1]]

# LOGIC OF PROGRAM

intro
player_name = players(computer_name, player_name)

loop do
  player_hand = []
  computer_hand = []
  player_hand_value = 0
  player_hand_aces = 0
  computer_hand_value = 0
  computer_hand_aces = 0
  player_score = 0
  computer_score = 0
  
  initial_hands!(player_hand, computer_hand)
  display_hands(computer_name, player_name, player_hand, computer_hand)
  player_plays!(computer_name, player_name, player_hand, computer_hand)
  computer_plays!(computer_hand)
  display_hands(computer_name, player_name, player_hand, computer_hand)
  display_winner(computer_name, player_name, player_hand, computer_hand)
  break unless play_again() == 'y'
end

conclusion
