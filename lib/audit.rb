class Audit
  def initialize
    @company = nil
  end

  def load_company(company)
    @company = company
  end

  def were_invalid_days_worked
    @company.timesheets.map do |sheet|
      <<~HEREDOC
      project: #{@company.find_project_by_id(sheet.project_id)}
      employee: #{@company.find_employee_by_id(sheet.employee_id)}
      valid_date: #{valid_dates?(sheet.date, @@company.find_project_by_id(sheet.project_id)}

      HEREDOC
    end
  end

  def valid_dates?(date, project)
    date
  end
end