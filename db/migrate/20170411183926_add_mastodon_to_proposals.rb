class AddMastodonToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :mastodon, :string
  end
end
