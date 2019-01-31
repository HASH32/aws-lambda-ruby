require 'json'
require 'securerandom'
require_relative './user_model'

def handler(event:, context:)
  data = JSON.parse(event['body'])

  user = User.new(
    id: SecureRandom.hex,
    name: data['name'],
    age: data['age'],
  )
  user.save!

  {
    statusCode: 200,
    body: JSON.generate(user.to_h)
  }
end
