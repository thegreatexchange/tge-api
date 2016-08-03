class BaseService

  attr_accessor :user,
                :params,
                :response

  def self.call(params, user=nil)
    service = self.new(params, user)
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

  def initialize(params={}, profile=nil, user=nil)
    self.user     = user
    self.params   = params
    self.response = ServiceResponse.new

    after_initialize
  end

  def after_initialize;

  def call
    raise NotImplementedError
  end

  def add_error(key, message)
    error_key = response.errors[key]
    error_key ||= []
    error_key << message
  end

  def set_data(data)
    response.data = data
  end

end
