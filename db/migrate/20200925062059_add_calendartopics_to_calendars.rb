class AddCalendartopicsToCalendars < ActiveRecord::Migration[5.2]
  def change
    add_column :calendars, :image, :string
  end
end
