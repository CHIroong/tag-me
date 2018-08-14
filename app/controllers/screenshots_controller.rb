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
  def create_piece
    screenshot_id = params[:id]
    screenshot = Screenshot.find(screenshot_id)

    @new_piece = Piece.create(:screenshot_id => screenshot_id, :type_id => 1, :width => params[:width], :height => params[:height], :left => params[:left], :top => params[:top])
    
    render json: {id: @new_piece.id}
  end

  def destroy_piece
    piece_id = params[:piece_id]
    Piece.destroy(piece_id.to_s)

    #redirect_to action: 'index'
    render json: {}
  end

  def export_piece
    @target = Piece.all

    render json: {target: @target}
  end

  def change_type
    piece_id = params[:id]
    @target = Piece.find_by_id(piece_id)
    @target.type_id = params[:type_id]
    @target.save

    render json: {target: @target}
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
