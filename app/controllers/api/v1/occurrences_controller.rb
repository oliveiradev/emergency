class Api::V1::OccurrencesController < ApplicationController
  before_action :set_occurrence , only: [:show,:update,:destroy]

  def index
    @occurrences = Occurrence.all
    render json: @occurrences
  end

  def show
    render json: @occurence
  end

  def show_geojson
    @occurrences = Occurrence.where(pending: 0)

    render json: prepare_geojson(@occurrences)
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
    params.require(:occurrence).permit(:description , :pic , :user_id)
  end
end
