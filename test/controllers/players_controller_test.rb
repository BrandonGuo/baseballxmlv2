require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: { avg: @player.avg, given_name: @player.given_name, hr: @player.hr, ops: @player.ops, rbi: @player.rbi, runs: @player.runs, sb: @player.sb, surname: @player.surname, year: @player.year }
    end

    assert_redirected_to player_path(assigns(:player))
  end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  test "should update player" do
    patch :update, id: @player, player: { avg: @player.avg, given_name: @player.given_name, hr: @player.hr, ops: @player.ops, rbi: @player.rbi, runs: @player.runs, sb: @player.sb, surname: @player.surname, year: @player.year }
    assert_redirected_to player_path(assigns(:player))
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player
    end

    assert_redirected_to players_path
  end
end
