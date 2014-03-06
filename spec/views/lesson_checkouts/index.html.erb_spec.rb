require 'spec_helper'

describe "lesson_checkouts/index" do
  before(:each) do
    assign(:lesson_checkouts, [
      stub_model(LessonCheckout),
      stub_model(LessonCheckout)
    ])
  end

  it "renders a list of lesson_checkouts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
