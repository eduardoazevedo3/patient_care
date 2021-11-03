module Mutations
  class Users::Create < Mutations::BaseMutation
    skip_callback :resolved, :before, :authenticate_user!

    argument :input, Types::UserInput, required: true

    field :user, Types::User, null: true
    field :credential, Types::Credential, null: true

    def call(input:)
      user = User.new(input.to_h)
      user.save!
      response(user)
    end

    private

    def response(user)
      credential = user.create_new_auth_token
      {
        user: user,
        credential: {
          uid: credential['uid'],
          client: credential['client'],
          access_token: credential['access-token'],
          token_type: credential['token-type'],
          expiry: credential['expiry']
        }
      }
    end
  end
end
