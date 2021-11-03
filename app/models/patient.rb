class Patient < ApplicationRecord
  # Validates
  validates :full_name, length: { minimum: 3, maximum: 100 }
  validates :birthdate, presence: true
  validates :journey_step, length: { minimum: 3, maximum: 100 }
  validates :cancer, length: { minimum: 3, maximum: 100 }
  validate  :check_birthdate

  # Scopes

  add_scope :search do |query|
    where('full_name like :query or cancer like :query', query: "%#{query}%") if query.present?
  end

  private

  def check_birthdate
    return if birthdate.blank? || birthdate <= Date.today
    errors.add(:birthdate, I18n.t('errors.messages.less_than_or_equal_to', count: Date.today))
  end
end
