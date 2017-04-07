class CreateApiClients < ActiveRecord::Migration
  def change
    create_table :<%= config[:table_name] %> do |t|
      t.string :<%= config[:client_id_field] %>, unique: true
      t.string :<%= config[:password_field] %>, unique: true

      t.timestamps null: false
    end
  end
end
