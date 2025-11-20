class MaterialReview < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :material_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true }
  validates :description, presence: true
  validates :score, presence: true

  belongs_to :user

  scope :valid, -> { where(is_deleted: false) }
end
