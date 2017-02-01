class AddDiscussionToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :discussion, :string
  end
end
