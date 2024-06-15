module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_story, only: [:create, :index]
      before_action :authenticate_user, only: [:create, :destroy]
      def create
        @comment = @story.comments.new(comment_params.merge(user: current_user))
      
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def index
        @pagination, @comments = paginate(@story.comments)
        render json: { comments: @comments, pagination: @pagination}
      end

      def destroy
        @comment = current_user.comments.find(params[:id])

        @comment.destroy
        head :no_content
      end

      private
      def comment_params
        params.require(:comment).permit(:story_id, :body)
      end

      def set_story
        @story = Story.find(params[:story_id])
      end

      def authenticate_user
        head :unauthorized unless current_user
      end
    end
  end
end