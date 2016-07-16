

get '/' do
	@urls = Url.all
  @posts = Url.page(params[:page]).order('created_at DESC')
  @msg = session[:error]
  
  erb :"static/index"
  

end

post '/urls' do
	
	@url = Url.new(original_url: params['long_url'])

	if @url.save
		@msg = "Successfully created"	
	else
		@msg = "#{@url.errors.full_messages.join(" ")}"
	end
	@urls = Url.all
	@posts = Url.page(params[:page]).order('created_at DESC')
	session[:error] = @msg

	redirect '/'
end



get '/:shorten_url' do
	@url = Url.find_by(shorten_url: params['shorten_url'])
	@url.click_counter
	@url.save
	redirect  @url.original_url
	
end
