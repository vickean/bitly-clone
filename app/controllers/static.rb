get '/' do
  erb :"static/index"
end

post '/urls' do
  url = Url.shorten
  @url_obj = Url.create(long_url: params[:long_url], short_url: url )
  erb :"static/index"
end


get '/:short_url' do
  a = Url.all
  b = a.find_by(short_url: params[:short_url])
  redirect "http://" + b.long_url
end