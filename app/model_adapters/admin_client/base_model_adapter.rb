require 'rapid_api/model_adapters'

class AdminClient::BaseModelAdapter < RapidApi::ModelAdapters::ActiveRecordAdapter

  attr_accessor :joins, :includes

  def initialize(klass, options={})
    @klass = klass
    @joins = options[:joins]
    @includes = options[:includes]
  end

  def find_all(params=nil, scope=nil)
    params ||= {}
    scope  ||= {}
    scoped_params = params.merge scope
    collection = klass.includes(@includes).where(scoped_params)
    RapidApi::ModelAdapters::QueryResult.new data: collection
  end

end

