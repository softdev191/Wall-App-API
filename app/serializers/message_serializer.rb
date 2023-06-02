class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attribute :content
end
