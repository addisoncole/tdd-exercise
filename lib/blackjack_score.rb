# blackjack_score.rb

VALID_CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 'King', 'Queen', 'Jack']


hand = []

def blackjack_score(hand)
score = 0
hand.each do |card|

  if VALID_CARDS.include?(card) == false
    raise ArgumentError.new("#{card} <= Invalid card in hand")
  elsif card == 1 && (score + 11) <= 21
    score += 11
  elsif card == "King" || card == "Queen" || card == "Jack"
    score += 10
    if score > 21
      raise ArgumentError.new("BUST")
    end
  else
    score += card
    if score > 21
      raise ArgumentError.new("BUST")
    end
  end
end
return score
end
