require 'spec_helper'

describe "lesson_checkouts/new" do
  before(:each) do
    assign(:lesson_checkout, stub_model(LessonCheckout).as_new_record)
  end

  it "renders new lesson_checkout form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lesson_checkouts_path, "post" do
    end
  end
end
