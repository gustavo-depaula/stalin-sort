# Crystal 0.27.2 [60760a546] (2019-02-05)
# LLVM: 4.0.0
# Default target: x86_64-unknown-linux-gnu

puts "Hello Stalin!"
write_stalin_sort [4]
write_stalin_sort [6, 2, 5, 7, 3, 8, 8, 4]
write_stalin_sort [5, 3, 7, 8, 9, 5, 3, 5, 7]

# Hello Stalin!
# Input: [4]
# StalinBy: [4]
# StalinByDescending: [4]
# Input: [6, 2, 5, 7, 3, 8, 8, 4]
# StalinBy: [6, 7, 8, 8]
# StalinByDescending: [6, 2]
# Input: [5, 3, 7, 8, 9, 5, 3, 5, 7]
# StalinBy: [5, 7, 8, 9]
# StalinByDescending: [5, 3, 3]

def write_stalin_sort(source : Array(Int32))
  puts "Input: #{source}"
  puts "StalinBy: #{stalin_by source}"
  puts "StalinByDescending: #{stalin_by_descending source}"
end

def stalin_by(source : Array(Int32))
  stalin_sort source, false
end

def stalin_by_descending(source : Array(Int32))
  stalin_sort source, true
end

def stalin_sort(source : Array(Int32), descending : Bool)
  if source.size <= 1
    return source
  end

  result = Array(Int32).new
  lastElement = source[0]
  result << lastElement

  i = 1
  while i < source.size
    element = source[i]
    compare = if descending
                element <= lastElement
              else
                lastElement <= element
              end
    if compare
        lastElement = element
        result << element
    end

    i += 1
  end

  result
end
