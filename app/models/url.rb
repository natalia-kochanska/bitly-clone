class Url < ActiveRecord::Base

validates :original_url, format: {with: (URI::regexp(['http', 'https'])), message: "Format is incorrect"}
validates :original_url, uniqueness: {case_sensitive: false, message: "This URL already exists"}
before_create :shorten

	def shorten
		self.shorten_url = SecureRandom.hex(5)
	end

	def click_counter
		self.counter += 1
	end
end
