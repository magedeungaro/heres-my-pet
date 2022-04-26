class FileService
  def self.create_tmp_file(file_name:, file_content:, file_extension: 'png')
    IO.binwrite("tmp/#{ file_name }.#{ file_extension }", file_content.to_s)
  end

  def self.create_blob(file_path:, file_name:, file_extension: 'png')
    ActiveStorage::Blob.create_and_upload!(
      io: File.open(file_path),
      filename: file_name,
      content_type: file_extension,
    )
  end

  def self.attach_file(file_content:, file_name:, obj:, attachable_type:, file_extension: 'png')

    unless obj.respond_to? attachable_type.underscore
      message = 'Attachable type not found on model provided.'
      Sentry.capture_exception(NoMethodError.new(message))

      return message
    end


    tmp_file = self.create_tmp_file(file_name: file_name, file_content: file_content, file_extension: file_extension)
    blob = self.create_blob(file_path: "tmp/#{ file_name }.#{ file_extension }", file_name: file_name, file_extension: file_extension)

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
