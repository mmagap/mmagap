require 'spec_helper'

describe "lesson_checkouts/edit" do
  before(:each) do
    @lesson_checkout = assign(:lesson_checkout, stub_model(LessonCheckout))
  end

  it "renders the edit lesson_checkout form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lesson_checkout_path(@lesson_checkout), "post" do
    end
  end
end
