require 'csv'
require 'benchmark'
require_relative '../config/environments/init'

def generate_pairs
  urls_list = CSV.read('urls.csv')
  @final_array = []
  urls_list.each_with_index do |x, index|

    edit_string = x[0].chop
    edit_string[0] = ''

    ref_array = (0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a
    output_array = []
    8.times { |x| output_array << ref_array.sample }
    short_url = output_array.join("")

    temp = %Q[('#{edit_string}', '#{short_url}')]

    @final_array << temp
    puts "Entry No.#{index + 1} of #{urls_list.size} done!"
  end
  @final_array.join(", ")
end

def seed_db
  sql = 'INSERT INTO urls ("long_url", "short_url") VALUES ' + generate_pairs

  Url.connection.execute sql
end

puts Benchmark.measure { seed_db }
