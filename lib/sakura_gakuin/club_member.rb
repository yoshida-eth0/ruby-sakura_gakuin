require 'sakura_gakuin/yaml_loadable'

module SakuraGakuin
  class ClubMember
    include YamlLoadable

    yaml_load "config/club_members.yml"

    primary_key :club_id, :member_id
    create_index :club_id
    create_index :member_id


    # club personal data

    attr_reader :club_id
    attr_reader :member_id

    def name_ja
      @name_ja || member.name_ja
    end

    def name_en
      @name_en || member.name_en
    end

    alias :name :name_ja

    attr_reader :admission_date
    attr_reader :graduation_date
    
    def admitted?(date=Date.today)
      admission_date<=date
    end

    def graduated?(date=Date.today)
      graduation_date && graduation_date<date
    end

    def active?(date=Date.today)
      admitted?(date) && !graduated?(date)
    end


    # relations

    def club
      Club[club_id]
    end

    def member
      Member[member_id]
    end
  end
end
