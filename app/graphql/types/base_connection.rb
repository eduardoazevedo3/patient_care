module Types
  class BaseConnection < Types::BaseObject
    include GraphQL::Types::Relay::ConnectionBehaviors

    field :page_info, Types::PageInfo, null: false
  end
end
