module Queries
  class Patients::List < Queries::BaseQuery
    argument :page,     Int,    required: false
    argument :per_page, Int,    required: false
    argument :query,    String, required: false

    type Types::Patient.connection_type, null: false

    def call(params)
      Patient.search(params[:query])
             .order(:full_name)
             .paginate(page: params[:page], per_page: params[:per_page])
    end
  end
end
