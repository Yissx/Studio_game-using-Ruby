require_relative 'auditable'

module StudioGame
  class Die
      include Auditable
      attr_reader :number
      
      def initialize
        roll
      end
      
      def roll
        @number = 1+rand(1..5)
      end
  end
end
  
  if __FILE__ == $0
    die = Die.new
    puts die.roll
    puts die.roll
    puts die.roll
  end