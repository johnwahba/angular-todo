require 'securerandom'
class User < ActiveRecord::Base
  has_secure_password
  has_many :todos

  def set_session_token
    self.session_token = SecureRandom.urlsafe_base64
    save
  end

  def set_api_key
    self.api_key = SecureRandom.urlsafe_base64
    save
  end

end
