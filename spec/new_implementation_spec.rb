require 'rubygems'
require 'rghost'
require 'rghost_barcode'


RGhost::Config::GS[:path]='/usr/local/bin/gs'
describe RGhost::Barcode do

  it "should render qcode" do
    doc=RGhost::Document.new 
   
    doc.barcode_code39('THIS IS CODE FOO', :x => 4, :y => 13, :height => 444 )
    r= doc.render :pdf, :logfile => "/tmp/logfile.txt", :debug => true, :filename => "/tmp/rghost_barcode.pdf"
    r.should be_true
  end
  

  
  it "should render examples" do
    
    doc = RGhost::Config.barcode_examples
    doc.render :pdf, :logfile => "/tmp/logfile.txt", :debug => true, :filename => "/tmp/examples.pdf"
    
  end
  
end
