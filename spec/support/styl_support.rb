module StylSupport
  def generate_css
    _mkdir('tmp')
    Dir["test/*.styl"].each do |input|
      output = Stylus.compile(File.open(input))
      filename = input.gsub("test/", "tmp/").gsub(".styl", ".css")
      File.open(filename, "w") { |f| f.write(output) }
    end
  end

  def clean_up
    # FileUtils.rm_rf('tmp')
  end
end
