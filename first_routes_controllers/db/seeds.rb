# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Comment.destroy_all
ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

  
# Users
vincent = User.create!(username: "all_knowing_vincent")
ryan = User.create!(username: "will_climb_rocks")
dean = User.create!(username: "dean_machine")
angela = User.create!(username: "loves_capy")
charlos = User.create!(username: "charlos_gets_buckets")
alissa = User.create!(username: "cow_luva")
joe = User.create!(username: "trader_joes_4lyf3")
walker = User.create!(username: "wakka_wakka")
mike = User.create!(username: "like_mike")
michelle = User.create!(username: "michelle_bell")
claude = User.create!(username: "the_claude_monet")
jen = User.create!(username: "jen_ken_intensifies")
big_company = User.create!(username: "instructors_rock")

# Artwork.destroy_all

#Artworks
artwork1 = Artwork.create!(title: "Blue Skies", image_url: "artwork1@artshare.com", artist_id: claude.id)
artwork2 = Artwork.create!(title: "Water Lilies", image_url: "artwork2@artshare.com", artist_id: claude.id)
artwork3 = Artwork.create!(title: "Starry Night", image_url: "artwork3@artshare.com", artist_id: vincent.id)
artwork4 = Artwork.create!(title: "Water Lilies", image_url: "artwork4@artshare.com", artist_id: angela.id)
artwork5 = Artwork.create!(title: "Girl Reading", image_url: "artwork5@artshare.com", artist_id: angela.id)
artwork6 = Artwork.create!(title: "Untitled No.45", image_url: "artwork6@artshare.com", artist_id: dean.id)
artwork7 = Artwork.create!(title: "Snowy Night", image_url: "artwork7@artshare.com", artist_id: charlos.id)

# ArtworkShare.destroy_all

#ArtworkShare
# Artwork1 + viewers
artwork_share1 = ArtworkShare.create!(viewer_id: joe.id, artwork_id: artwork1.id)
artwork_share2 = ArtworkShare.create!(viewer_id: walker.id, artwork_id: artwork1.id)
artwork_share3 = ArtworkShare.create!(viewer_id: mike.id, artwork_id: artwork1.id)
# Artwork2 + viewers
artwork_share4 = ArtworkShare.create!(viewer_id: joe.id, artwork_id: artwork2.id)
artwork_share5 = ArtworkShare.create!(viewer_id: michelle.id, artwork_id: artwork2.id)
# Artwork3 + viewers
artwork_share4 = ArtworkShare.create!(viewer_id: alissa.id, artwork_id: artwork3.id)
artwork_share5 = ArtworkShare.create!(viewer_id: jen.id, artwork_id: artwork3.id)
# Artwork4 + viewer
artwork_share6 = ArtworkShare.create!(viewer_id: dean.id, artwork_id: artwork4.id)
# Artwork5 + viewer
artwork_share7 = ArtworkShare.create!(viewer_id: ryan.id, artwork_id: artwork5.id)
# Artwork6 + viewer
artwork_share8 = ArtworkShare.create!(viewer_id: michelle.id, artwork_id: artwork6.id)
# Artwork7 + viewer
artwork_share9 = ArtworkShare.create!(viewer_id: angela.id, artwork_id: artwork7.id)

# Comments
comment1 = Comment.create!(author_id: joe.id, artwork_id: artwork1.id, body: "Beautiful work!")
comment2 = Comment.create!(author_id: walker.id, artwork_id: artwork1.id, body: "Beautiful work!!")
comment3 = Comment.create!(author_id: mike.id, artwork_id: artwork1.id, body: "Beautiful work!!!")
# Artwork2 + authors
comment4 = Comment.create!(author_id: joe.id, artwork_id: artwork2.id, body: "Love the colors!")
comment5 = Comment.create!(author_id: michelle.id, artwork_id: artwork2.id, body: "Love the colors!!")
# Artwork3 + authors
comment4 = Comment.create!(author_id: alissa.id, artwork_id: artwork3.id, body: "Great use of brushwork!")
comment5 = Comment.create!(author_id: jen.id, artwork_id: artwork3.id, body: "Great use of brushwork!!")
# Artwork4 + author
comment6 = Comment.create!(author_id: dean.id, artwork_id: artwork4.id, body: "Very serene")
# Artwork5 + author
comment7 = Comment.create!(author_id: ryan.id, artwork_id: artwork5.id, body: "Looks wonderful")
# Artwork6 + author
comment8 = Comment.create!(author_id: michelle.id, artwork_id: artwork6.id, body: "Abstract art")
# Artwork7 + author
comment9 = Comment.create!(author_id: angela.id, artwork_id: artwork7.id, body: "Wish I had snow where I lived")