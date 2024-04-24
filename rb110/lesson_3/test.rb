require 'yaml'
MESSAGES = YAML.load_file('tictactoe_mess.yml')

def prompt(msg)
  puts "=> #{msg}"
end

def implement_player_name
  name = ''
  loop do
  prompt(MESSAGES['name_prompt'])
  puts ''
  print ' => '
  name = gets.chomp
  break unless name == ''
  puts (MESSAGES['invalid'])
  end
  puts ''
  "\e[34m\e[1m#{name}\e[0m"
end

p implement_player_name
