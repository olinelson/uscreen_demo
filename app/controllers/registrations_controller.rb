class RegistrationsController < ApplicationController
  allow_unauthenticated_access
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_registration_url, alert: "Try again later." }


  # GET /registrations/new
  def new
    redirect_to after_authentication_url if authenticated?
    @user = User.new
    @price_id = params[:price_id]
  end

  def create
    @user = User.new(user_params)

    if @user.save
      start_new_session_for @user
      return redirect_to after_authentication_url
    end

    respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream do
                  render turbo_stream: turbo_stream.replace(
                    "registration_form",
                    partial: "registrations/form",
                    locals: { user: @user }
                  )
        end
    end
  end

  private

  def user_params
    params.expect(user: [ :name, :email_address, :password ])
  end
end
