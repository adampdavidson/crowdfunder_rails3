class Pledge < ActiveRecord::Base
  attr_accessible :amount, :user_id

  validates :user, :project, presence: true
  validates :amount, numericality: {greater_than: 0}

  belongs_to :user
  belongs_to :project
end
