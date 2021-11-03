module Types
  class Patient < Types::BaseObject
    field :id, ID, null: false
    field :full_name, String, null: false
    field :birthdate, GraphQL::Types::ISO8601Date, null: false
    field :cancer, String, null: false
    field :journey_step, String, null: false
    field :last_active_at, GraphQL::Types::ISO8601DateTime, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
