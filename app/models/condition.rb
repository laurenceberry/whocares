class Condition < ActiveRecord::Base
  has_and_belongs_to_many :roles

  validates :name, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Condition.create!(row.to_hash) unless Condition.find_by(name:  row.to_hash['name'])
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |condition|
        csv << condition.attributes.values_at(*column_names)
      end
    end
  end
end
