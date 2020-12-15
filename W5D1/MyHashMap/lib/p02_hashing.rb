class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.each_with_index.inject(0) do |accu, (ele, idx)|
      (ele.hash + idx.hash) ^ accu
    end
  end
end

class String
  def hash
    self.chars.map { |char| char.ord }.hash
  end
end

class Hash
  def hash
    self.to_a.sort.hash
  end
end
