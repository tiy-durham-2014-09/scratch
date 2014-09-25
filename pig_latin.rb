# Pig Latin is a constructed language game in which words in English are altered
# according to a simple set of rules. Pig Latin takes the first consonant (or
# consonant cluster) of an English word, moves it to the end of the word and
# suffixes an -ay (for example, "pig" yields "igpay", "banana" yields "ananabay",
# and "trash" yields "ashtray".
#
# The usual rules for changing standard English into Pig Latin are as follows:
#
# For words that begin with consonant sounds, the initial consonant or consonant
# cluster is moved to the end of the word, and "ay" is added, as in the following
# examples:
#
# * "happy" => "appyhay"
# * "duck" => "uckday"
# * "glove" => "oveglay"
#
# For words that begin with vowel sounds or silent letter, you just add "way"  to
# the end. Examples are:
#
# * "egg" => "eggway"
# * "inbox" => "inboxway"
# * "eight" => "eightway"
#
# "qu" counts as a consonant, even when it's not the first thing in a word, like
# in "square," which should result in "aresquay".
#
# Your job is to write a program that will take one or more words in one string
# and emit the word or phrase in Pig Latin as one string. This program does not
# have to work on the command-line, but it's great if it can.
#
# ---
#
# Rules:
#
# * Pair with the person next to you. We will switch after each exercise.
# * You should use test-driven development to do this exercise.
# * You have 15 minutes, then we will discuss how things went.


require "minitest/autorun"

def pig_latin(word)
  vowels = %w(a e i o u)
  # start with a vowel?
  if vowels.include? word[0]
    word + "way"
  else
    idx = -1
    char = nil
    until vowels.include?(char)
      idx += 1
      char = word[idx]
      if char == "q" && word[idx + 1] == "u"
        idx += 1
      end
    end
    word.slice(idx, word.length - idx) + word.slice(0, idx) + "ay"
  end
end

class PigLatinTest < MiniTest::Unit::TestCase
  def test_vowels_work
    assert_equal "inboxway", pig_latin("inbox")
  end

  def test_one_consonant
    assert_equal "etjay", pig_latin("jet")
  end

  def test_multi_consonants
    assert_equal "oolschay", pig_latin("school")
  end

  def test_qs
    assert_equal "aresquay", pig_latin("square")
  end
end
