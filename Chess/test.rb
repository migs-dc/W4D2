(0...8).each do |row|
  (0...8).each do |col|
     if row == 0 || row == 1
      print :B
     elsif  row == 6 || row == 7 
      print :W
     else
      print :N
     end
     print " "
  end
  puts
end

