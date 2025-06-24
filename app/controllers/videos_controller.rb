class VideosController < ApplicationController
  before_action :set_video, only: %i[ show edit update destroy ]

  # GET /videos or /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1 or /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos or /videos.json
  def create
    @video = Video.new(video_params)
    if @video.save
        redirect_to @video, notice: "Video was successfully created."
    else
        render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /videos/1 or /videos/1.json
  def update
    if @video.update(video_params)
      redirect_to @video, notice: "Video was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /videos/1 or /videos/1.json
  def destroy
    @video.destroy!
    redirect_to videos_path, status: :see_other, notice: "Video was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.expect(video: [ :title, :description, :user_id, :file ])
    end
end
