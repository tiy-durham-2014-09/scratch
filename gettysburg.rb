require 'awesome_print'

gettysburg = "Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal.

Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battlefield of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.

But, in a larger sense, we can not dedicate, we can not consecrate, we can not hallow this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us—that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion—that we here highly resolve that these dead shall not have died in vain—that this nation, under God, shall have a new birth of freedom—and that government of the people, by the people, for the people, shall not perish from the earth."

words = gettysburg.split(/[\s\-—.,;]+/).map do |word|
  word.downcase
end

# When reducing a collection to an object that is of the same
# type as the collection, you don't have to provide an initial value.

longest_word = words.inject do |current_longest, word|
  if word.length > current_longest.length
    word
  else
    current_longest
  end
end

# When reducing a collection to an object that is NOT of the same
# type as the collection, you DO have to provide an initial value.

longest_word_size = words.inject(0) do |cur_size, word|
  if word.length > cur_size
    word.length
  else
    cur_size
  end
end

def max(*nums)
  nums.inject(0) do |max, num|
    if max > num
      max
    else
      num
    end
  end
end

freq = words.reduce(Hash.new(0)) do |acc, word|
  acc[word] += 1
  acc
end

def add_to_word_count(hash, word)
  hash[word] += 1
  hash
end

freq = Hash.new(0)
words.each do |word|
  freq = add_to_word_count(freq, word)
end

# add_to_word_count({"hello" => 1}, "world") => {"hello" => 1, "world" => 1}
# add_to_word_count({"hello" => 1}, "world") => {"hello" => 1, "world" => 2}

ap longest_word
ap longest_word_size
ap max(7, 10, 2, 16, 3, 89, 9)
ap max(-3, -89, -7, -1)

ap freq

dice = [1, 2, 4, 4, 6]

dicefreq = dice.reduce(Hash.new(0)) do |acc, die|
  acc[die] += 1
  acc
end

ap dicefreq
