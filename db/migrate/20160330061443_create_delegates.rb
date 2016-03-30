class CreateDelegates < ActiveRecord::Migration
  def change
    create_table :delegates do |t|
      t.string :state
      t.string :name
      t.string :position
      t.string :klass
      t.timestamps
    end
  end
end
