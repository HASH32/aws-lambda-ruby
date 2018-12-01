require 'json'
require 'aws-record'
require 'securerandom'

class User
  include Aws::Record

  set_table_name ENV['DYNAMODB_TABLE']

  string_attr :id, hash_key: true
  string_attr :name
  integer_attr :age
end

def create(event:, context:)
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

def show(event:, context:)
  user = User.find(id: event['pathParameters']['id'])

  {
    statusCode: 200,
    body: JSON.generate(user.to_h)
  }
end
