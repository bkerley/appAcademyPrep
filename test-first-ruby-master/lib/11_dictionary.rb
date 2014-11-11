class Dictionary
  attr_accessor :entries
  def initialize
    @entries = {}
  end

  def add(*entry)
    entry = entry[0] 
    
    return @entries.merge! entry if entry.is_a? Hash
    
    @entries.store(entry,nil)
  end

  def keywords
    @entries.keys.sort 
  end

  def include?(key)
    @entries.has_key? key
  end

  def find(word)
    @entries.select do |key, value|
      key.start_with?(word)
    end
  end

  def printable
    @entries.keys.sort.map do |word|
      "[#{word}] #{@entries[word].inspect}"
    end.join("\n")
  end
end
