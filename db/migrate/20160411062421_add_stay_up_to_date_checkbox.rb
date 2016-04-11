class AddStayUpToDateCheckbox < ActiveRecord::Migration
  def change
    add_column :messages, :stay_up_to_date, :boolean
  end
end
