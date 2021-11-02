module Types
  class Credential < Types::BaseObject
    field :uid, String, null: false
    field :client, String, null: false
    field :access_token, String, null: false
    field :token_type, String, null: false
    field :expiry, Integer, null: false
  end
end
