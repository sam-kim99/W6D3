class CommentsController < ApplicationController

    def index
        
        if params[:author_id] != nil
            user = User.find(params[:author_id])
            render json: user.comments
        else
            artwork = Artwork.find(params[:artwork_id])
            render json: artwork.comments if artwork
        end

    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
          render json: comment
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        incoming_id = params[:id]
        comment = Comment.find(incoming_id)
        comment.destroy
        render json: comment
    end

    private
    def comment_params
        params.require(:comment).permit(:author_id, :artwork_id, :body)
    end

end