class Encryption

  def self.key_for(attribute)
    return ENV["ENCRYPTION_KEYS_#{attribute.upcase}"] || '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
  end

end
