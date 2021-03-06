class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets, :force => true do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
