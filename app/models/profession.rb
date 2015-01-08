class Profession < ActiveRecord::Base
  has_many :roles
  validates :description, presence: true
  validates :description, presence: true,
                    length: { minimum: 5 }
end

