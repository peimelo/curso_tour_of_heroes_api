class Hero < ApplicationRecord
  validates :name, :token, presence: true
  validates :name, uniqueness: { scope: :token, case_sensitive: false }

  scope :by_token, ->(token) { where(token: token) }
  scope :search, ->(term) { where('LOWER(name) LIKE ?', "%#{term.downcase}%") if term.present? }
  scope :sorted_by_name, -> { order(:name) }
end
