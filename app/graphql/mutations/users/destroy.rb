module Mutations
  class Users::Destroy < Mutations::BaseMutation
    field :user, Types::User, null: true

    def call
      Thread.new { current_user.destroy! }
      { user: current_user }
    end
  end
end
