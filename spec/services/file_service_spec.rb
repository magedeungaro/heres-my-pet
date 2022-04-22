require 'rails_helper'

RSpec.describe "FileService", type: :helper do

  context ".create_tmp_file" do
    it "creates a file successfully" do
      FileService.create_tmp_file(file_name: 'test', file_content: 'some content', file_extension: 'txt')
      file_path = 'tmp/test.txt'

      assert_path_exists(file_path)

      File.delete(file_path)
    end

    it "creates a png file if no extension is given" do
      FileService.create_tmp_file(file_name: 'image_testing', file_content: 'some content')
      file_path = 'tmp/image_testing.png'

      assert_path_exists(file_path)

    end
  end

  context ".create_blob" do
    it "should return an ActiveStorage::Blob object" do
      file_path = 'tmp/image_testing.png'
      blob = FileService.create_blob(file_path: file_path, file_name: 'image testing')

      expect(blob.class).to eq(ActiveStorage::Blob)

      blob.purge
      File.delete(file_path)
    end
  end

  context ".attach_file" do
    it "should attach the file for a given model on a given attachable" do
      puts "TODO"
      fail
    end

    it "It should not raise an error if the attachable given is not found in the model" do
      puts "TODO"
      fail
    end
  end

  context ".purge_attachment" do
    it "should purge the file for a given model on a given attachable" do
      puts "TODO"
      fail
    end

    it "It should not raise an error if the attachable given is not found in the model" do
      puts "TODO"
      fail
    end
  end

end
