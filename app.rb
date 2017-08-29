require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'sinatra/partial'
require 'escape_utils'
require 'sinatra/basic_auth'

if development?
  require 'sinatra/reloader'
  also_reload './config/config.rb'
  also_reload './models.rb'
end

require './config/config.rb'
require './models.rb'

# Controllers

get '/' do
  @entries = Entry.all(:vote_score.gte => 0, order: [:vote_score.desc])
  @buried_entries = Entry.all(:vote_score.lt => 0, order: [:vote_score.desc])

  erb :index
end

post '/entry' do
  entry = Entry.create(text: EscapeUtils.escape_html(params[:entry]))
  redirect back unless entry.saved?

  entry.vote
  redirect to "/#entry-#{entry.id}"
end

post '/entry/:id/vote' do
  entry = Entry.get! params[:id]
  entry.vote(params[:up] != 'false')

  partial(:vote_box, locals: { entry: entry })
end

get '/entry/:id' do
  @entry = Entry.get! params[:id]
  erb :entry
end

# Admin Area

protect do
  get '/admin' do
    @entries = Entry.page(
      params[:page],
      per_page: 15,
      order: [((params[:order].nil? || params[:order].empty?) ? :vote_score : params[:order].to_sym).desc, :created_at.desc]
    )
    erb :admin, layout: false
  end

  post '/admin/remove_entry' do
    Entry.get!(params[:entry_id]).destroy
    redirect to "/admin?order=#{params[:order]}&page=#{params[:page]}"
  end
end
