class ScreenshotsController < ApplicationController
  before_action :set_screenshot, only: [:show, :edit, :update, :destroy]

  # GET /screenshots
  # GET /screenshots.json
  def index
    @screenshots = Screenshot.all
  end

  # GET /screenshots/1
  # GET /screenshots/1.json
  def show
  end

  skip_before_action :verify_authenticity_token
  def destroy_piece
    piece_id = params[:piece_id]
    Piece.destroy(piece_id)

    #redirect_to action: 'index'
    render json: {}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screenshot
      @screenshot = Screenshot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def screenshot_params
      params.fetch(:screenshot, {})
    end
end
