require 'rapid_api/serializer_adapters'

module SerializerAdapters
  class Base < RapidApi::SerializerAdapters::AmsAdapter

    def serialize_collection(collection)
      collection_serializer = ActiveModel::Serializer::CollectionSerializer.new collection, {
                           serializer: klass
                         }
      ActiveModelSerializers::Adapter.create(collection_serializer).to_json
    end


    def deserialize_attributes(params, root_key)
      attributes = params
      if params[:data][:attributes].present?
        attributes = params.require(:data).require(:attributes)
      end
      if params[:data][:relationships].present?
        relationships = params.require(:data).require(:relationships)
        relationships.keys.each do |attribute|
         attributes["#{attribute}_id"] = relationships[attribute][:data].try(:[], :id)
        end
      end
      attributes
    end
  end
end
