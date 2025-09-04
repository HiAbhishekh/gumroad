# frozen_string_literal: true

# Skip MongoDB initialization in test environment
unless Rails.env.test?
  require File.join(Rails.root, "lib", "extras", "mongoer")

  Mongoid.load!(Rails.root.join("config", "mongoid.yml"))
  MONGO_DATABASE = Mongoid::Clients.default
end
