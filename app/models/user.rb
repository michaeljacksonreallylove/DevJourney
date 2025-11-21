class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :name, length: { maximum: 20 }, allow_blank: true
  validates :github_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true }
  validates :introduction, length: { maximum: 300 }, allow_blank: true

  # password が存在する場合にのみ適用（更新時に空ならスキップ）
  # 半角（ASCII printable）文字のみを許容し、大文字・小文字・数字を各1文字以上含むことを要求
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[\x21-\x7E]+\z/, message: "は半角英数字で、英大文字・英小文字・数字を各1文字以上含めてください" }, allow_blank: true
  validates :devjourney_id,
            presence: true,
            length: { maximum: 30 },
            uniqueness: { case_sensitive: false }

  has_many :material_reviews

  scope :valid, -> { where(is_deleted: false) }

  def member_id
    (id * 413).to_s[1, 2] + ((17_674_114 + id) * 3).to_s + (id * 794).to_s[1, 2]
  end

  def profile_page_uri
    "/member/profile/#{member_id}"
  end
end
