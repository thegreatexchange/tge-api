require 'grape-active_model_serializers'

# https://github.com/rails-api/active_model_serializers/blob/master/docs/integrations/ember-and-json-api.md
ActiveModelSerializers.config.adapter       = :json_api
ActiveModelSerializers.config.key_transform = :unaltered
