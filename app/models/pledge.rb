class Pledge < ActiveRecord::Base
  attr_accessible :amount, :user_id, :project_id

  validates :user_id, :project_id, presence: true
  validates :amount, numericality: {greater_than: 0}

  belongs_to :user
  belongs_to :project
end
