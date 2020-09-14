# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RepositoriesController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it { should respond_with(200) }
    it { should render_template('index') }
  end
end
