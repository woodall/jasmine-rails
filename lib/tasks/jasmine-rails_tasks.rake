namespace :spec do

  desc "run test with phantomjs"
  task :javascript => [:environment] do
    if Rails.env.test?
      require 'jasmine_rails/runner'
      spec_filter = ENV['SPEC']
      reporters = ENV.fetch('REPORTERS', 'console')
      JasmineRails::Runner.run spec_filter, reporters
    else
      exec('bundle exec rake spec:javascript RAILS_ENV=test')
    end
  end

  # alias
  task :javascripts => :javascript
end
