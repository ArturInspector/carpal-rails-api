Rails.application.routes.draw do
  get "/health", to: "health#show"
  get "/openapi.json", to: "openapi#show"
end
