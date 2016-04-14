class AddHonorificToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :honorific, :integer
  end
end
