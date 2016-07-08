class Encryption

  def self.key_for(attribute)
    return ENV["ENCRYPTION_KEYS.#{attribute.upcase}"] || '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
  end

end
