ApiSamples::Application.routes.draw do

  namespace :api do
      namespace :v1 do
        resource :report
      end
  end

end
