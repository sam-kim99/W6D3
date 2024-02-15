class ArtworksController < ApplicationController
    def index
        incoming_id = params[:user_id]
        user = User.find(incoming_id)
        # render json: Artwork.artworks_for_user_id(incoming_id) + User.find(incoming_id).shared_artworks
        render json: user.artworks + user.shared_artworks
    end

    # http://localhost:3000/users?user[name]=tim&user[email]=tim@tim.com
    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
          render json: artwork
        else
          render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        incoming_id = params[:id]
        artwork = Artwork.find(incoming_id)
        render json: artwork
    end
    
    def update
        incoming_id = params[:id]
        artwork = Artwork.find(incoming_id)

        if artwork && artwork.update(artwork_params)
            redirect_to artwork_url(artwork.id)
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        incoming_id = params[:id]
        artwork = Artwork.find(incoming_id)
        artwork.destroy
        render json: artwork
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url)
    end
end