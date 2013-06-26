class KeywordsController < ApplicationController
  before_action :set_campaign
  before_action :set_keyword, only: [:show, :edit, :update, :destroy, :reject]

  def index
    @keywords = @campaign.keywords.where(accepted: true)
  end
  
  def reject
    @keyword.update_attribute(:accepted, false)
    respond_to do |format|
      format.html { redirect_to campaign_keywords_url(@campaign) }
      format.json { head :no_content }
      format.js { head :no_content }
    end
  end

  def destroy
    @keyword.destroy
    respond_to do |format|
      format.html { redirect_to campaign_keywords_url(@campaign) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyword
      @keyword = @campaign.keywords.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keyword_params
      params.require(:keyword).permit(:name, :cost_per_click, :clicks_per_day, :campaign_id)
    end
end
