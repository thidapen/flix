class AddColumnsToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :average_stars, :string
  end
end
