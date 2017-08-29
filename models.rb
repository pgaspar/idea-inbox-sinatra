require 'data_mapper'
require 'dm-pager'
require 'dm-validations'
require 'dm-constraints'
require 'dm-types'

DataMapper.setup(:default, "sqlite://#{Dir.pwd}/development.db")

class Entry
  include DataMapper::Resource

  property :id, Serial
  property :text, Text, length: 1..300, lazy: false

  property :vote_count,      Integer, default: 0
  property :up_vote_count,   Integer, default: 0
  property :down_vote_count, Integer, default: 0
  property :vote_score,      Integer, default: 0, index: true

  property :created_at,   DateTime, index: true
  property :update_at,    DateTime

  def vote(up = true)
    self.vote_count      += 1
    self.up_vote_count   += 1 if up
    self.down_vote_count += 1 unless up
    self.vote_score = self.up_vote_count - self.down_vote_count
    save
  end
end

DataMapper.finalize
DataMapper.auto_upgrade!
