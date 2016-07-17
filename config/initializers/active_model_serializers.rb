require 'active_model_serializers/register_jsonapi_renderer'

#NOTE: https://github.com/rails-api/active_model_serializers/blob/master/docs/integrations/ember-and-json-api.md
ActiveModelSerializers.config.key_transform = :unaltered
ActiveModelSerializers.config.adapter       = :json_api
