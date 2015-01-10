class ConditionRole < ActiveRecord::Base
  belongs_to :condition
  belongs_to :role

end
