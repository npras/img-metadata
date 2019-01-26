require 'sinatra'

get '/' do
  erb :index
end

post '/upload' do
  @filename = params[:file][:filename]
  puts "^^ #{?# * 90}" #DEBUG
  p @filename
  puts "$$ #{?# * 90}" #DEBUG
  file = params[:file][:tempfile]
  puts "^^ #{?# * 90}" #DEBUG
  p file
  puts "$$ #{?# * 90}" #DEBUG

  Dir.mkdir('./public') unless Dir.exists?('public')
  File.open("./public/#{@filename}", 'wb') do |f|
    f.write(file.read)
  end

  @img_metadata = `convert #{File.join('./public', @filename)} json:`
  #erb :index
end
