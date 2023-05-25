require "test_helper"

class ManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @management = managements(:one)
  end

  test "should get index" do
    get managements_url, as: :json
    assert_response :success
  end

  test "should create management" do
    assert_difference("Management.count") do
      post managements_url, params: { management: { category: @management.category, date: @management.date, description: @management.description, due_date: @management.due_date, notes: @management.notes, owner: @management.owner, status: @management.status, time: @management.time } }, as: :json
    end

    assert_response :created
  end

  test "should show management" do
    get management_url(@management), as: :json
    assert_response :success
  end

  test "should update management" do
    patch management_url(@management), params: { management: { category: @management.category, date: @management.date, description: @management.description, due_date: @management.due_date, notes: @management.notes, owner: @management.owner, status: @management.status, time: @management.time } }, as: :json
    assert_response :success
  end

  test "should destroy management" do
    assert_difference("Management.count", -1) do
      delete management_url(@management), as: :json
    end

    assert_response :no_content
  end
end
