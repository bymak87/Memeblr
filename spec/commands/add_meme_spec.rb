require_relative '../spec_helper.rb'

 describe 'AddMeme' do

  xit 'exists' do
    expect(AddMeme).to be_a(Class)
  end

  before(:each) do
    @sql = SQLite3::SQLDB.new("meme.db")
  end



end


