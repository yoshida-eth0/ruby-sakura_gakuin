require 'yaml'
require 'active_support/concern'

module SakuraGakuin
  module YamlLoadable
    extend ActiveSupport::Concern

    included do
      @data = []
      @indexes = {}
      @index_values = {}

      attr_reader :id
      create_index(:id, true)
    end

    module ClassMethods
      include Enumerable

      def yaml_load(path)
        unless path.start_with?("/")
          base = File.expand_path("../..", File.dirname(__FILE__))
          path = File.expand_path(path, base)
        end

        @data = File.open(path){|f| YAML.load_documents(f)}
        @index_values = {}
      end

      def primary_key(*keys)
        define_method(:id, ->() {
          @id ||= keys.map{|k| send(k)}.join("_").downcase.gsub(" ", "_").to_sym
        })
      end

      def create_index(key, uniq=false)
        @indexes[key] = ->(val) {
          unless @index_values[key]
            if uniq
              @index_values[key] = Hash[@data.map{|item| [item.send(key), item]}]
            else
              @index_values[key] = @data.group_by{|item| item.send(key)}
            end
          end
          @index_values[key][val]
        }
        @index_values.delete(key)
      end

      def index_search(key, val)
        @indexes[key][val]
      end

      def each(&block)
        @data.each(&block)
      end

      def [](id)
        index_search(:id, id)
      end
    end
  end
end
