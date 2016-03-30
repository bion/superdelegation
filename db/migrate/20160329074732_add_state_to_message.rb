class AddStateToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :state, :string, limit: 2
  end
end
