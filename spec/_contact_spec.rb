# describe AddressBook::Contact do
#   describe '#==' do
#     it 'uses the id' do
#       contact1 = described_class.new id: :pippo
#       contact2 = described_class.new id: :pippo
#       contact3 = described_class.new id: 1234

#       expect(contact1).to     eq(contact2)
#       expect(contact1).not_to eq(contact3)
#     end
#   end
# end