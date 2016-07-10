require 'test_helper'

class CreatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creator = creators(:one)
  end

  test "should get index" do
    get creators_url, as: :json
    assert_response :success
  end

  test "should create creator" do
    assert_difference('Creator.count') do
      post creators_url, params: { creator: { birth_date: @creator.birth_date, death_date: @creator.death_date, first_name: @creator.first_name, first_name_kana: @creator.first_name_kana, image_url: @creator.image_url, last_name: @creator.last_name, last_name_kana: @creator.last_name_kana, screen_name: @creator.screen_name, wiki_url: @creator.wiki_url } }, as: :json
    end

    assert_response 201
  end

  test "should show creator" do
    get creator_url(@creator), as: :json
    assert_response :success
  end

  test "should update creator" do
    patch creator_url(@creator), params: { creator: { birth_date: @creator.birth_date, death_date: @creator.death_date, first_name: @creator.first_name, first_name_kana: @creator.first_name_kana, image_url: @creator.image_url, last_name: @creator.last_name, last_name_kana: @creator.last_name_kana, screen_name: @creator.screen_name, wiki_url: @creator.wiki_url } }, as: :json
    assert_response 200
  end

  test "should destroy creator" do
    assert_difference('Creator.count', -1) do
      delete creator_url(@creator), as: :json
    end

    assert_response 204
  end
end
