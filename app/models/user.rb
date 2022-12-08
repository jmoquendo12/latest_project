class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  enum role: { client: 0, admin: 1 }
  belongs_to :parent, class_name: 'user', optional: true
  has_many :addresses
  mount_uploader :image, ImageUploader

end
