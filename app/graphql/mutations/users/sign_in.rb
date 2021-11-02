module Mutations
  class Users::SignIn < Mutations::BaseMutation
    skip_callback :resolved, :before, :authenticate_user!

    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::User, null: true
    field :credential, Types::Credential, null: true

    field :uid, String, null: false
    field :access_token, String, null: false
    field :client, String, null: false

    def call(email:, password:)
      user = User.find_for_authentication(uid: email)
      user = nil unless user&.valid_password?(password)

      raise GraphqlController::NotAuthorized, I18n.t('devise.failure.invalid', authentication_keys: 'email') unless user
      response user
    end

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
