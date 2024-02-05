require 'bundler'
Bundler.require


class Gossip
    attr_accessor :author, :content, :id

    def initialize(author, content)
        @content = content
        @author = author
        @id = id
    end

    def save
      CSV.open("./db/gossip.csv", "ab") do |csv|
        csv << [@author, @content]
      end
    end

    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end

    def self.find(id)
        all_gossips = self.all
        return all_gossips[id - 1] if id >= 1 && id <= all_gossips.length
        nil
    end

end


