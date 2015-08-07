def word_count(text)
  text.length
end

paragraph = "Hello friends, this is a paragraph.  It has a bunch of words."

puts(word_count(paragraph))

def is_palindrome(word)
    return word == word.reverse
end

fibonacci maze