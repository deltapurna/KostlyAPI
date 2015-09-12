require 'test_helper'

class CreatingPlaceTest < ActionDispatch::IntegrationTest
  test "creating a place with valid parameter" do
    name = 'Sampel Kosan'
    post places_path, place: { name: name }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    response_body = JSON.parse(response.body)
    assert_equal name, response_body['name']
  end

  test 'not creating a place without valid parameter' do
    name = ''
    post places_path, place: { name: name }

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type

    response_body = JSON.parse(response.body)
    refute_empty response_body['name']
  end
end
