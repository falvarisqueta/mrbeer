require 'spec_helper'

describe "providers/index" do
  before(:each) do
    assign(:providers, [
      stub_model(Provider),
      stub_model(Provider)
    ])
  end

  it "renders a list of providers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
