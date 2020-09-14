# frozen_string_literal: true

require 'rails_helper'

describe 'Routing', type: :routing do
  it do
    should route(:get, '/repositories').to(
      controller: :repositories, action: :index
    )
  end
end
