class AddPublicToWiki < ActiveRecord::Migration[5.1]
  def change
    add_column :wikis, :public, :boolean, default: true
  end
end
