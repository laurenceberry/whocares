class Profession < ActiveRecord::Base
  has_many :roles
  validates :name, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Profession.create! row.to_hash
    end
  end
end

