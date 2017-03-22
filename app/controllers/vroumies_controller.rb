class VroumiesController < ApplicationController
  before_action :set_vroumy, only: [:show, :edit, :update, :destroy]

  # GET /vroumies
  # GET /vroumies.json
  def index
    @vroumies = Vroumy.all
  end

  # GET /vroumies/1
  # GET /vroumies/1.json
  def show
  end

  # GET /vroumies/new
  def new
    @vroumy = Vroumy.new
  end

  # GET /vroumies/1/edit
  def edit
  end

  # POST /vroumies
  # POST /vroumies.json
  def create
    @vroumy = Vroumy.new(vroumy_params)

    respond_to do |format|
      if @vroumy.save
        format.html { redirect_to @vroumy, notice: 'Vroumy was successfully created.' }
        format.json { render :show, status: :created, location: @vroumy }
      else
        format.html { render :new }
        format.json { render json: @vroumy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vroumies/1
  # PATCH/PUT /vroumies/1.json
  def update
    respond_to do |format|
      if @vroumy.update(vroumy_params)
        format.html { redirect_to @vroumy, notice: 'Vroumy was successfully updated.' }
        format.json { render :show, status: :ok, location: @vroumy }
      else
        format.html { render :edit }
        format.json { render json: @vroumy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vroumies/1
  # DELETE /vroumies/1.json
  def destroy
    @vroumy.destroy
    respond_to do |format|
      format.html { redirect_to vroumies_url, notice: 'Vroumy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vroumy
      @vroumy = Vroumy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vroumy_params
      params.require(:vroumy).permit(:name)
    end
end
