require 'data_mapper'
require 'dm-postgres-adapter'
require 'data_mapper_setup.rb'

class Link

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String

end


