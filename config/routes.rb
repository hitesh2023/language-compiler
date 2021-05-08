Rails.application.routes.draw do
  post 'submit', to: 'compilation#submit'
  get 'status', to: 'compilation#status'
  get 'output', to: 'compilation#output'
end
