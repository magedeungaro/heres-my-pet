require 'rails_helper'

RSpec.describe "FileService", type: :helper do
 context ".create_tmp_file" do
  it "creates a file successfully" do
    FileService.create_tmp_file(name: 'test', file: 'some content', file_extension: 'txt')
    file = 'tmp/test.txt'

    expect(File.exist?(file)).to eq(true)
  end
 end


end
