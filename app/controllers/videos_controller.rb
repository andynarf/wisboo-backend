class VideosController < ApplicationController
    before_action :set_video, only: [:show, :update, :destroy]

    # GET /videos
    def index
      @videos = Video.all
      json_response(@videos)
    end
  
    # POST /videos
    def create
      @video = Video.create!(video_params)
      json_response(@video, :created)
    end
  
    # GET /videos/:id
    def show
      json_response(@video)
    end
  
    # PUT /videos/:id
    def update
      @video.update(video_params)
      head :no_content
    end
  
    # DELETE /videos/:id
    def destroy
      @video.destroy
      head :no_content
    end
  
    private
  
    def video_params
      # whitelist params
      params.permit( :videoid, :title, :color)
    end
  
    def set_video
      @video = Video.find(params[:id])
    end
  end

