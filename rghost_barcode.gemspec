# shairon.toledo@gmail.com
# 14 de Dezembro de 2007
#
Gem::Specification.new do |s|
  s.name      = "rghost_barcode"
  s.version = "0.9"
  s.authors = ["Shairon Toledo"]
  s.email     = "shairon.toledo@gmail.com"
  s.homepage = "https://github.com/shairontoledo/rghost-barcode/wiki"
  s.platform = Gem::Platform::RUBY
  s.summary = "RGhost Barcode is adapter from Barcode Writer in Pure Postscript"
  s.description="RGhost Barcode is adapter from Barcode Writer. The Barcode Writer in Pure Postscript is an award-winning open source barcode maker, as used by NASA. "
  candidates = Dir.glob("{bin,docs,lib,tests}/**/*")
  s.files     = [
    "lib/rghost_barcode.rb",
    "lib/rghost_barcode/rghost_barcode_adapter.rb",
    "lib/rghost_barcode/rghost_barcode_base.rb",
    "lib/rghost_barcode/rghost_barcode_types.rb",
    "lib/rghost_barcode/rghost_barcode_version.rb",
    "lib/rghost_barcode/ps/barcode_base.ps"
  ]
  s.require_path      = "lib"
end
