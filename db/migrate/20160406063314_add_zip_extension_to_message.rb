class AddZipExtensionToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :zip_extension, :string
  end
end
