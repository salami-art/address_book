require_relative '../bin/address_book'

describe AddressBook do
  TESTFILE = "test.txt"

  before do
    book.load
    @name    = "rubytest"
    @surname = "mikamai"
    @email   = "rubytest@mikamai.com"
    @fake    = "fake"
    @params = {name: @name, surname: @surname, email: @email}
  end

  describe '#add' do
    it 'adds a contact' do
      book.add @params
      expect(book.find(@name).size).to eq(1)
    end
  end

  describe '#find' do
    before { book.add @params }

    it('can search by name')    { expect(book.find(@name).size).to eq(1) }
    it('can search by surname') { expect(book.find(@surname).size).to eq(1) }
    it('can search by email')   { expect(book.find(@email).size).to eq(1) }
    it('can search by fake')    { expect(book.find(@fake).size).to eq(0) }
  end

  def book
    @book ||= AddressBook.new TESTFILE
  end

  describe '#remove' do
    before do
      book.add @params
    end
    it 'removes a contact' do
      book.remove(0)
      expect(book.find(@name).size).to eq(0)
    end
  end

  # describe '#remove' do
  #   before do
  #     4.times do |n|
  #       book.add name: "caio#{n}", surname: "pippo#{n}", email: "email#{n}@mail.com"
  #     end
  #     book.add @params
  #   end

  #   it 'removes a contact' do
  #     contact = book.find(@name).first
  #     book.remove(contact)
  #     expect(book.find(@name)).to be_empty
  #   end
  # end

end

# require '_contact_spec.rb'
# require '_command line.rb'