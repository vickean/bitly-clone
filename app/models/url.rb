class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  # before_create :shorten

  def self.shorten
    ref_array = (0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a
    output_array = []
    6.times { |x| output_array << ref_array.sample }
    output_array.join("")
  end

end
