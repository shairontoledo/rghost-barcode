class RGhost::Document 
  
  RGhost::Barcode::BARCODES.keys.each do |name|
    #nomalize
    bwpp_name = name.to_s.gsub(/_/,'-')
    clazz_name = name.to_s.capitalize
    clazz = Class.new(RGhost::Barcode::Base)
    ::RGhost::Barcode.const_set clazz_name.to_sym,clazz
     
    self.send :define_method, "barcode_#{name}" do |data_string, options|
      set clazz.new(data_string, options)
    end    
  end
end

module RGhost::Config
  #Generates catalog of barcodes.
  #
  # RGhost::Config.barcode_examples.render :pdf, :filename => "/tmp/barcode_catalog.pdf"
  #
  def self.barcode_examples
    d=RGhost::Document.new :paper => [18,10], :margin_left => 2
    RGhost::Barcode::BARCODES.each do |k,v|
      opts = v.dup
      d.text "Barcode Name: <b>#{k}</b> "
      d.next_row
      d.show "Barcode description: #{opts.delete(:desc)}"
      d.jump_rows 8
      barcode_string = opts.delete(:default)
      d.send "barcode_#{k}".to_sym,barcode_string,opts.dup      
      d.jump_rows 3
      d.text("Code: doc.barcode_#{k}('#{barcode_string}',#{opts.inspect})",false)
      d.next_page
    end
    license=%Q{<big>Barcode Writer License</big><br/>Anybody is free to use and develop this code as they see fit, under the terms of the permissive MIT/X-Consortium license(http://postscriptbarcode.googlecode.com/svn/trunk/LICENSE), which requires that developers attribute any derivative code to this project in both the source code and documentation. As such I take no liability for its use or misuse.<br/><br/><br/> <i>Shairon Toledo</i>   }
    d.text license
    d.next_row
    d.show "RGhost::VERSION #{RGhost::VERSION::STRING}" , :align => :page_right, :tag => :b
    d.next_row
    d.show "RGhost::Barcode::VERSION #{RGhost::Barcode::VERSION::STRING}" , :align => :page_right, :tag => :b
    d
  end
  
end

