class AddColumnDurationToProposal < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :duration, :string
  end
end
