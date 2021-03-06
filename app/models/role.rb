class Role < ActiveRecord::Base
  belongs_to :profession
  has_and_belongs_to_many :conditions
  has_and_belongs_to_many :jobs
  has_many :suggestions

  def self.search(search)
    where("LOWER(name) @@ ? OR description @@ ? OR LOWER(search_tags) @@ ?", "#{search.downcase}","#{search}","#{search.downcase}")
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      roles = find_by_name(row["name"]) || new
      Role.create!(row.to_hash) unless Role.find_by(name:  row.to_hash['name'])
      Role.find_by(name:  row.to_hash['name']).update!(row.to_hash)
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |role|
        csv << role.attributes.values_at(*column_names)
      end
    end
  end
end
