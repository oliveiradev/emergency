class Api::V1::OccurrencesController < ApplicationController
  before_action :set_occurrence , only: [:show,:update,:destroy]

  def index
    @occurrences = Occurrence.all
    render json: @occurrences.as_json(only: [:id,:description]) , root: false
  end

  def show
    render json: @occurrence , status: :ok
  end

  def show_geojson
    @occurrences = Occurrence.where(pending: 0)

    render json: prepare_geojson(@occurrences)
  end

  def create
    @occurrence = Occurrence.new(set_params)

    if @occurrence.save
      render nothing: true , status: :created
    else
      render json: @occurrence.errors , status: :bad_request
    end
  end

  def update
    @occurrence.update(set_params)
    render json: @occurrence , status: :ok
  end

  def destroy
    @occurrence.destroy
    render nothing: true , status: :no_content
  end

  private

  def set_occurrence
    @occurrence = Occurrence.find(params[:id])
  end

  def prepare_geojson(occurrences)
    array_json = Array.new
    occurrences.each do |occurence|
      json_response = {}
      json_response["type"] = "Feature"
      json_response["geometry"] =  {
          type: "Point",
          coordinates: [occurence.lng , occurence.lat]
      }
      json_response["properties"] = {
          'title': occurence.description,
          'marker-color': '#FF0000',
          'marker-symbol': 'hospital'
      }
      array_json.push(json_response)
    end
    array_json
  end

  def set_params
    if params[:occurrence].blank?
      params.permit(:description , :pic , :user_id ,:lat ,:lng ,:pending)
    else
      params.require(:occurrence).permit(:description , :pic , :user_id ,:lat ,:lng ,:pending)
    end
  end
end
