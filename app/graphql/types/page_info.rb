class Types::PageInfo < Types::BaseObject
  field :pages, Integer, null: false
  field :current_page, Integer, null: false
  field :per_page, Integer, null: false
  field :total, Integer, null: false
  field :has_next_page, Boolean, null: false
  field :has_previous_page, Boolean, null: false

  def pages
    (total.to_i / per_page).ceil
  end

  def current_page
    object.arguments[:page] || 1
  end

  def per_page
    limit = object.arguments[:per_page] || 30
    limit.between?(1, 100) ? limit : 100
  end

  def total
    @total ||= object.items.unscope(:select, :limit, :offset).count
  end

  def has_next_page # rubocop:disable Naming/PredicateName
    pages > current_page
  end

  def has_previous_page # rubocop:disable Naming/PredicateName
    current_page > 1
  end
end
