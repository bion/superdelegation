class CreateDelegateMessages < ActiveRecord::Migration
  def change
    create_table :delegate_messages do |t|
      t.integer :message_id, null: false
      t.integer :delegate_id, null: false
      t.boolean :selected, null: false
      t.timestamp
    end
  end
end
