require 'pry-byebug'
require 'csv'

puts 'Event manager initialized'
# CSV parser
# lines = File.readlines('event_attendees.csv')
# lines.each_with_index do |line, index|
#   # skip the header line to get the rest of the names
#   next if index.zero?

#   colomns = line.split(',')
#   name = colomns[2]
#   puts name
# end

def clean_zipcode(zipcode)
  if zipcode.nil?
    '00000'
  elsif zipcode.length < 5
    zipcode.rjust(5, '0')
  elsif zipcode.length > 5
    zipcode[0..4]
  else
    zipcode
  end
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  puts "#{name} #{zipcode}"
end
