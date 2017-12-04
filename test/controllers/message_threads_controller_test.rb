require 'test_helper'

class MessageThreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_thread = message_threads(:one)
  end

  test "should get index" do
    get message_threads_url
    assert_response :success
  end

  test "should get new" do
    get new_message_thread_url
    assert_response :success
  end

  test "should create message_thread" do
    assert_difference('MessageThread.count') do
      post message_threads_url, params: { message_thread: { user_id: @message_thread.user_id } }
    end

    assert_redirected_to message_thread_url(MessageThread.last)
  end

  test "should show message_thread" do
    get message_thread_url(@message_thread)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_thread_url(@message_thread)
    assert_response :success
  end

  test "should update message_thread" do
    patch message_thread_url(@message_thread), params: { message_thread: { user_id: @message_thread.user_id } }
    assert_redirected_to message_thread_url(@message_thread)
  end

  test "should destroy message_thread" do
    assert_difference('MessageThread.count', -1) do
      delete message_thread_url(@message_thread)
    end

    assert_redirected_to message_threads_url
  end
end
