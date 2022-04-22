require 'rails_helper'

RSpec.describe "FileService", type: :helper do

 context ".create_tmp_file" do
  it "creates a file successfully" do
    FileService.create_tmp_file(file_name: 'test', file_content: 'some content', file_extension: 'txt')
    file = 'tmp/test.txt'

    assert_path_exists(file)
  end

  it "creates a png file if no extension is given" do
    FileService.create_tmp_file(file_name: 'image_testing', file_content: 'some content')
    file = 'tmp/image_testing.png'

    assert_path_exists(file)
  end
 end

 context ".create_blob" do
  it "should return an ActiveStorage::Blob object" do
    blob = FileService.create_blob(file_path: 'tmp/image_testing.png', file_name: 'image testing')

    expect(blob.class).to eq(ActiveStorage::Blob)

    blob.purge
  end
 end


end
