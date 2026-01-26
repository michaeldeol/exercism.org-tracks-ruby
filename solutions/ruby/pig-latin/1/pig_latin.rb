=begin
Write your code for the 'Pig Latin' exercise in this file. Make the tests in
`pig_latin_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pig-latin` directory.
=end

module PigLatin
  VOWELS = ['a', 'e', 'i', 'o', 'u']
  def self.translate(str)
    final_words = []
    words = str.split
    words.each do |word|
      left_found = ''
      xr_found = word.start_with?("xr")
      yt_found = word.start_with?("yt")
      y_found = word.start_with?("y")

      unless yt_found || xr_found
        word.each_char do |char|
          v_found = VOWELS.select { |v| char.start_with?(v) }
          if y_found
            left_found += char
            break
          elsif char == 'y'
            break
          elsif v_found.empty?
            left_found += char
          elsif left_found.end_with?('q') && v_found[0] == 'u'
             left_found += char
             break
          else
            break
          end
        end
      end
      cleaned_word = word.delete_prefix left_found
      final_words.push(cleaned_word + left_found + "ay")
    end
    return final_words.join(' ')
  end
end