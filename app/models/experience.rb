class Experience < ActiveRecord::Base
  belongs_to :profile
  validates :job_title, presence: true, uniqueness: {scope: :company}
  validates :company, presence: true
  validates :start_date, presence: true
  validates :description, presence: true, uniqueness: true
  validate :end_date_greater_than_start_date

  def end_date_greater_than_start_date
    if end_date
      if end_date < start_date
        errors.add(:due_date, "End Date needs to be after Start Date.")
      end
    end
  end
end
