class Test

  TESTFILE = "test.txt"

  def initialize
    @name    = "rubytest"
    @surname = "mikamai"
    @email   = "rubytest@mikamai.com"
    @fake    = "fake"
    spec_chain
  end

  def assert condition, message
    if condition
      puts "* #{message}"
    else
      puts "ERROR: #{message}"
    end
  end

  def test_add (book)
    params = {name: @name, surname: @surname, email: @email}
    book.add params

    
    assert book.find(@name).size == 1, 'Record added'
  end

  def test_find (book)
    puts "* Search success on name    #{@name}" if book.find(@name).size == 1
    puts "* Search success on surname #{@surname}" if book.find(@surname).size == 1
    puts "* Search success on email   #{@email}" if book.find(@email).size == 1
    puts "* Search success on fake    #{@fake}" if book.find(@fake).size == 0
  end

  def test_remove (book)
    test_add book
    book.remove(0)
    puts "* Record successfully removed" if book.find(@name).size == 0
  end

  def delete_file
    File.delete(TESTFILE)
    puts "* File #{TESTFILE} successfully deleted" if !File.exists?(TESTFILE)
  end

  def create_file
    @file = File.open(TESTFILE, "w+") { |file| file.write("") }
    puts "* File #{TESTFILE} successfully created" if File.exists?(TESTFILE)
  end

  def spec_chain
    puts "* TEST BEGINS *"
    methods.grep(/^test_/).each do |test_name|
      
      create_file
      book = AddressBook.new(TESTFILE)
      book.load
      send(test_name, book)
      book.save
      delete_file
      
    end
    puts "* TEST END *"
  end

end