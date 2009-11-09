require File.dirname(__FILE__) + '/../spec_helper'
require 'features2cards/cli'

module Features2Cards
  describe CLI do  
    it "should parse feature" do
      cli = CLI.execute(%w{examples/self_test/features/features2cards.feature})
    end
    
    it "should parse feature in german" do
      cli = CLI.execute(%w{examples/i18n/de})
    end
    
    it "should accept --out option" do
      cli = CLI.new(StringIO.new)
      cli.parse!(%w{--out test.pdf})
      cli.options[:pdf_file].should == 'test.pdf'
    end  
  end
end

