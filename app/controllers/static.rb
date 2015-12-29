#controller file
get '/' do
	@urls = Url.last(5)
  	erb :"static/index"
end

post '/urls' do
	# create a new Url

	url = Url.new(long_url: params[:long_url])
	if url.save
		# redirect '/'
		return "<tr><td><a href='#{url.short_url}''>http://localhost:9393/#{url.short_url}</a></td><td>#{url.click_count}</td></tr>"
	else
		#Think if the error exists at url.rb?, then u can put in here
		@errors = url.errors.full_messages
		@urls = Url.all
	  	url.errors.to_json
	end

	# erb :"models/url"# or redirect to '/'
end

get '/:short' do
	# redirect to appropriate "long" URL
	url = Url.find_by(short_url: params[:short])
	url.click_count += 1
	url.save
	redirect url.long_url
end