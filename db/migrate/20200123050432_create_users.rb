class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :email_address, :null => false
      t.string :profile
      t.string :twitter_address
      t.string :skype_id
      t.string :discord_id

      t.timestamps
    end
  end
end
