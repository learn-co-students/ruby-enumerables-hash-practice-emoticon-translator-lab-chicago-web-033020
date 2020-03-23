# require modules here
require "yaml"

def load_library(file)
  library = {:get_meaning => {}, :get_emoticon => {}}
  emoticons = YAML.load_file(file)
  emoticons.each do |key, value|
      library[:get_meaning][value[1]] = key
      library[:get_emoticon][value[0]] = emoticons[key][1]
  end
  library
end
#######################
def get_japanese_emoticon(file, emoticon)
  japanese_emoticon = load_library(file)[:get_emoticon][emoticon]
  japanese_emoticon ? japanese_emoticon : "Sorry, that emoticon was not found"
  end
############################
def get_english_meaning(file, emoticon)
  meaning = load_library(file)[:get_meaning][emoticon]
  meaning ? meaning : "Sorry, that emoticon was not found"
  end
