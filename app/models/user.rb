class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_many :wikis
  before_save { self.email = email.downcase if email.present? }
  before_save { self.role ||= :standard }

  # validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :role,
             presence: true

  enum role: [:standard, :admin, :premium]
end
