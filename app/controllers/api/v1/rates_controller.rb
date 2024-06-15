module Api
  module V1
    class RatesController < ApplicationController
      before_action :set_story, only: [:create]
      def create
        @rate = Rate.new(rate_params)
        if @rate.save
          render json: @rate, status: :created
        else
          render json: @rate.errors, status: :unprocessable_entity
        end
      end

      private
      def rate_params
        params.require(:rate).permit(:rate_value, :user_id, :story_id)
      end

      def set_story
        @story = Story.find(params[:story_id])
      end
    end
  end
end