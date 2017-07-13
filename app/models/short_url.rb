class ShortUrl < ActiveRecord::Base
	 validates :original_url, presence: true

	 before_save :remove_protocol_type
	 LETTERS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)

	 

	 def self.decrypt_url(short)
	 	array = short.split(//)
	 	array = array.reverse
	 	sum = 0
	 	count = 0
	 	array.each do |value|
	 		sum += 62*count + LETTERS.index(value)
	 		count += 1
	 	end
	 	sum.to_i
	 end

	 def generate_short_url
	 		digit_array = convert_to_sixty_two_base
	 		string = ""
	 		digit_array.each do |value|
	 			digit = LETTERS[value]
	 			string << digit
	 		end
	 		string
	 end

	 protected

	 def remove_protocol_type
	   self.original_url = self.original_url.gsub('https://','').gsub('http://','')
	 end

	 def convert_to_sixty_two_base
	 	num = self.id
		digits = []
		while num > 0
			remainder = num%62
			digits << remainder
			num = num/62
		end
		digits = digits.reverse
		digits
	 end

end
