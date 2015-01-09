class Role < ActiveRecord::Base
  belongs_to :profession
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Role.create! row.to_hash
    end
  end
end
