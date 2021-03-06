require "test_helper"
require "cuba/render"
require "cuba/sugar/content_for"

scope do
  setup do
    Cuba.plugin Cuba::Render
    Cuba.plugin Cuba::Sugar::ContentFor

    Cuba.settings[:render][:views] = "./test/views"
    Cuba.settings[:render][:template_engine] = "erb"

    Cuba.define do
      on root do
        res.write view("home")
      end
    end
  end

  test "content for the menu" do
    _, _, body = Cuba.call({ "PATH_INFO" => "/", "SCRIPT_NAME" => "/" })

    assert_equal body, ["  alpha\nbeta\ngamma\n\n"]
  end
end
