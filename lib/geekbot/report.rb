require 'hashie'

module Geekbot
  class Report < ::Hashie::Mash
    include ::Hashie::Extensions::Coercion

    coerce_key :member, User
    coerce_key :questions, Array[Question]
  end
end