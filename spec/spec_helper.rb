require './lib/memeblr.rb'

# include Memeblr
RSpec.configure do |config|
  config.before(:each) do
    Memeblr.instance_variable_set(:@__db_instance, nil)
  end
end
