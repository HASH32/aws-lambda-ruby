require 'json'
require 'securerandom'
require_relative './user_model'

def handler(event:, context:)
  user = User.find(id: event['pathParameters']['id'])

  {
    statusCode: 200,
    body: JSON.generate(user.to_h)
  }
end
