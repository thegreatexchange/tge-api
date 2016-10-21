require 'rapid_api/serializer_adapters'

module SerializerAdapters
  class Base < RapidApi::SerializerAdapters::AmsAdapter
    # NOTE: Need to add support for :attributes serialization
    def deserialize_attributes(params, root_key)
      #<ActionController::Parameters
      #{"school"=>{"data"=>{"type"=>"schools", "id"=>"1"}}, "ministry"=>{"data"=>{"type"=>"ministries", "id"=>"1"}}} permitted: false>
      attributes = params.require(:data).require(:attributes)
      relationships = params.require(:data).require(:relationships)
      relationships.keys.each do |attribute|
       attributes["#{attribute}_id"] = relationships[attribute][:data][:id]
      end
      attributes
    end
  end
end
