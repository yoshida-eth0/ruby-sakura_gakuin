require 'sakura_gakuin/yaml_loadable'

module SakuraGakuin
  class Angel
    include YamlLoadable

    yaml_load "config/angels.yml"

    primary_key :id

    # angel data

    attr_reader :name_ja
    attr_reader :name_en
    alias :name :name_ja

    attr_reader :catchphrase
    attr_reader :hobby
    attr_reader :worry
    attr_reader :favorite_subject
    attr_reader :emoticon


    # relations

    def member
      Member[id]
    end
  end
end
