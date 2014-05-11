class MoneyCalculator
	attr_accessor :ones, :fives, :tens, :twenties, :fifties, :hundreds, :five_hundreds, :thousands, :total

	def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands, total)
  	self.ones = ones
  	self.fives = fives
  	self.tens = tens
  	self.twenties = twenties
  	self.fifties = fifties
  	self.hundreds = hundreds
  	self.five_hundreds = five_hundreds
  	self.thousands = thousands
    self.total = total
  end

  def change
  	c_fives = self.fives.to_i * 5
  	c_tens = self.tens.to_i * 10
  	c_twenties = self.twenties.to_i * 20
  	c_fifties = self.fifties.to_i * 50
  	c_hundreds = self.hundreds.to_i * 100
  	c_five_hundreds = self.five_hundreds.to_i * 500
  	c_thousands = self.thousands.to_i * 1000
  	payment = self.ones.to_i + c_fives + c_tens + c_twenties + c_fifties + c_hundreds + c_five_hundreds + c_thousands
    change = payment.to_i - self.total.to_i
    "P#{payment} ang ibinayad niyo.<br/><br/> P#{change} ang sukli niyo."
  end

end