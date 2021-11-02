class Types::PageInfo < Types::BaseObject
  field :pages, Integer, null: false
  field :current_page, Integer, null: false
  field :per_page, Integer, null: false
  field :total, Integer, null: false
  field :has_next_page, Boolean, null: false
  field :has_previous_page, Boolean, null: false

  def pages
    (total.to_f / per_page).ceil
  end

  def current_page
    context.to_h[:current_arguments][:page] || 1
  end

  def per_page
    context.to_h[:current_arguments][:per_page] || 100
  end

  def total
    @total ||= object.items.count
  end

  def has_next_page # rubocop:disable Naming/PredicateName
    (current_page + 1) > pages
  end

  def has_previous_page # rubocop:disable Naming/PredicateName
    current_page.positive?
  end
end
