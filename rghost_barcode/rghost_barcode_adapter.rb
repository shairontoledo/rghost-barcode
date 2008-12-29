

RGhost::Config::GS[:extensions] << File.join(File.dirname(__FILE__),'ps')
RGhost::Config::GS[:preload] << :render

class RGhost::Document 
  
  #Facade for RGhost::Barcode::Isbn
  def barcode_isbn(barcode_string,options={})
    set RGhost::Load.library(:ean13)
    set RGhost::Barcode::Isbn.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Code11
  def barcode_code11(barcode_string,options={})
    set RGhost::Barcode::Code11.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Code2of5
  def barcode_code2of5(barcode_string,options={})
    set RGhost::Barcode::Code2of5.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Ean8
  def barcode_ean8(barcode_string,options={})
    set RGhost::Barcode::Ean8.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Postnet
  def barcode_postnet(barcode_string,options={})
    set RGhost::Barcode::Postnet.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Rssexpanded
  def barcode_rssexpanded(barcode_string,options={})
    set RGhost::Barcode::Rssexpanded.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Auspost
  def barcode_auspost(barcode_string,options={})
    set RGhost::Barcode::Auspost.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Code39
  def barcode_code39(barcode_string,options={})
    set RGhost::Barcode::Code39.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Upce
  def barcode_upce(barcode_string,options={})
    set RGhost::Barcode::Upce.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Azteccode
  def barcode_azteccode(barcode_string,options={})
    set RGhost::Barcode::Azteccode.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Ean5
  def barcode_ean5(barcode_string,options={})
    set RGhost::Barcode::Ean5.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Plessey
  def barcode_plessey(barcode_string,options={})
    set RGhost::Barcode::Plessey.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Raw
  def barcode_raw(barcode_string,options={})
    set RGhost::Barcode::Raw.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Rss14
  def barcode_rss14(barcode_string,options={})
    set RGhost::Barcode::Rss14.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Royalmail
  def barcode_royalmail(barcode_string,options={})
    set RGhost::Barcode::Royalmail.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Datamatrix
  def barcode_datamatrix(barcode_string,options={})
    set RGhost::Barcode::Datamatrix.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Code128
  def barcode_code128(barcode_string,options={})
    set RGhost::Barcode::Code128.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Upca
  def barcode_upca(barcode_string,options={})
    set RGhost::Barcode::Upca.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Qrcode
  def barcode_qrcode(barcode_string,options={})
    set RGhost::Barcode::Qrcode.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Maxicode
  def barcode_maxicode(barcode_string,options={})
    set RGhost::Barcode::Maxicode.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Rationalizedcodabar
  def barcode_rationalizedcodabar(barcode_string,options={})
    set RGhost::Barcode::Rationalizedcodabar.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Code93
  def barcode_code93(barcode_string,options={})
    set RGhost::Barcode::Code93.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Msi
  def barcode_msi(barcode_string,options={})
    set RGhost::Barcode::Msi.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Rsslimited
  def barcode_rsslimited(barcode_string,options={})
    set RGhost::Barcode::Rsslimited.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Ean13
  def barcode_ean13(barcode_string,options={})
    set RGhost::Barcode::Ean13.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Onecode
  def barcode_onecode(barcode_string,options={})
    set RGhost::Barcode::Onecode.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Ean2
  def barcode_ean2(barcode_string,options={})
    set RGhost::Barcode::Ean2.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Interleaved2of5
  def barcode_interleaved2of5(barcode_string,options={})
    set RGhost::Barcode::Interleaved2of5.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Symbol
  def barcode_symbol(barcode_string,options={})
    set RGhost::Barcode::Symbol.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Pdf417
  def barcode_pdf417(barcode_string,options={})
    set RGhost::Barcode::Pdf417.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Kix
  def barcode_kix(barcode_string,options={})
    set RGhost::Barcode::Kix.new(barcode_string,options)
  end

  #Facade for RGhost::Barcode::Pharmacode
  def barcode_pharmacode(barcode_string,options={})
    set RGhost::Barcode::Pharmacode.new(barcode_string,options)
  end

  
end

