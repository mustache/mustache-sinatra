require 'mustache'

class Layout < Mustache
  def around
    'Around'
  end
end
