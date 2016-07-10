class CreatorsController < ApplicationController
  before_action :set_creator, only: [:show, :update, :destroy]

  # validates :search do 
  #   any :conditions, required: true, strong: true
  #   object :conditions do
  #     string :birth_day, body: "6/1 -> 06-01" do |value|
  #       value =~  /(0?[1-9]|1[012])-(0?[1-9]|([1-3][0-9]))/
  #     end
  #     string :death_year
  #     string :expired_year
  #   end
  # end

  # GET /creators
  def index
    @creators = Creator.all

    render json: @creators
  end

  # GET /creators/1
  def show
    render json: @creator
  end

  # POST /creators
  def create
    @creator = Creator.new(creator_params)
    if @creator.save
      render json: @creator, status: :created, location: @creator
    else
      render json: @creator.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /creators/1
  def update
    if @creator.update(creator_params)
      render json: @creator
    else
      render json: @creator.errors, status: :unprocessable_entity
    end
  end

  # DELETE /creators/1
  def destroy
    @creator.destroy
  end

  # GET /creators/search
  def search
    render_400 unless search_params.keys.count == 1
    #binding.pry
    @creators = Creator.search(search_params)
    render json: @creators
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creator
      @creator = Creator.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def creator_params
      params.require(:creator).permit(:screen_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :image_url, :wiki_url, :birth_date, :death_date)
    end

    # Only allow a trusted parameter "white list" through.
    def search_params
      params.require(:conditions).permit(:birth_day, :death_year, :expired_year)
    end
end
