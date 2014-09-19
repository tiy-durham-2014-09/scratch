class Soda
  attr_reader :brand

  def initialize
    @brand = "Coke"
  end
end

class SodaMachine
  attr_accessor :sodas

  def initialize(sodas)
    @sodas = sodas
  end

  def vend
    @sodas.pop
  end
end

machine = SodaMachine.new([Soda.new,
                           Soda.new,
                           Soda.new])
soda = machine.vend
p soda.brand

# machine.sodas = [
#   Soda.new("Coke Zero"),
#   Soda.new("Diet Dr. Pepper"),
#   Soda.new("Lipton Ice")
#   ]
#
# p machine.sodas
