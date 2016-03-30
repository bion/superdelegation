class CreateDelegateMessages < ActiveRecord::Migration
  def change
    create_table :delegate_messages do |t|
      t.belongs_to :message, index: true, null: false
      t.belongs_to :delegate, index: true, null: false
      t.timestamp
    end
  end
end
