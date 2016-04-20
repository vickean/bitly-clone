class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

  validates :long_url, :format => {:with => /(((ftp|http|https):\/\/)|(\/)|(..\/))(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/}

  def self.shorten
    ref_array = (0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a
    output_array = []
    8.times { |x| output_array << ref_array.sample }
    output_array.join("")
  end

end
