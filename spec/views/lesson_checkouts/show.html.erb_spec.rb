require 'spec_helper'

describe "lesson_checkouts/show" do
  before(:each) do
    @lesson_checkout = assign(:lesson_checkout, stub_model(LessonCheckout))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
