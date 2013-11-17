class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :origin
      t.string :destination
      t.string :transportation_type
      t.string :transportation_id
      t.string :seat
      t.string :extra_information

      t.timestamps
    end
  end
end