module RGhost::Config
  BARCODE_EXAMPLES={
    'plessey' => ['01234ABCD',{ :text => {:size => 10}}],
    'isbn' => ['978-1-56592-479',{:text => {:size => 10}, :guard=>{:whitespace => true }}],
    'rsslimited' => ['00978186074271',{:height => 1 , :text => {:size => 10}}],
    'pdf417' => ['^453^178^121^239',{:text => {:size => 10}, :columns => 2,  :rows=> 10}],
    'royalmail' => ['LE28HS9Z',{:text => {:size => 10}}],
    'ean13' => ['977147396801',{ :guard=>{:whitespace => true }}],
    'code11' => ['0123456789',{:text => {:size => 10}}],
    'symbol' => ['fima',{:text => {:size => 10}}],
    'qrcode' => ['000100000010000000001100010101100110000110000',{:text => {:size => 10}}],
    'msi' => ['0123456789',{:text => {:size => 10}}],
    'upca' => ['78858101497',{:text => {:size => 10}}],
    'pharmacode' => ['117480',{:text => {:size => 10}}],
    'kix' => ['1231FZ13XHS',{:text => {:size => 10}}],
    'datamatrix' => ['^142^164^186',{:columns => 32,  :rows=> 32}],
    'rssexpanded' => ['000000010011001010100001000000010000',{:text => {:size => 10}}],
    'ean2' => ['05',{:text => {:size => 10}}],
    'rationalizedcodabar' => ['A0123456789B',{:text => {:size => 10}}],
    'upce' => ['0123456',{:text => {:size => 10}}],
    'ean5' => ['90200',{:text => {:size => 10}}],
    'code2of5' => ['01234567',{:text => {:size => 10}}],
    'code93' => ['THIS IS CODE 93',{:text => {:size => 10}}],
    'postnet' => ['012345',{:text => {:size => 10}}],
    'maxicode' => ['^059^042^041^059^040^03001^02996152382802^029840^029001^0291Z00004951^029UPSN^02906X610^029159^0291234567^0291^0471^029^029Y^029634 ALPHA DR^029PITTSBURGH^029PA^030^062^004^063', {:mode=> 2, :text => {:size => 10}}],
    'raw' => ['331132131313411122131311333213114131131221323',{:text => {:size => 10}}],
    'onecode' => ['0123456709498765432101234567891',{:text => {:size => 10}}],
    'code39' => ['THIS IS CODE 39',{:text => {:size => 10}}],
    'auspost' => ['5956439111ABA 9',{:text => {:size => 10}}],
    'azteccode' => ['00100111001000000101001101111000010100111100101000000110',{:text => {:size => 10}, :format=> :compact}],
    'ean8' => ['01335583',{:text => {:size => 10}}],
    'interleaved2of5' => ['24012345678905',{
        :text => {:size => 10, :offset => [0,-10], :enable => [:text, :check, :checkintext] }, 
        :border => {:width => 4, :left => 15, :right => 15, :show => true}, 
        :height => 2
      }],
    'code128' => ['^104^102Count^0990123456789^101!',{:text => {:size => 10}}],
    'rss14' => ['24012345678905',{:text => {:size => 10}}]


  }
  #Generates catalog of barcodes.
  #
  # RGhost::Config.barcode_examples.render :pdf, :filename => "/tmp/barcode_catalog.pdf"
  #
  def self.barcode_examples() #(options={:text => {:size => 10}})
    d=RGhost::Document.new :paper => [15,8], :margin_left => 2
    #d.set RGhost::Barcode::Code39.new("ASDHAJSDF", :x => 1, :y => 5, :color => 'FF0000', :border =>{:color => '00FF00'}, :text =>{:size => 10, :color => '553297' }, :height => 1,  :width => 4.545)
    #d.barcode_isbn("978-1-56592-479", :x => 1, :y => 5, :color => 'FF0000', :border =>{:color => '00FF00'}, :text =>{:size => 10, :color => '553297' }, :height => 1,  :width => 4.545)
    #d.barcode_isbn("978-1-56592-479", :x => 1, :y => 10, :text =>{:size => 10})
    d.define_template :barcode_template,  File.join(File.dirname(__FILE__),'ps',"barcode_template.eps")
    d.before_page_create do
      use_template :barcode_template
    end
    RGhost::Config::BARCODE_EXAMPLES.each do |k,v|
      
      d.show "Barcode Name: #{k}"
      d.jump_rows 6
      #opt=v[1][:text][:size]=10
      opt=v[1]
      d.send "barcode_#{k}".to_sym,v[0],opt.dup
      d.jump_rows 2
      d.show "Code String: #{v[0]}"
      d.next_row
      d.text("Options: #{opt.inspect}",false)
      d.next_page
    end
    license=%Q{<big>Barcode Writer License</big><br/>Anybody is free to use and develop this code as they see fit, under the terms of the permissive MIT/X-Consortium license(http://postscriptbarcode.googlecode.com/svn/trunk/LICENSE), which requires that developers attribute any derivative code to this project in both the source code and documentation. As such I take no liability for its use or misuse.<br/><br/>Thanks a lot Terry!<br/> <i>Shairon Toledo</i>   }
    d.text license
    d.next_row
    d.show "RGhost::VERSION #{RGhost::VERSION::STRING}" , :align => :page_right, :tag => :b
    d.next_row
    d.show "RGhost::Barcode::VERSION #{RGhost::Barcode::VERSION::STRING}" , :align => :page_right, :tag => :b
    d
  end
  
end

