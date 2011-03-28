require 'rubygems'
require 'rghost'
require 'rghost_barcode'
require 'fileutils'
require 'enumerator'
include FileUtils
@dest = "/tmp/doc"
RGhost::Config::GS[:path]='/usr/local/bin/gs'
FileUtils.mkdir_p @dest

File.open File.join(@dest,'rghost_barcode.html'), 'w' do |file|
   i =0
   RGhost::Barcode::BARCODES.sort{|a,b| a.to_s <=> b.to_s}.each do |k,v|
     next unless k == :qrcode
      opts = v.dup
      file.puts "h2. #{k} - #{opts.delete(:desc)}\n"
      doc = RGhost::Document.new :paper => [12,4], :margin_left => 0.5
      barcode_string = opts.delete(:default)
      doc.jump_rows 3
      doc.send "barcode_#{k}".to_sym,barcode_string,opts.dup
      img_name = "barcode_#{k}.png"      
      doc.render :png, :filename => File.join(@dest,"barcode_#{k}.png") , :resolution => 300
      file.puts "<img width='500' src='http://www.hashcode.eti.br/wp-content/uploads/2011/03/#{img_name}' /><br/>"
      
      file.puts "\n<pre><code>##{k} code sample\nrequire 'rghost'\nrequire 'rghost_barcode'\n\ndoc=RGhost::Document.new\ndoc.barcode_#{k}('#{barcode_string}',#{opts.inspect})\ndoc.render :pdf, :resolution => 100</pre></code>\n\n"
     #break if (i+=1) == 3
    end
  
  
end

File.open File.join(@dest,'rghost_barcode_list.html'), 'w' do |file|
   
   RGhost::Barcode::BARCODES.sort{|a,b| a.to_s <=> b.to_s}.each do |k,opts|
      
      file.puts "* #{k} - #{opts[:desc]}\n"
    end
  
  
end