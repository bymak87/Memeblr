require './lib/memeblr.rb'

 include MEMEBLR

RSpec.configure do |config|
  config.before(:each) do
    MEMEBLR.instance_variable_set(:@__db_instance, nil)
  end
end
