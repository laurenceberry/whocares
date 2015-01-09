class Profession < ActiveRecord::Base
  has_many :roles
  validates :name, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Profession.create!(row.to_hash) unless Profession.find_by(name:  row.to_hash['name'])
    end
  end
end

