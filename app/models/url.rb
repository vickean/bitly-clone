class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

  validates :long_url, :format => {:with => /\(?(?:(http|https):\/\/)(?:((?:[^\W\s]|\.|-|[:]{1})+)@{1})?((?:www.)?(?:[^\W\s]|\.|-)+[\.][^\W\s]{2,4}|localhost(?=\/)|\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})(?::(\d*))?([\/]?[^\s\?]*[\/]{1})*(?:\/?([^\s\n\?\[\]\{\}\#]*(?:(?=\.)){1}|[^\s\n\?\[\]\{\}\.\#]*)?([\.]{1}[^\s\?\#]*)?)?(?:\?{1}([^\s\n\#\[\]]*))?([\#][^\s\n]*)?\)?/}
  before_save :shorten


  def shorten
    ref_array = (0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a
    output_array = []
    8.times { |x| output_array << ref_array.sample }
    self.short_url = output_array.join("")
  end

end
