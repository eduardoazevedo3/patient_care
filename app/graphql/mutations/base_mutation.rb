module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    include ActiveSupport::Callbacks

    define_callbacks :resolved

    set_callback :resolved, :before, :authenticate_user!

    def resolve(**args)
      run_callbacks(:resolved) do
        args.present? ? call(args) : call
      end
    end

    private

    def authenticate_user!
      raise GraphqlController::NotAuthorized, I18n.t('devise.failure.unauthenticated') unless current_user
    end

    def current_user
      @current_user ||= context[:current_user]
    end
  end
end
