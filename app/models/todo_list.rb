class TodoList < ActiveRecord::Base
  #NOTE: sqlite3 doesn't support nulls last, so I can't do cool things :(
  has_many :todo_items, :order => "complete ASC, due_date DESC"
  validates_presence_of :title

  def clean_up
    todo_items.each do |item|
      if item.complete
        item.destroy
      end
    end
  end
end
