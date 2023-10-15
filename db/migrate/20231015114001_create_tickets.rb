class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.belongs_to :attendee, null: false, foreign_key: { to_table: :users }
      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
