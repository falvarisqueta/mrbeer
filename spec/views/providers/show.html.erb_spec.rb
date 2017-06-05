require 'spec_helper'

describe "providers/show" do
  before(:each) do
    @provider = assign(:provider, stub_model(Provider))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
