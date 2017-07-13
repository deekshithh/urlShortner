

require 'rails_helper'

RSpec.describe ShortUrl, type: model do
  context "generate_short_url method"
	it "should retun the correct short url when id = 1 " do
		letters_base_62 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
		short_url = ShortUrl.create(original_url: "google.com")
		expect(short_url).to be_valid
		expect(short_url.short_url_name).to eq(letters_base_62[short_url.id])
	end

	it "should retun the correct short url when id = 1 " do
		letters_base_62 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
		short_url1 = ShortUrl.create(original_url: "google.com")
		short_url2 = ShortUrl.create(original_url: "facebook.com")
		expect(short_url2).to be_valid
		expect(short_url2.short_url_name).to eq(letters_base_62[short_url2.id])
	end
  end

  context "convert_to_sixty_two_base method" do
  	it "should return the correct base 62 value" do
  		short_url = ShortUrl.create(original_url: "google.com")
  		expect(short_url.convert_to_sixty_two_base).to eq(["a"])
  		short_url2 = ShortUrl.create(original_url: "google.com")
  		expect(short_url2.convert_to_sixty_two_base).to eq(["b"])
  	end
  end
end