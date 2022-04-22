require 'rails_helper'

RSpec.describe "FileService", type: :helper do
 context ".create_tmp_file" do
  it "creates a file successfully" do
    FileService.create_tmp_file(name: 'test', file: 'some content', file_extension: 'txt')
    file = 'tmp/test.txt'

    assert_path_exists(file)
  end

  it "creates a png file if no extension is given" do
    FileService.create_tmp_file(name: 'image', file: 'some content')
    file = 'tmp/image.png'

    assert_path_exists(file)
  end

  it "should not raise an error if some argument is not given" do
    expect { FileService.create_tmp_file }.not_to raise_error
  end
 end
end
