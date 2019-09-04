class Task < ApplicationRecord
  belongs_to :list

  def self.to_csv(fields = column_names)
    CSV.generate(headers: true) do |csv|
      csv << fields

      all.each do |task|
        csv << task.attributes.values_at(*fields)
      end
    end
  end
end
