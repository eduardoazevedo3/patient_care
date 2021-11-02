class PatientCareSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  rescue_from(ActiveRecord::RecordInvalid) do |e|
    raise GraphQL::ExecutionError.new(
      'user input error',
      extensions: { errors: e.record.errors }
    )
  end

  rescue_from(ActiveRecord::RecordNotFound) do
    raise GraphQL::ExecutionError.new(
      'record not found',
      extensions: { errors: ['page not found'] }
    )
  end

  rescue_from(GraphqlController::NotAuthorized) do |e|
    raise GraphQL::ExecutionError.new(
      e.message,
      extensions: {
        code: 'unauthorized',
        errors: [e.message]
      }
    )
  end
end
