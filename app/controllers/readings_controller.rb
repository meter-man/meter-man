class ReadingsController < ApplicationController
  before_action :set_reading, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def calculate_cost
    if @readings == nil
      cost = nil
    elsif @readings.length == 1
      cost = [0]
    else
      cost = @readings.each_cons(2).map { |a,b| (b.reading-a.reading) * 0.28 }.unshift(0)
    end
  end

  def data
    @all_readings = current_user.readings.order(reading_date: :asc)
  end

  # GET /readings
  # GET /readings.json
  def index
    @readings = current_user.readings.order(reading_date: :asc).paginate(:page => params[:page], :per_page => 5)
    @cost = calculate_cost
  end

  # GET /readings/1
  # GET /readings/1.json
  def show
  end

  # GET /readings/new
  def new
    @reading = current_user.readings.build
  end

  # GET /readings/1/edit
  def edit
  end

  # POST /readings
  # POST /readings.json
  def create
    # @new_params = reading_params.merge(:cost => Reading.cost_calculation(current_user, params['reading']['reading']))
    @reading = current_user.readings.build(reading_params)
    respond_to do |format|
      if @reading.save
        format.html { redirect_to @reading, notice: 'Reading was successfully created.' }
        format.json { render :show, status: :created, location: @reading }
      else
        format.html { render :new }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /readings/1
  # PATCH/PUT /readings/1.json
  def update
    respond_to do |format|
      if @reading.update(reading_params)
        format.html { redirect_to @reading, notice: 'Reading was successfully updated.' }
        format.json { render :show, status: :ok, location: @reading }
      else
        format.html { render :edit }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /readings/1
  # DELETE /readings/1.json
  def destroy
    @reading.destroy
    respond_to do |format|
      format.html { redirect_to readings_url, notice: 'Reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reading_params
      params.require(:reading).permit(:reading, :reading_date)
    end
end
