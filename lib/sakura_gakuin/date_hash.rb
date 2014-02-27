require 'date'

module SakuraGakuin
  class DateHash < Hash
    attr_reader :sorted_keys
    @sorted_keys = []

    def []=(key, value)
      super(key, value)
      @sorted_keys = keys.sort
      @pure_hash = nil
    end

    def [](key)
      case key
      when Date
      else
        key = Date.parse(key.to_s)
      end

      pre_key = nil
      @sorted_keys.each do |k|
        break if key<k
        pre_key = k
      end

      super(pre_key)
    end

    def each(&block)
      enum = Enumerator.new {
        @sorted_keys.each do |key|
          yield [key, self[key]]
        end
      }
      enum.each(&block)
    end

    def to_hash
      @pure_hash ||= Hash[self]
    end
  end
end
