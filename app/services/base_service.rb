class BaseService

  attr_accessor :params,
                :response

  def self.call(params)
    service = self.new(params)
    service.call()
    return service.response
  end

  def self.method_missing(meth, *args, &block)
    if instance_methods.include? meth
      service = self.new(*args)
      service.send(meth)
      return service.response
    else
      super
    end
  end

  def initialize(params={})
    @params   = params
    @response = ServiceResponse.new
    after_initialize
  end

  def after_initialize
  end

  def call
    raise NotImplementedError
  end

  def add_error(key, message)
    error_key = response.errors[key]
    error_key ||= []
    error_key << message
  end

  def return_value(value)
    response.value = value
  end

end
