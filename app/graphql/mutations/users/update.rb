module Mutations
  class Users::Update < Mutations::BaseMutation
    argument :input, Types::UserInput, required: true

    field :user, Types::User, null: true

    def call(input:)
      current_user.update!(input.to_h)
      { user: current_user }
    end
  end
end
