require_relative '../spec_helper.rb'

describe 'DeleteMeme' do

  xit 'exists' do
    expect(DeleteMeme).to be_a(Class)
  end

  before(:each) do
    @sql = SQLite3::SQLDB.new("meme.db")
  end

end
