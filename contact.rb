require 'csv'
contact = CSV.read('contact.csv')

# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
class Contact

  attr_accessor :name, :email, :id


    def initialize (name, email, id)
      @name = name
      @email = email 
      @id = id 
    end 

  # Provides functionality for managing contacts in the csv file.
  class << self

      def all
        empty_arr =[]
         CSV.foreach("contact.csv") do |row|
          empty_arr.push(Contact.new(row[0], row[1], row[2]))
         end
         return empty_arr
      end



    def next_id
      contacts_arr =[]
      CSV.foreach("contact.csv") do |row|
          contacts_arr.push(Contact.new(row[0], row[1], row[2]))
         end
         contacts_arr.last.id.to_i + 1
    end
   
    def create(name, email)
        id = next_id
        new_contact = [name, email, id]
        CSV.open('contact.csv', "a") do |csv|
        csv << new_contact
        end
        Contact.new(name, email, id)
     end
    # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      contacts_arr =[]
       CSV.foreach("contact.csv") do |row|
          contacts_arr.push(Contact.new(row[0], row[1], row[2]))
         end 
         contacts_arr.detect { |contact| contact.id.to_i == id.to_i }
    end
    
   
    def search(term)
      contacts_arr = []
      CSV.foreach("contact.csv") do |row|
          contacts_arr.push(row) if row[0].include?(term)|| 
      row[1].include?(term) ||
      row[2].include?(term)
    end
    result
  end


      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term
  end
  
end