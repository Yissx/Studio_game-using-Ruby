
module StudioGame
    module Auditable
        def audit 
            puts "Rolled a #{self.number} (#{self.class})"
            self.number
        end
    end
end