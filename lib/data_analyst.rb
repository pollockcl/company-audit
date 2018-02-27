require 'csv'
class DataAnalyst
  def self.find_employees(csv)
    CSV.readlines(csv, write_headers: true, headers: [:id, :name, :role, :start_date, :end_date])
  end

  def self.find_projects(csv)
    CSV.readlines(csv, write_headers: true, headers: [:id, :name, :start_date, :end_date])
  end
end
