class Role < ActiveRecord::Base
  belongs_to :profession
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      roles = find_by_name(row["name"]) || new
      Role.create!(row.to_hash) unless Role.find_by(name:  row.to_hash['name'])
    end
  end
end
