class CreateLockRequests < ActiveRecord::Migration
  def change
    create_table :lock_requests do |t|
      t.string :user
      t.boolean :isLocked
      t.boolean :willLock

      t.timestamps
    end
  end
end
