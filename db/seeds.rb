

require 'csv'

inserts = []
file = File.open('db/urls', 'r') 
file.each do |row| 
    inserts << "('#{row.chomp.tr(',();', '')}', '#{SecureRandom.hex(5)}', NULL, 0, '#{Time.now}', '#{Time.now}')"
   end

sql = "INSERT INTO urls (original_url, shorten_url, user_id, counter, created_at, updated_at) VALUES " + inserts.join(', ')

Url.connection.execute sql