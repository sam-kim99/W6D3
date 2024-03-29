# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :artist_id, uniqueness: {scope: :title}

    belongs_to :artist,
        class_name: :User,
        primary_key: :id,
        foreign_key: :artist_id

    has_many :artwork_shares,
        class_name: :ArtworkShare,
        primary_key: :id,
        foreign_key: :artwork_id,
        dependent: :destroy

    has_many :comments,
        class_name: :Comment,
        primary_key: :id,
        foreign_key: :artwork_id,
        dependent: :destroy
        
    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer
    
    def self.artworks_for_user_id(user_id)
        where(artist_id: user_id)
    end
end
