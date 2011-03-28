module RGhost::Barcode
  
  class Parameter < RGhost::PsObject
    
    def initialize(options=nil)
      @options=options
      @params=[]
      make() if options
    end
    def map
      @params.join(" ")
    end
    
    def add(key,value)
      @params << "#{key}=#{value}" if value
    end
    	
    def add_color(key,value)
      add(key, value.to_s.gsub(/[^0-9A-F]/,'') )
    end
    def add_single(entry)
      @params << entry
    end
    
    #using the framework unit
    def add_with_unit(key,value)
      v=if RGhost::Config::GS[:unit] == RGhost::Units::Cm
        (value.to_f/2.545)
      end
      add(key, v || value )
    end
    
    def inspect
      "#{self.class} - #{map}"
    end
    def to_s
      map
    end
    def make() end #prototype
  end
  
  
  #Enables properties of text. It's used on the contructor of the class RGhost::Barcode::Base(parent of all barcodes) by Hash :text.
  #Between parenthesis the original parameter.
  #* <tt>:size</tt> - (textsize) - size of text in points.
  #* <tt>:font</tt> - (textfont) - name of font, see the font catalog.
  #* <tt>:offset</tt> - (textxoffset, textyoffset) - Used as array. Example :offset => [10,8], textxoffset[0] and textyoffset[1]
  #* <tt>:x and :y</tt> - (textxalign, textyalign) - Align of X and Y. Example :x => 0.2, :y => 5
  #* <tt>:color</tt> - (textcolor) - Color of text. Only rgb hex. Example: :color => 'FF0000'
  #* <tt>:enable </tt> Array 
  #Enables 
  #* <tt>:text</tt>  - (includetext) - Show human readable text for data in symbol.
  #* <tt>:check</tt> - (includecheck) - Generate check digit(s), where relevant.
  #* <tt>:checkintext</tt> - (includecheckintext) - Generate check digit(s), where relevant.
  #Example:
  # doc=Document.new
  # doc.barcode_interleaved2of5('0123456789', :text => {:size => 10, :offset => [0,-10], :enable => [:text, :check, :checkintext] })
  class Text < RGhost::Barcode::Parameter
    
    def make
      add_single("includetext")
      @options.each do |key,value| 
        case key
        when :enable then  value.each{|item| add_single("include#{item}")   }
        when :offset 
          add("textxoffset", value[0])
          add("textyoffset", value[1])
        when :color then add_color("textcolor", value)          
        when :x, :y then add("text#{key}align",value) 
        else
          add("text#{key}",value)
        end
      end
    end
  end
  
  #Display whitespace guards or the specified width and height, in points. (Most useful for EANs). It's used on the contructor of the class RGhost::Barcode::Base(parent of all barcodes) by Hash :guard.
  #Between parenthesis the original parameter.
  #* <tt>:whitespace</tt>(guardwhitespace) - Enabled by true. Example: :whitespace => true
  #* <tt>:height and :width </tt>(guardwidth and guardheight) 
  #Amount of whitespace to guard to left and right of the symbol and vertical position of the guard symbols, in points.
  #* <tt>:left,right,:left_y, :right_y </tt>(guardleftpos, guardrightpos, guardleftypos and guardrightypos)
  #
  #Example:
  # doc=Document.new
  # doc.barcode_ean13('977147396801', :guard=>{:whitespace => true, :width => 0.2 })
  class Guard < RGhost::Barcode::Parameter
    def make
      #
      @options.each do |key,value| 
        case key
        when :left,:right,:left_y, :right_y then add("guard#{key.to_s.gsub(/_/,'')}pos",value)  
        when :whitespace then add_single("guardwhitespace")
        else
          add("guard#{key}",value)
        end
      end
      
    end
    
    
  end
  #Display border properties. It's used on the contructor of the class RGhost::Barcode::Base(parent of all barcodes) by Hash :border.
  #Between parenthesis the original parameter.
  #* <tt>:show</tt>(showborder) - Enabled by true. Example: :show => true
  #* <tt>:width</tt>(borderwidth) - Width of border in points.
  #* <tt>:left, :right, :top, :bottom</tt>( borderleft, borderright, bordertop, borderbottom) - specifies the width of the each side of border.
  #* <tt>:color</tt>(textcolor) - Color of text. Only rgb hex. Example: :color => 'FF0000'
  #
  #Example:
  # doc=Document.new
  # doc.barcode_interleaved2of5('0123456789', :border => {:width => 4, :left => 15, :right => 15, :show => true} )
  class Border < RGhost::Barcode::Parameter

    def make
      
      @options.each do |key,value| 
        case key
        when :color then add_color("bordercolor", value) 
        when :show then add_single("showborder")
        else
          add("border#{key}",value)
        end
      end
      
    end
    
    
  end

  #Base of all kinds of barcodes. It's used to creates barcode.  For more details about options see http://groups.google.com/group/postscriptbarcode/web/Options
  #
  #==Options
  #Facades 
  #* <tt>:text</tt>   RGhost::Barcode::Text
  #* <tt>:guard</tt>  RGhost::Barcode::Guard
  #* <tt>:border</tt> RGhost::Barcode::Border
  #Options. Between parenthesis the original parameter.
  #* <tt>:scale</tt> Scale in Array([x,y]). Example for twice the original size, :scale => [2,2]
  #* <tt>:rotate</tt> Rotate angle.
  #* <tt>:color</tt>(barcolor) Foreground color.
  #* <tt>:background</tt>(backgroundcolor) 
  #* <tt>:x and :y</tt> Position. RGhost::Config::GS[:unit] will be used. Default :current_row and :limit_left
  #* <tt>:width and :height</tt>(width and height). Width and height of barcode,  RGhost::Config::GS[:unit] will be used.
  #
  #Example:
  # doc=Document.new
  # doc.barcode_interleaved2of5('0123456789',
  #      :text => {:size => 10, :offset => [0,-10], :enable => [:text, :check, :checkintext] }, 
  #      :border => {:width => 4, :left => 15, :right => 15, :show => true}, 
  #      :height => 2
  #    )
  #Without options
  # doc=Document.new
  # doc.barcode_code39('0123456789')
  class Base <RGhost::Barcode::Parameter
    include RGhost::RubyToPs
    attr_reader :text, :guard, :border ,:point
  
    def initialize(barcode_string,options={})
      options||={}
      
      @options=options.dup
      @options[:x]||= :limit_left
      @options[:y]||= :current_row
      
      @barcode=(barcode_string.to_s == '') ? "Data Missing" : barcode_string
      #@barcode =to_string(@barcode)
      @text   = RGhost::Barcode::Text.new(@options[:text])
      
      @guard  = RGhost::Barcode::Guard.new(@options[:guard])
      @border = RGhost::Barcode::Border.new(@options[:border])
      @point=RGhost::Cursor.translate(@options)
      @rotate=RGhost::Cursor.rotate @options[:rotate]
      @scale=RGhost::Scale.new @options[:scale][0],@options[:scale][1] if @options[:scale]
      [:scale, :enable, :text,:guard,:border, :x, :y, :rotate].each{|v| @options.delete v}
      super(@options)
      @self_name=self.class.to_s.downcase.split(/::/).last.gsub(/_/,'-')
    end
  
    def make
      
      [:x,:y].each{|v| @options.delete v}
      
      @options.each do |key,value| 
        case key
        when :color then add_color("barcolor", value) 
        when :background then add_color("backgroundcolor", value) 
        when :width, :height then add_with_unit(key,value)
          #when :inkspread then  add(key,value)
        else   
          if (value == true)
            add_single(key)
            next
          end
          add(key,value)
        end
      end
      
    end
    
    def ps
      formated_params=[ @text.map, @border.map, @guard.map, self.map].join(" ")
      "gsave newpath #{@point.ps} #{@rotate} #{@scale} 0 0 moveto (#{@barcode}) (#{formated_params}) /#{@self_name} /uk.co.terryburton.bwipp findresource exec closepath grestore"
    end
  end

end
