class AddressBook
 
   def initialize(path)
    @contacts = []
    @path = Pathname.new(path)
    @fields = Contact.fields
    unless @path.exist?
      @path.open('w+') { |file| file.write('') }
    end
  end

  attr_reader :contacts, :fields

  def add attributes
    contacts << Contact.new(attributes)
  end

  def find search
    search = /#{search}/i
    contacts.find_all do |contact|
      fields.any? do |field|
        contact.send(field) =~ search
      end
    end
  end

  def query *args, &block
    warn '#query is deprecated, please use #find instead.'
    find(*args, &block)
  end

  def remove index
   # contacts.delete_at(index)
   contacts.reject! do |stored_contact|
      contacts.at(index) == stored_contact
    end
  end

  def load
    File.open @path, "r" do |file|
      file.each do |line|
        contacts << Contact.from_line(line)
      end
    end
  end

  def save
    File.open @path, 'w' do |file|
      contacts.each do |record|
        file.puts record.to_line
      end
    end
  end
end