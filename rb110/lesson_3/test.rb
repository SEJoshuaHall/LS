
SUITS = ["H", "D", "S", "C"]
CARDS = [["2", 2], ["3", 3], ["4", 4], ["5", 5], ["6", 6], ["7", 7], ["8", 8], ["9", 9], ["J", 10], ["Q", 10], ["K", 10], ["A", 1]]

def deal_card()
  suit = SUITS.sample
  card_num_value = CARDS.sample
  card = [card_num_value[0], suit]
  value = card_num_value[1]
  [card, value]
end

p deal_card