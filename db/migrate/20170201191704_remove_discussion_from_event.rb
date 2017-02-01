class RemoveDiscussionFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :discussion, :string
  end
end
