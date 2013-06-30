class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds

  def shuffle
    self.cards.shuffle
  end

end
