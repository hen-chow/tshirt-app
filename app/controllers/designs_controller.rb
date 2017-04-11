class DesignsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def create
    design = Design.new(clean_params.merge(user_id: session[:user_id], predesign: false))

    if design.save
      render json: design
    else
      render json: {}, status: :bad_request
    end
  end

  private

  def clean_params
    params.require(:design).permit(:name, :length, :width, :img_src)
  end

end
