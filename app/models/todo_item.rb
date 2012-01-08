class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  validates_presence_of :entry, :todo_list
  validate :due_date_future, :if => Proc.new { |a| a.due_date }

  private
  def due_date_future
    if due_date < Date.today
      errors.add(:due_date, "cannot be in the past!")
    end
  end
end
