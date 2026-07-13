require "test_helper"

class PlatformContractTest < ActionDispatch::IntegrationTest
  test "health returns the shared contract without a cookie" do
    get "/health"

    assert_response :ok
    assert_equal({ "status" => "ok" }, response.parsed_body)
    assert_nil response.headers["Set-Cookie"]
  end

  test "openapi returns an OpenAPI 3 document describing implemented routes" do
    get "/openapi.json"

    assert_response :ok
    assert_equal "3.1.0", response.parsed_body.fetch("openapi")
    assert response.parsed_body.fetch("paths").key?("/health")
    assert response.parsed_body.fetch("paths").key?("/openapi.json")
  end
end
