# require 'dictionary.txt'

class WordChainer

  def initialize()#*words)
    @dictionary = IO.readlines('dictionary.txt').map{ |el| el.chomp }
    # @dictionary = Array.new(@dictionary)
    # @first_word = words[0]
    # @second_word = words[1]
    # @all_words_seen = [words[0]]
    # @current_words = [words[0]]
  end


  def adjacent_words(word)
    sub_dictionary = @dictionary.select { |el| el.length == word.length }
    possible_words = []
    sub_dictionary.each do |dictionary_word|
      letter_count = (0...word.length).to_a.count {|idx| word[idx] == dictionary_word[idx]}
      possible_words << dictionary_word if letter_count == word.length - 1
    end
    possible_words
  end

  def run(source, target)
    current_words = [source]
    all_words_seen = [source]
    until current_words.empty?
      new_current_words = []
      current_words.each do |word|
        adjacent_words(word).each do |changed_word|
          unless all_words_seen.include?(changed_word)
            new_current_words << changed_word
            all_words_seen << changed_word
          end
        end
      end
      p new_current_words
      current_words = new_current_words
    end
  end

end

word = WordChainer.new()
p word.run("cat", "hat")

# if __FILE__ == $PROGRAM_NAME
#   g = WordChainer.new(ARGV)
#   g.run(@first_word, @second_word)
#
# end



#
#
# class WordChainer
#
#   def initialize(*words)
#     @dictionary = File.readlines('dictionary.txt').map{ |el| el.chomp }
#     @first_word = words[0]
#     @second_word = words[1]
#     @all_words_seen = [words[0]]
#     @current_words = [words[0]]
#   end
#
#   def adjacent_words(word)
#     sub_dictionary = @dictionary.select { |el| el.length == word.length }
#     possible_words = []
#     sub_dictionary.each do |dictionary_word|
#       letter_count = (0...word.length).to_a.count {|idx| word[idx] == dictionary_word[idx]}
#       possible_words << dictionary_word if letter_count == word.length - 1
#     end
#     possible_words
#   end
#
#   def run(source, target)
#     until @current_words.empty?
#       new_current_words = []
#       @current_words.each do |word|
#         adjacent_words(word).each do |changed_word|
#           unless @all_words_seen.include?(changed_word)
#             new_current_words << changed_word
#             all_words_seen << changed_word
#           end
#         end
#       end
#       p new_current_words
#       @current_words = new_current_words
#     end
#   end
#
# end
#
#
#
# if __FILE__ == $PROGRAM_NAME
#   g = WordChainer.new(ARGV)
#   g.run(@first_word, @second_word)
#
# end
