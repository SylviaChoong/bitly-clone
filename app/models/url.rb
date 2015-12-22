class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	before_create :shorten
	def shorten
		self.generate_code
		self.short_url = "#{@code}"
	end

	def generate_code
		set = Array('A'..'Z') + Array('a'..'z') + Array('1'..'9')
		@code = Array.new(7){set.sample}.join
	end
end

# url = Url.new
# p url.generate_code
# generate code will generate 7 digits and store at @code
# url.generate_code
# url.shorten("http://learn.nextacademy.com/challenges/240?tab=attempts")