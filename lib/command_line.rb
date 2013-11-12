class AddressBookCommandLine
  def initialize address_book
    @address_book = address_book
  end
  attr_reader :address_book

  def start
    loop do
      puts "Inserire un comando: "
      puts
      puts " 1) Mostra la rubrica"
      puts " 2) Aggiungi indirizzo"
      puts " 3) Cerca elemento"
      puts " 4) Elimina elemento"
      puts " q) Esci"
      input = $stdin.gets.chomp

      case input
      when "1"
        clear_screen
        list address_book.contacts
      when "2"
        add
      when "3"
        query
      when "4"
        clear_screen
        list address_book.contacts
        delete
      when "q"
        clear_screen
        address_book.save
        puts "Ciao ciao"
        break #exit
      else
        clear_screen
        puts "Comando non valido '#{input}'"
      end
    end
  end

  def list contacts
    contacts.each_with_index do |record, index|
       puts "#{index+1}) #{record.name}, #{record.surname}, #{record.email}"
     puts   
    end
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def add

    puts "Inserisci un nome"
    name = $stdin.gets.chomp
    puts "Inserisci il cognome"
    surname = $stdin.gets.chomp
    puts "Inserisci l'indirizzo e-mail"
    email = $stdin.gets.chomp

    address_book.add name: name.strip, surname:surname.strip, email: email.strip

    puts "Hai aggiunto alla rubrica il contatto #{name}, #{surname}, #{email}"
    puts
  end

  def query
    puts "Inserisci un campo di ricerca"
    search = $stdin.gets.chomp
    result = address_book.find search
    list result
    puts
  end


  def delete

    puts "Quale vuoi cancellare?"
    index = $stdin.gets.chomp.to_i
    removed = address_book.contacts.at(index)
    puts "rimosso #{removed.name}"
    address_book.remove(index-1)

    clear_screen
  end

end