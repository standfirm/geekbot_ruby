require 'hashie'

module Geekbot
  class Team < ::Hashie::Mash
    include ::Hashie::Extensions::Coercion

    coerce_key :users, Array[User]
  end
end