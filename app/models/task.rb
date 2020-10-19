class Task < ApplicationRecord
  belongs_to :project
  
  validates :name, presence: true, length: { minimum: 3 }
  validates :status, presence: true
  validates :priority, presence: true
  validates :deadline, presence: true

  enum status: { undone: 'undone', performed: 'performed', tested: 'tested', almost_ready: 'almost ready', done: 'done'  }

    
  enum priority: { low: 'low', middle: 'middle', hight: 'hight' }
     
end
