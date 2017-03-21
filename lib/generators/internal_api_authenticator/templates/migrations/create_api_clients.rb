class CreateApiClients < ActiveRecord::Migration
  def change
    create_table :internal_api_authenticator_api_clients do |t|
      t.string :client_id, unique: true
      t.string :pass_key

      t.timestamps null: false
    end
  end
end
