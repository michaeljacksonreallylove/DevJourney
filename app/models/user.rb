class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, length: { maximum: 50 }, allow_blank: true
  validates :github_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true }
  validates :introduction, length: { maximum: 500 }, allow_blank: true

  # password が存在する場合にのみ適用（更新時に空ならスキップ）
  # 半角（ASCII printable）文字のみを許容し、大文字・小文字・数字を各1文字以上含むことを要求
  # ASCII printableの範囲は0x21(!) - 0x7E(~)。空白（0x20）は除外。
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[\x21-\x7E]+\z/, message: "は半角英数字で、英大文字・英小文字・数字を各1文字以上含めてください" }, allow_blank: true

  validates :devjourney_id,
            presence: { on: :create },
            length: { maximum: 30 },
            uniqueness: { case_sensitive: false }
end
