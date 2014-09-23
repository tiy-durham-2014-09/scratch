class Animal
  attr_accessor :stomach_contents

  def eat(food)
    @stomach_contents = food
  end

  def poop
    @stomach_contents = nil
    :poop
  end
end

class Mammal < Animal
  def breathe
    "sigh"
  end

  def suckle(young)
    young.stomach_contents = "milk"
  end
end

class Dog < Mammal
  def talk
    "woof"
  end

  def cute?
    false
  end
end

class Pug < Dog
  def cute?
    true
  end
end

class Cat < Mammal
  def talk
    "meow"
  end
end


#------------

class Card
  attr_reader :rank

  def initialize(rank)
    @rank = rank
  end
end

class BlackjackCard < Card
  def value
    if %w(J Q K).include?(rank)
      10
    elsif rank == "A"
      1
    else
      rank.to_i
    end
  end
end

class WarCard < Card
  def value
    %w(2 3 4 5 6 7 8 9 10 J Q K A).index(rank) + 2
  end
end
