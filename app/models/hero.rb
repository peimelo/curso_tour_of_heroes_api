class Hero < ApplicationRecord
  validates :name, :token, presence: true

  scope :search, ->(term) { where('LOWER(name) LIKE ?', "%#{term.downcase}%") if term.present? }
  scope :sorted_by_name, -> { order(:name) }
end
