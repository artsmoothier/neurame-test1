class CreateMixes < ActiveRecord::Migration
  def change
    create_table :mixes do |t|
	  t.string	:user_id
	  t.integer	:level

      t.timestamps
    end
  end
end
