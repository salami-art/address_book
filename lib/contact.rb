 class Contact < AddressBook
    def initialize attributes
      attributes[:id] ||= Time.now.to_f+rand(1000) 
      @attributes = attributes
    end

    attr_reader :attributes

    def name
      attributes[:name]
    end

    def surname
      attributes[:surname]
    end

    def email
      attributes[:email]
    end

    def [] name
      warn "please use ##{name} instead"
      attributes[name]
    end

    def == other
      other.id == id if other.is_a? Contact
    end

    def self.from_line line
      name, surname, email = line.split(SEPARATOR)
      new name: name.strip, surname:surname.strip, email: email.strip
    end

    def to_line
      self.class.fields.map do |field|
        self.send(field)
      end.join(SEPARATOR)
    end

    SEPARATOR = ', '

    def self.fields
      [:name, :surname, :email]
    end

    protected

    def id
      attributes[:id]
    end
  end