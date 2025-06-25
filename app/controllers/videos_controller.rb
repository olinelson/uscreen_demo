class VideosController < ApplicationController
  before_action :set_video, only: %i[ show edit update destroy ]

  # GET /videos/1 or /videos/1.json
  def show
    authorize! @video
  end

  # GET /videos/new
  def new
    authorize!
    @video = Video.new
    @return_to = params[:return_to]
  end

  # GET /videos/1/edit
  def edit
    authorize! @video
  end

  # POST /videos or /videos.json
  def create
    @video = Video.new(video_create_params)
    authorize! @video
    if @video.save
        return redirect_to params.fetch("return_to", @video), notice: "Video was successfully created."
    end
    respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream do
                  render turbo_stream: turbo_stream.replace(
                    "video_form",
                    partial: "videos/form",
                    locals: { video: @video }
                  )
        end
    end
  end

  # PATCH/PUT /videos/1 or /videos/1.json
  def update
    authorize! @video
    if @video.update(video_update_params)
      redirect_to @video, notice: "Video was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /videos/1 or /videos/1.json
  def destroy
    authorize! @video
    @video.destroy!
    redirect_to Current.user, status: :see_other, notice: "Video was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params.expect(:id))
    end

    def video_create_params
      params.expect(video: [ :title, :description, :user_id, :file ])
    end

    def video_update_params
      params.expect(video: [ :title, :description  ])
    end
end
