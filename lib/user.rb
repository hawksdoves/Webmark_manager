require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'


class User
  include DataMapper::Resource

  validates_format_of :email, as: :email_address

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String, format: :email_address, required: true
  property :password_digest, Text

  def password=(password)
  	self.password_digest = BCrypt::Password.create(password)
  end

end

