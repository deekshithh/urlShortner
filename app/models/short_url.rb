class ShortUrl < ActiveRecord::Base
	 validates :original_url, presence: true, uniqueness: true

	 after_create :generate_short_url


	 def generate_short_url
	 	  letters_base_62 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
	 		digit_array = convert_to_sixty_two_base
	 		string = ""
	 		puts "dddddd" + string
	 		digit_array.each do |value|
	 			digit = letters_base_62[value]
	 			string << digit
	 		end
	 		puts "aaaa" + string
	 		self.update(:short_url_name => string)
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

	 def self.decrypt_url(short)
	 	letters_base_62 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
	 	array = short.split(//)
	 	array = array.reverse
	 	sum = 0
	 	count = 0
	 	array.each do |value|
	 		sum += 62*count + letters_base_62.index(value)
	 		count += 1
	 	end
	 	sum.to_i
	 end

end
