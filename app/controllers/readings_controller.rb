require 'will_paginate/array'

class ReadingsController < ApplicationController
  before_action :set_all_readings, only: [:index, :data]
  before_action :set_reading, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def calculate_cost
    if @all_readings == nil
      cost = nil
    elsif @all_readings.length == 1
      cost = [0]
    else
      cost = @all_readings.each_cons(2).map { |a,b| (b.reading-a.reading) * 0.28 }.unshift(0)
    end
  end

  def data
  end

  # GET /readings
  # GET /readings.json
  def index
    @some_readings = @all_readings.paginate(:page => params[:page], :per_page => 5)
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

    def set_all_readings
      @all_readings = current_user.readings.order(reading_date: :asc)
      @all_readings = @all_readings.zip(calculate_cost)
    end
end
