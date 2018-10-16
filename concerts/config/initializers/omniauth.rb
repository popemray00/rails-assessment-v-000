Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'ab9c1f8903363bae317b', 'bd48e077ac62242f24ecfe411d5b4a46570c950e'
end
