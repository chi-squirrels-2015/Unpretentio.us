class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string     :uid,  primary: true 
      t.references :user, index: true
      t.string     :origin

      t.timestamps
    end
  end
end
