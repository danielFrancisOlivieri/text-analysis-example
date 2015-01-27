def textalyze(text)
  characters  = chars_in( sanitize(text) )
  char_counts = item_counts(characters)

  format_counts(char_counts)
end

def item_counts(array)
  counts = Hash.new(0)

  array.each do |item|
    counts[item] += 1
  end

  counts
end

def chars_in(string)
  string.chars
end

def sanitize(string)
  string.downcase.gsub(/[^a-z0-9\s]/, '')
end

def format_counts(counts)
  counts.map do |item, count|
    "#{item} - #{count}"
  end.join("\n")
end

if __FILE__ == $PROGRAM_NAME
  source_file = ARGV.first

  puts "The counts for #{source_file} are..."
  puts textalyze( File.read(source_file) )
end
