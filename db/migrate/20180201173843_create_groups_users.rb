class CreateGroupsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :groups_users,id: false do |t|
      t.belongs_to :group , foreign_key: true
      t.belongs_to :user , foreign_key: true
      t.timestamps
    end
  end
end
