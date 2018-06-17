class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :password_digest
      t.boolean :admin, :default => false
      t.boolean :approved_student, :default => false

      t.timestamps
    end
  end
end
