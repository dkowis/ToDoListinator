class TodoItem < ActiveRecord::Base
  includes Comparable

  belongs_to :todo_list
  validates_presence_of :entry, :todo_list
  validate :due_date_future, :on => :create, :if => Proc.new{ |a| a.due_date }

  def <=>(other)
    if other.due_date and due_date
      due_date <=> other.due_date
    elsif !other.due_date and due_date
      -1
    elsif !due_date and other.due_date
      1
    else
      id <=> other.id
    end
  end


  private
  def due_date_future
    if due_date < Date.today
      errors.add(:due_date, "cannot be in the past!")
    end
  end
end
