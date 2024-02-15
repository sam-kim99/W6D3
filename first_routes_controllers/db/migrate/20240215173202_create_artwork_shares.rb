class CreateArtworkShares < ActiveRecord::Migration[7.1]
  def change
    create_table :artwork_shares do |t|
      t.references :viewer, null: false, foreign_key: {to_table: :users}, index: false
      t.references :artwork, null: false, foreign_key: {to_table: :artworks}
      t.index [:viewer_id, :artwork_id], unique: true
      t.timestamps
    end
  end
end
