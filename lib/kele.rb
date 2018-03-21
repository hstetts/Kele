require 'httparty'
require 'json'
require './lib/roadmap'

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
    response = self.class.post("/sessions", options)
    @auth_token = response["auth_token"]
    raise "Invalid user credentials" if response.code != 200
  end

  def get_me
    response = self.class.get("/users/me", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get("/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end
end
