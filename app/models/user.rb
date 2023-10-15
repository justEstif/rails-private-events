class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { minimum: 3 }

  has_many :created_events, class_name: "Event", foreign_key: "creator_id"
  has_many :tickets
  has_many :attended_events, through: :tickets, source: :event
end
