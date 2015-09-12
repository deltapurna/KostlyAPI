require 'test_helper'

class ListingPlacesTest < ActionDispatch::IntegrationTest
  test "listing all places" do
    place = Place.create!(name: 'Sampel Kosan')
    get places_path

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    response_body = JSON.parse(response.body)
    assert_equal Place.count, response_body.size
  end
end
