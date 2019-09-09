class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :tittle, presence: true
end
