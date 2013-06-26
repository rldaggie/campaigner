class SheetsController < ApplicationController
  before_action :set_campaign
  before_action :set_sheet, only: [:show, :edit, :update, :destroy]

  def new
    @sheet = @campaign.sheets.build
  end

  def create
    @sheet = @campaign.sheets.build(sheet_params)

    respond_to do |format|
      if @sheet.save
        format.html { redirect_to campaign_keywords_url(@campaign), notice: 'Sheet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sheet }
      else
        format.html { render action: 'new' }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sheet
      @sheet = @campaign.sheets.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sheet_params
      params.require(:sheet).permit(:spreadsheet, :campaign_id)
    end
end
