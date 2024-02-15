# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  viewer_id  :bigint           not null
#  artwork_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
    # validates :viewer_id, :artwork_id, presence: true
    # if you reference it in a belongs_to then it has an automatic validates presence: true
    validates :viewer_id, uniqueness: {scope: :artwork_id}

    belongs_to :viewer,
        class_name: :User,
        primary_key: :id,
        foreign_key: :viewer_id

    belongs_to :artwork,
        class_name: :Artwork,
        primary_key: :id,
        foreign_key: :artwork_id

end
