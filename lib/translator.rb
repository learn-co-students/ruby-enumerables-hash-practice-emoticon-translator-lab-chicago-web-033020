# require modules here
require "yaml"

def load_library(file)
  # code goes here
  emoticons = YAML.load_file(file)
  result = {'get_meaning' => {},
            'get_emoticon'=> {}
          }

  emoticons.each do |key, value|
    result['get_meaning'][value[1]] = key
    result['get_emoticon'][value[0]] = emoticons[key][1]
  end
  result
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  japanese_emoticon = load_library(file)['get_emoticon'][emoticon]
  japanese_emoticon ? japanese_emoticon : "Sorry, that emoticon was not found"

end

def get_english_meaning(file, emoticon)
  # code goes here
  meaning = load_library(file)['get_meaning'][emoticon]
  meaning ? meaning : "Sorry, that emoticon was not found"
end
