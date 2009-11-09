require "cucumber"
require "features2cards/card"
require "features2cards/prawn"

module Features2Cards
  class CLI

    attr_reader :paths
    attr_reader :options

    def self.execute(args)
      new(args).execute!
    end

    def initialize(args, out_stream = STDOUT, error_stream = STDERR)
      @args    = args
      @out_stream   = out_stream
      @error_stream = error_stream
      @paths   = []
      @options = default_options
    end

    def execute!
      parse!(@args)
      load_cucumber
      if feature_files.empty?
        usage
        exit
      end

      generate_pdf(cards)
    end

    def parse!(args)
      @args = args
      @args.extend(::OptionParser::Arguable)
      @args.options  do |opts|
        opts.banner = ["Usage: features2cards [options] [ [FILE|DIR] ]+", "",
          "Examples:",
          "features2cards features2cards.feature",
          "features2cards examples/i18n/it",
        ].join("\n")
        opts.on("-o", "--out [FILE]",
          "Specify pdf output file (Default: #{@options[:pdf_file]}).") do |v|
          @options[:pdf_file] = v
        end
        opts.on_tail("--version", "Show version.") do
          @out_stream.puts VERSION::STRING
          Kernel.exit
        end
        opts.on_tail("-h", "--help", "You're looking at it.") do
          @out_stream.puts opts.help
          Kernel.exit
        end
    end.parse!

      # Whatever is left after option parsing is the FILE arguments
      @paths += args
    end

    def load_cucumber
      Cucumber::Ast::Feature.class_eval do
        attr_reader :scenarios
      end
    end

    def cards
      features_to_cards(features)
    end

    def features
      feature_files.map do |file|
        Cucumber::FeatureFile.new(file).parse(Cucumber::StepMother.new, {})
      end
    end

    def feature_files
      potential_feature_files = @paths.map do |path|
        path = path.gsub(/\\/, '/') # In case we're on windows. Globs don't work with backslashes.
        path = path.chomp('/')
        File.directory?(path) ? Dir["#{path}/**/*.feature"] : path
      end.flatten.uniq
      potential_feature_files
    end


    def parser
      @parser ||= Cucumber::Parser::FeatureParser.new
    end

    def features_to_cards(features)
      features.map do |feature|
        [Card.for_feature(feature)]
      end.flatten
    end

    def generate_pdf(cards)
      Prawn::Document.generate_cards(@options[:pdf_file], cards)
    end

    def usage
      @error_stream.puts "ERROR: No feature files given"
      @error_stream.puts "Type 'features2cards --help' for usage."
    end

    def default_options
      {
        :pdf_file => "cards.pdf"
      }
    end

  end
end
