require "rails_helper"

RSpec.describe "repositories/index" do
  it "displays all the repositories" do
    assign(:repositories, [])

    render

    expect(rendered).to match /Repositories/
  end
end
