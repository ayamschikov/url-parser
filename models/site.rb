# frozen_string_literal: true

class Site < Sequel::Model
  plugin :validation_helpers

  def validate
    validates_integer :status
    validates_presence %i[title url status]
  end
end
