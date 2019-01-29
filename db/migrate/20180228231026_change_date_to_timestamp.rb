class ChangeDateToTimestamp < ActiveRecord::Migration[5.2]
  def change
	change_column :parties, :proposal_from, :timestamp
	change_column :parties, :proposal_to, :timestamp
	change_column :parties, :from, :timestamp
	change_column :parties, :to, :timestamp
  end
end
