class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:name]

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  # フォロー取得
  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォロワー取得
  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 自分がフォローしている人
  has_many :following_user, through: :active_relationships, source: :followed
  # 自分をフォローしている人
  has_many :follower_user, through: :passive_relationships, source: :follower

  attachment :profile_image

  validates :name, presence: true, length: {in: 2..20}
  validates :introduction, length: {maximum: 50}

  # ユーザーをフォローする
  def follow(user_id)
    active_relationships.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    active_relationships.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end


  #usernameを利用してログインするようにオーバーライド
  # def self.find_first_by_auth_conditions(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     #認証の条件式を変更する
  #     where(conditions).where(["name = :value", { :value => name }]).first
  #   else
  #     where(conditions).first
  #   end
  # end

  #emailを不要とする
  # def email_required?
  #   false
  # end

  # def email_changed?
  #   false
  # end
end
