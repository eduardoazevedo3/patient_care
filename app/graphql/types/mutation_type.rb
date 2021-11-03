module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::Users::SignIn
    field :sign_out, mutation: Mutations::Users::SignOut
    field :create_user, mutation: Mutations::Users::Create
    field :update_user, mutation: Mutations::Users::Update
    field :destroy_user, mutation: Mutations::Users::Destroy
  end
end
