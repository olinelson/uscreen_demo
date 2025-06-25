class OffersController < ApplicationController
  before_action :set_offer, only: %i[ show edit update destroy ]

  # GET /offers
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      return redirect_to @offer, notice: "Offer was successfully created."
    end
    respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream do
                  render turbo_stream: turbo_stream.replace(
                    "offer_form",
                    partial: "offers/form",
                    locals: { offer: @offer }
                  )
        end
    end
  end

  # PATCH/PUT /offers/1
  def update
    if @offer.update(offer_params)
      redirect_to @offer, notice: "Offer was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /offers/1
  def destroy
    @offer.destroy!
    redirect_to offers_path, notice: "Offer was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def offer_params
      params.expect(offer: [ :user_id, :title, :subtitle, :description, video_ids: [] ])
    end
end
