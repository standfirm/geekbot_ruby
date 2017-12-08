require 'hashie'

module Geekbot
  class Standup < ::Hashie::Mash
    include ::Hashie::Extensions::Coercion

    coerce_key :users, Array[User]
    coerce_key :questions, Array[Question]
  end
end