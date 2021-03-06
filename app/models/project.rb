class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  
  validates :name, presence: true, length: { minimum: 3 }
  validates :user, presence: true
end
