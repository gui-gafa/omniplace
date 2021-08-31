require 'test_helper'

class FiiRanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fii_rank = fii_ranks(:one)
  end

  test "should get index" do
    get fii_ranks_url
    assert_response :success
  end

  test "should get new" do
    get new_fii_rank_url
    assert_response :success
  end

  test "should create fii_rank" do
    assert_difference('FiiRank.count') do
      post fii_ranks_url, params: { fii_rank: {  } }
    end

    assert_redirected_to fii_rank_url(FiiRank.last)
  end

  test "should show fii_rank" do
    get fii_rank_url(@fii_rank)
    assert_response :success
  end

  test "should get edit" do
    get edit_fii_rank_url(@fii_rank)
    assert_response :success
  end

  test "should update fii_rank" do
    patch fii_rank_url(@fii_rank), params: { fii_rank: {  } }
    assert_redirected_to fii_rank_url(@fii_rank)
  end

  test "should destroy fii_rank" do
    assert_difference('FiiRank.count', -1) do
      delete fii_rank_url(@fii_rank)
    end

    assert_redirected_to fii_ranks_url
  end
end
