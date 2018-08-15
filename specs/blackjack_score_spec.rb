require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal(7)

  end

  it 'facecards have values calculated correctly' do
    hand = ["King", "Queen"]

    score = blackjack_score(hand)

    expect(score).must_equal 20

    hand = ["Jack", "Queen"]

    score = blackjack_score(hand)

    expect(score).must_equal 20

  end

  it 'calculates aces as 11 where it does not go over 21' do
    hand = ["Queen", 1]

    score = blackjack_score(hand)

    expect(score).must_equal 21

    hand = [5, 5, 1]

    score = blackjack_score(hand)

    expect(score).must_equal 21

    hand = [4, 3, 1]

    score = blackjack_score(hand)

    expect(score).must_equal 18

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do

    hand = [5,6,1]

    score = blackjack_score(hand)

    expect(score).must_equal 12

    hand = ["Queen", "King", 1]

    score = blackjack_score(hand)

    expect(score).must_equal 21

    hand = [4, 4, 5, 1]

    score = blackjack_score(hand)

    expect(score).must_equal 14

  end

  it 'raises an ArgumentError for invalid cards' do

    hand = ["Queen", "Joker"]

    score = blackjack_score(hand)

    expect {
      hand("Queen", "Joker")
    }.must_raise ArgumentError
  end

  it 'raises an ArgumentError for scores over 21' do

    hand = ["Queen", 6, 6]

    score = blackjack_score(hand)

    expect(score).must_raise ArgumentError

    hand = ["Queen", "Jack", 2]

    score = blackjack_score(hand)

    expect(score).must_raise ArgumentError

    hand = [1, 2, "King"]

    score = blackjack_score(hand)

    expect(score).must_raise ArgumentError

  end
end
