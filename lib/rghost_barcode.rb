$LOAD_PATH << File.join(File.dirname(__FILE__),'rghost_barcode')
require 'rghost_barcode/rghost_barcode_base'
require 'rghost_barcode/rghost_barcode_types'
require 'rghost_barcode/rghost_barcode_version'
require 'rghost_barcode/rghost_barcode_adapter'

RGhost::Config::GS[:extensions] << File.join(File.dirname(__FILE__),'rghost_barcode','ps')
RGhost::Config::GS[:preload] << "barcode_base"

