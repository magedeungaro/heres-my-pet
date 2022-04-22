class FileService
  def self.create_tmp_file(name:, file:, file_extension: 'png')
    IO.binwrite("tmp/#{ name }.#{ file_extension }", file.to_s)
  end

  def self.create_blob(file_path:, file_name:, file_extension: 'png')
    ActiveStorage::Blob.create_after_upload!(
      io: File.open(file_path),
      filename: file_name,
      content_type: file_extension,
    )
  end

  def self.attach_file(file:, file_name:, obj:, attachable_type:, file_extension: 'png')

    unless obj.respond_to? attachable_type.underscore
      message = 'Attachable type not found on model provided.'
      Sentry.capture_exception(NoMethodError.new(message))

      return message
    end


    tmp_file = self.create_tmp_file(name: file_name, file: file, file_extension: file_extension)
    blob = self.create_blob(file: "tmp/#{ file_name }.#{ file_extension }", file_name: file_name, file_extension: file_extension)

    puts "Sent #{file_name} to Cloudinary"
    obj.send(attachable_type.underscore).attach(blob)
  end

  def self.purge_attachment(obj:, attachable_type:)
    unless obj.respond_to? attachable_type.underscore
      message = 'Attachable type not found on model provided.'
      Sentry.capture_exception(NoMethodError.new(message))

      return message
    end

    obj.send(attachable_type.underscore).purge_later
  end
end
