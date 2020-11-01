class CommentsController < ApplicationController
    before_action :set_video
    before_action :set_video_comment, only: [:show, :update, :destroy]
  
    # GET /videos/:video_id/comments
    def index
      json_response(@video.comments)
    end
  
    # GET /videos/:video_id/comments/:id
    def show
      json_response(@comment)
    end
  
    # POST /videos/:video_id/comments
    def create
      @video.comments.create!(comment_params)
      json_response(@video, :created)
    end
  
    # PUT /videos/:video_id/comments/:id
    def update
      @comment.update(comment_params)
      head :no_content
    end
  
    # DELETE /videos/:video_id/comments/:id
    def destroy
      @comment.destroy
      head :no_content
    end
  
    private
  
    def comment_params
      params.permit(:text, :done)
    end
  
    def set_video
      @video = Video.find(params[:video_id])
    end
  
    def set_video_comment
      @comment = @video.comments.find_by!(id: params[:id]) if @video
    end
  end