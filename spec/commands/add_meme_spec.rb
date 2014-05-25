require_relative '../spec_helper.rb'

 describe 'AddMeme' do

  it 'exists' do
    expect(AddMeme).to be_a(Class)
  end

  before(:each) do
    @sql = SQLite3::Database.new("test.db")
  end


 it "should return a meme on success" do
    data = {url: "blb.org"}
    result = subject.run(data)
    expect(result.success?).to eq(true)
    expect(result.meme).to be_a(MEMEBLR::Meme)
    expect(result.meme.id).to eq(1)
    expect(result.meme.name).to eq(data[:name])
    expect(result.meme.username).to eq(data[:username])
  end

  it "should return error if meme exists" do
    data = {url: "blb.org"}
    subject.run(data)
    # run again
    result = subject.run(data)
    expect(result.success?).to eq(false)
    expect(result.error).to eq(:meme_exists)
  end
end

