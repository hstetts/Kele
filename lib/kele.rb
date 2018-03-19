require 'httparty'

class Kele
  include HTTParty
  base_uri 'https://www.bloc.io/api/v1'
  def initialize(email, password)
    options = {
      body: {
        email: email,
        password: password
      }
    }
    response = self.class.post('/sessions', options)
    @auth_token = response["auth_token"]
    raise "Invalid user credentials"
  end
end
