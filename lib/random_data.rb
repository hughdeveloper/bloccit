#Modules help keep common functions organized and reusable throughout our application. Unlike classes, we can't instantiate or inherit from modules. Instead we use them as mixins to add functions to multiple classes.
module RandomData

  def self.random_paragraph
    sentences = []
    rand(4..6).times do
      sentences << random_sentence
    end
    sentences.join(' ')
  end

  def self.random_sentence
    strings = []
    rand(3..8).times do
      strings << random_word
    end
    sentence = strings.join(' ')
    sentence.capitalize << "."
  end

  def self.random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0, rand(3..8)].join

  end

end
