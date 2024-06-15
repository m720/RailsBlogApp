module Api
  module V1
    class StoriesController < ApplicationController
      def index
        @stories = Story.all
        @stories = @stories.highest_rated if params[:highest_rated]
        @stories = @stories.for_user(params[:user_id]) if params[:user_id]
        @pagination, @stories = paginate(@stories)

        render json: { stories: @stories, pagination: @pagination }
      end

      def show
        @story = Story.find(params[:id])
        render json: @story
      end

      def create
        @story = Story.new(story_params)
        if @story.save
          render :show, status: :created
        else
          render json: @story.errors, status: :unprocessable_entity
        end
      end

      private
      def story_params
        params.require(:story).permit(:title, :body)
      end
    end
  end
end