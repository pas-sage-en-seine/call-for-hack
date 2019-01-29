class AddColumnDurationToProposal < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :duration, :string
  end
end
