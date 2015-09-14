class ConditionRepeatable < ActiveRecord::Base
  belongs_to :condition

  validates :name, presence: true
  validates :content, presence: true
end
