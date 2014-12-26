class AddConfirmableToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email
      add_index :users, :confirmation_token,   :unique => true
      User.update_all(:confirmed_at => Time.now)
    end
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
