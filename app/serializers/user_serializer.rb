class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :email_confirmed

  attribute :messages do |object|
    object.messages.as_json
  end

end
