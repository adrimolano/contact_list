require_relative 'contact'

class ContactList
  
  def self.main_menu
    if ARGV.empty?

        puts "Here is the list of commands:"
        puts "      new  - Create a new contact"
        puts "      list - List all contacts"
        puts "      show - Show a contact"
        puts "      search - Search contacts"
    end
  end

  def self.run_comm

    #ARGV[0] = gets.chomp.downcase
      case ARGV[0]
        when "new"
         puts "Please enter First Name and Last Name:"
         name = $stdin.gets.chomp
         puts "Please enter your Email:"
         email = $stdin.gets.chomp
         Contact.create(name, email)
        puts "#{name} has been added with email address: #{email}."
          # else    
          #   puts "That contact already exists."
          # end
    
        when "list"
          Contact.all.each{|x| puts x.name + x.email}
            # CSV.open('contact.csv', 'w') do |csv_object|
            #   contact.array.each do |row_array|
            #   csv_object << row_array
            #   end
            # end
             # CSV.parse(File.read('contact.csv')) do |row|
             # puts row.inspect
        when "show"
              id = ARGV[1]
              contact = Contact.find(id)
              puts "Your contact, #{contact.name} has id no.: #{contact.id}."

        when "search"
              term = ARGV[1]
              puts Contact.search(term)
            Contact.search.each{|x| puts x.name + x.email}
             #  else
             #  puts "No contact with : #{term}"
             # end
             # contact =[]
             # CSV.foreach(contact.cvs) do |row|
              
          end
      end        
  
end
  # Interfaces between a user and their contact list. Reads from and writes to standard I/O.

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.


ContactList.main_menu
ContactList.run_comm