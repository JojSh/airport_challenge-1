class Weather

    attr_reader :number

    def initialize
       @number = 0
    end

    def storm_creator
      @number = rand(10)+1
    end

    def is_stormy?
      @number < 3 ? true : false
    end


end
