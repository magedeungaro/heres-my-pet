class FileService
  def self.create_tmp_file(name:, file:)
    IO.binwrite("tmp/#{name}.png", file.to_s)
  end

  def create_blob(file:, file_name:, file_extension: 'png')
    ActiveStorage::Blob.create_after_upload!(
      io: File.open(file),
      filename: file_name,
      content_type: file_extension,
    )
  end

  def self.attach_file(file:, file_name:, obj:, attachble_type:, file_extension: 'png')
    tmp_file = self.create_tmp_file(name: file_name, file: file)
    blob = self.create_blob(file: tmp_file, file_name: file_name, file_extension: file_extension)

    obj[attachble_type.underscore.constantize].attach(blob)
  end
end
