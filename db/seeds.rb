def import_deck(file)
  deck_array = []
  File.open(file, 'r').each_line do |line|
    unless line == "\n"
      deck_array << line.chomp
    end
  end
  @cards = []
  deck_array.each_slice(2) do |slice|
    @cards << Card.create({question: slice.first, answer: slice.last})
  end
  p @cards
  p @ruby_deck = Deck.create({name: "Ruby Terms"})
  @cards.each do |card|
    @ruby_deck.cards << card
  end
  p @ruby_deck
end


import_deck('ruby_terms.txt')
