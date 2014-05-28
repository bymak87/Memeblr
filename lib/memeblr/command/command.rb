require 'ostruct'

module MEMEBLR
  class Command

    def self.run(data)
      self.new.run(data)
    end

    def self.add(data)
      self.new.add(data)
    end

    def self.get(data)
      self.new.get(data)
    end

    def self.delete(data)
      self.new.delete(data)
    end

    def self.edit(data)
      self.new.edit(data)
    end

    def failure(error_sym, data={})
      CommandFailure.new(data.merge :error => error_sym)
    end

    def success(data={})
      CommandSuccess.new(data)
    end
  end

  class CommandFailure < OpenStruct
    def success?
      false
    end
  end

  class CommandSuccess < OpenStruct
    def success?
      true
    end
  end
end
