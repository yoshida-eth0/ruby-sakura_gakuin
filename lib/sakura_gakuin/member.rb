require 'sakura_gakuin/date_hash'
require 'sakura_gakuin/yaml_loadable'

module SakuraGakuin
  class Member
    include YamlLoadable

    yaml_load "config/members.yml"

    primary_key :firstname_en, :lastname_en


    # personal data

    attr_reader :firstname_ja
    attr_reader :firstname_kana
    attr_reader :firstname_en
    alias :firstname :firstname_ja

    attr_reader :lastname_ja
    attr_reader :lastname_kana
    attr_reader :lastname_en
    alias :lastname :lastname_ja

    def name_ja(separator="")
      "#{lastname_ja}#{separator}#{firstname_ja}"
    end

    def name_en(separator=" ", reverse=false)
      if reverse
        "#{firstname_en}#{separator}#{lastname_en}"
      else
        "#{lastname_en}#{separator}#{firstname_en}"
      end
    end

    alias :name :name_ja

    attr_reader :nicknames

    attr_reader :birthday

    def age(date=Date.today)
      birthday_md = Date.new(date.year, birthday.month, birthday.day)
      date.year - birthday.year - (date < birthday_md ? 1 : 0)
    end

    attr_reader :birthplace_ja
    attr_reader :birthplace_en
    alias :birthplace :birthplace_ja


    # heights data

    attr_reader :heights

    def month_heights
      @month_heights ||= heights.inject(DateHash.new){|h, (date, height)|
        date = Date.new(date.year, date.month, 1)
        h[date] = height
        h
      }
    end

    def month_height(date=Date.today)
      month_heights[date]
    end

    def height(date=Date.today)
      heights[date]
    end


    # sakrua data

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

    attr_reader :diary_theme

    def diary_url
      "http://ameblo.jp/sakuragakuin/theme-#{diary_theme}.html"
    end

    attr_reader :introductions
    attr_reader :attendances


    # relations

    def club_members
      ClubMember.index_search(:member_id, id)
    end

    def clubs
      club_members.map(&:club)
    end

    def active_club_members(date=Date.today)
      club_members.select{|club_member| club_member.active?(date)}
    end

    def active_clubs(date=Date.today)
      active_club_members.map(&:club)
    end
  end
end
