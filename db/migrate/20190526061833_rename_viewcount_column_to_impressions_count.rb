class RenameViewcountColumnToImpressionsCount < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :view_count, :impressions_count
  end
end
