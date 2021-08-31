require 'open-uri'
require 'nokogiri'

class FiiRanksController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index
  # GET /fii_ranks
  def index
    @fiis = scrap.sort_by {|e| e.cod}
  end

  # # GET /fii_ranks/1
  # def show
  # end

  # # GET /fii_ranks/new
  # def new
  #   @fii_rank = FiiRank.new
  #   authorize @fii_rank
  # end

  # # GET /fii_ranks/1/edit
  # def edit
  # end

  # # POST /fii_ranks
  # def create
  #   @fii_rank = FiiRank.new(fii_rank_params)
  #   authorize @fii_rank
  #   if @fii_rank.save
  #     redirect_to @fii_rank, notice: 'Fii rank was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  # # PATCH/PUT /fii_ranks/1
  # def update
  #   if @fii_rank.update(fii_rank_params)
  #     redirect_to @fii_rank, notice: 'Fii rank was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # # DELETE /fii_ranks/1
  # def destroy
  #   @fii_rank.destroy
  #   redirect_to fii_ranks_url, notice: 'Fii rank was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_fii_rank
    #   @fii_rank = FiiRank.find(params[:id])
    #   authorize @fii_rank
    # end

    # Only allow a trusted parameter "white list" through.
    # def fii_rank_params
    #   params.fetch(:fii_rank, {})
    # end

    def scrap
      url = "https://www.fundsexplorer.com.br/ranking"
      html_file = URI.open(url).read
      html_doc = Nokogiri::HTML(html_file)
      fiis = []
      html_doc.search("tr").collect do |element|
        cod = element.css('td:nth-child(1)').text.strip
        dy = element.css('td:nth-child(12)').text.strip.gsub(",",".").to_f
        vpa = element.css('td:nth-child(19)').text.strip.gsub(",",".").to_f
        if [cod, dy, vpa].all? {|element| element.present? && element != 0}
          fiis << Fii.new(cod: cod,
                          dy: dy,
                          v_vpa: vpa

          )
        end
      end
      return fiis
    end
end
