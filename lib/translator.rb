# require modules here
require 'pry'
require 'yaml'
def load_library (file_path)
  # code goes here
  
  library_hash = YAML.load(File.read(file_path))
  # binding.pry
  
  # hash.each_with_object({}) do |(k, v), a|
     # a[k] = v + 3
 # end                   # => { a => 5, b => 6 }
  
  library_hash.each_with_object({}) do |(key, value), final_library|
    
    if !final_library[key]
      final_library[key] = {:english => nil, :japanese => nil}
    end
    
    
    final_library[key].each_with_index do |(language, labeled_emoticon), outer_index|
      if !labeled_emoticon
        value.each_with_index do |og_emoticon, index|
          if outer_index == index
            final_library[key][language] = og_emoticon
            # binding.pry
          end
        end
      end
    end
  end
  
end

def get_japanese_emoticon (file_path, e_emoticon)
  # code goes here
  library = load_library(file_path)
 # binding.pry
 
  answer = library.each_with_object("") do |(meaning, symbols), a|
    
    if symbols[:english] == e_emoticon
      a << symbols[:japanese]
    end
  end
  
  if answer.empty?
    answer = "Sorry, that emoticon was not found"
  else
    answer
  end
  
end

def get_english_meaning (file_path, j_emoticon)
  # code goes here
  library = load_library(file_path)
  
  answer = library.each_with_object("") do |(meaning, symbols), a|
    if symbols[:japanese] == j_emoticon
      a << meaning
    end
  end
  
  # binding.pry
  
  if answer.empty?
    answer = "Sorry, that emoticon was not found"
  else
    answer
  end
end