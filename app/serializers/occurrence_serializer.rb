class OccurrenceSerializer < ActiveModel::Serializer
  attributes :id , :description , :pic , :pending , :created_at , :updated_at

  def pic
    object.pic.url
  end
end
