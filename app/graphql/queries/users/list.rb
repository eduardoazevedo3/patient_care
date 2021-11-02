module Queries
  class Users::List < Queries::BaseQuery
    argument :page,     Int,    required: false
    argument :per_page, Int,    required: false
    argument :query,    String, required: false

    type Types::User.connection_type, null: false

    def call(params)
      User.search(params[:query])
          .order(:full_name)
          .paginate(page: params[:page], per_page: params[:per_page])
    end
  end
end
