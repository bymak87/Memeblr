require 'spec_helper'

describe 'memes class' do
  context 'initialize method' do
    it "should have id, title, file, and like?" do
      data = {id: 1, title: "speak_sql", file: "./img/speak_sql", like: false}
      meme1 = Memeblr::Memes.new(data)
      expect(meme1[:id]).to eq(1)
      expect(meme1.title).to eq("speak_sql")
      expect(meme1.file).to eq("./img/speak_sql")
      expect(meme1.like).to eq(false)
    end
  end
end
