class String
  def to_ascii
    bytes.map{|byte| "&\##{byte};"}.join
  end
end