class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
                    
  # パスワード: 最低6文字 + 英大文字/英小文字/数字をそれぞれ1文字以上含む
  validates :password,
            length: { minimum: 6 },
            format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+\z/, message: "は英大文字・英小文字・数字を各1文字以上含めてください" },
            presence: true
  validates :github_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true }
  validates :introduction, length: { maximum: 500 }, allow_blank: true

  # サインイン回数をインクリメント
  def increment_sign_in!
    update!(sign_in_count: sign_in_count + 1, last_sign_in_at: Time.zone.now)
  end
end
