class Api::V1::OccurrencesController < ApplicationController
  before_action :set_occurrence , only: [:show,:update,:destroy]

  def index
    @occurrneces = Occurrence.all
    render json: @occurrneces
  end

  def show
  end

  def create
    @occurence = Occurrence.new(set_params)

    if @occurence.save
      render json: '' , status: :created
    else
      render json: @occurence.errors , status: :bad_request
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_occurrence
    @occurence = Occurrence.find(params[:id])
  end

  def set_params
    params.require(:occurrence).permit(:description , :pic , :user_id)
  end
end
