class ServiceResponse
  attr_accessor :data, :errors

  def has_errors?
    !errors.empty?
  end

  def data
    @data ||= {}
  end

  def errors
    @errors ||= HashWithIndifferentAccess.new
  end

end
