class AddMastodonToProposals < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :mastodon, :string
  end
end
