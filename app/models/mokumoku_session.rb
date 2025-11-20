class MokumokuSession < ApplicationRecord
  validates :creator_user_id, presence: true
  validates :title, presence: true
  validates :session_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https])}
  validates :expired_at, presence: true

  belongs_to :user, foreign_key: :creator_user_id

  scope :valid, -> { where(is_deleted: false).where('expired_at > ?', Time.zone.now) }
end
