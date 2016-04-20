get '/' do
  erb :"static/index"
end

post '/urls' do
  url = Url.shorten
  @url_obj = Url.new(long_url: params[:long_url], short_url: url )
  if @url_obj.save
    @url_obj
    erb :"static/index"
  else
    redirect '/invalid'
  end
end

get '/invalid' do
  erb :"static/invalidurl"
end

get '/:short_url' do
  a = Url.all
  b = a.find_by(short_url: params[:short_url])
  count = b.counter.to_i
  count += 1
  b.counter = count
  b.save
  redirect b.long_url
end
