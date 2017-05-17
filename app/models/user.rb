require_relative '../data_mapper_setup'
require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, format: :email_address, required: true
  property :username, String
  property :password_digest, Text

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    first(email: email)
  end

end
