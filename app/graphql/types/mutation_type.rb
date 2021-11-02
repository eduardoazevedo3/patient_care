module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::Users::SignIn
    field :sign_out, mutation: Mutations::Users::SignOut
  end
end
