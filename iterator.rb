def conversation(iterations)
    1.upto(iterations) { |i| yield(i)}
end
conversation(9) do |i|
    puts "#{i} situps"
    puts "#{i} pushups"
    puts "#{i} chinups"
end
