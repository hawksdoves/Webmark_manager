require 'data_mapper'
require 'dm-postgres-adapter'


class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, Text
  property :href, Text

has n, :tags, :through => Resource

end


