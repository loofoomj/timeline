class CreateJoses < ActiveRecord::Migration
  def change
    create_table :joses do |t|
    	t.string	:name
    	t.integer	:weight
    	t.string	:status

      t.timestamps
    end
  end
end
