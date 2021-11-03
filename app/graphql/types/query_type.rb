module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, resolver: Queries::Users::List
    field :patients, resolver: Queries::Patients::List
  end
end
