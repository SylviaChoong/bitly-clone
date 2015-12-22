#controller file
get '/' do
	@urls = Url.all
  	erb :"static/index"
end

post '/urls' do
	# create a new Url
	@url = Url.create(long_url: params[:long_url])
	redirect '/'
	# erb :"models/url"# or redirect to '/'
end

get '/:short' do
	# redirect to appropriate "long" URL
	url = Url.find_by(short_url: params[:short])
	# url.click_count += 1
	# url.save
	redirect url.long_url
end