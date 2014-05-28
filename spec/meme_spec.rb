require 'spec_helper'

describe 'Memes' do

  it 'exists' do
    expect(Memes).to be_a(Class)
  end

  it "should have id and url" do
    meme = MEMEBLR::Memes.new(id: 1, url: "./img/speak_sql")
    expect(meme.id).to eq(1)
    expect(meme.url).to eq("./img/speak_sql")
  end

end



