module Mutations
  class Users::SignOut < Mutations::BaseMutation
    field :success, Boolean, null: false

    def call
      client = context[:request].headers['client']
      current_user.tokens.delete(client)
      { success: current_user.save }
    end
  end
end
