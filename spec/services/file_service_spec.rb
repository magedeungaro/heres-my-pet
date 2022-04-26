require 'rails_helper'

RSpec.describe "FileService", type: :helper do

  context ".create_tmp_file" do
    it "creates a file successfully" do
      FileService.create_tmp_file(file_name: 'image_testing', file_content: 'some content', file_extension: 'png')
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

  let!(:pet) { FactoryBot.create(:pet) }

  context ".attach_file" do

    it "should attach the file for a given model on a given attachable" do
      FileService.attach_file(file_content: 'test', file_name: pet.id, obj: pet, attachable_type: 'qr_code')
      expect(pet.qr_code.attached?).to be(true)
    end

    it "It should not raise an error if the attachable given is not found in the model" do
      expect { FileService.attach_file(file_content: 'test', file_name: pet.id, obj: pet, attachable_type: 'something') }.not_to raise_error
    end
  end

  context ".purge_attachment" do
    it "should purge the file for a given model on a given attachable" do
      FileService.purge_attachment(obj:pet, attachable_type:'qr_code')

      expect(pet.qr_code.attached?).to be(false)
    end

    it "It should not raise an error if the attachable given is not found in the model" do
      expect { FileService.purge_attachment(obj:pet, attachable_type:'something') }.not_to raise_error
    end
  end

end
