class Job < ActiveRecord::Base
  has_and_belongs_to_many :roles

  validates :title, presence: true

end
