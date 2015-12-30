# def activerecord_extensions_mass_insert(validate = true)
#     columns = [:long_url, :short_url, :click_count]
#     values = []
#     5.times do
#         values.push [3, 2, 1]
#     end

#     urls.import columns, values, {:validate => validate}
# end
require_relative '../config/environments/init.rb'

# # migrate urls.txt file into table
values = []
 
File.open('db/urls.txt', 'r').each_line do |url|
	values << url.gsub(/[(,)]/i, '').chomp
end

Url.transaction do
	values.each do |x|
		b = SecureRandom.hex(3)
		Url.connection.execute "INSERT INTO urls (long_url, short_url, created_at, updated_at)
		VALUES ('#{x}','http://localhost:9393/#{b}','#{Time.now}','#{Time.now}');"
	end
end

# Url.transaction do
# 	#change short_url column to http://localhost:9393/ in front of short_url
# 	Url.connection.execute "UPDATE urls
# 	SET short_url = 'http://localhost:9393/' + short_url
# 	WHERE short_url = short_url;"
# end