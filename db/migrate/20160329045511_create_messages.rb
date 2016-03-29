class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      %i[
        first_name
        last_name
        address1
        address2
        city
        zip
        email
        phone
        contents
      ].each { |attr| t.string attr }

      t.timestamps
    end
  end
end
