require 'sakura_gakuin/yaml_loadable'

module SakuraGakuin
  class Club
    include YamlLoadable

    yaml_load "config/clubs.yml"

    primary_key :club_name_en


    # club

    attr_reader :club_name_ja
    attr_reader :club_name_en
    alias :club_name :club_name_ja

    attr_reader :group_name_ja
    attr_reader :group_name_en
    alias :group_name :group_name_ja

    def name_ja(separator=" ")
      "#{club_name_ja}#{separator}#{group_name_ja}"
    end

    def name_en(separator=" ")
      "#{club_name_en}#{separator}#{group_name_en}"
    end

    alias :name :name_ja


    # relations

    def club_members
      ClubMember.index_search(:club_id, id)
    end

    def members
      club_members.map(&:member)
    end

    def active_club_members(date=Date.today)
      club_members.select{|club_member| club_member.active?(date)}
    end

    def active_members(date=Date.today)
      active_club_members.map(&:member)
    end
  end
end
