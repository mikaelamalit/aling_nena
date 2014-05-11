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

    a = change
	@thousands, b = a.divmod(1000)
	@fivehundreds, c = b.divmod(500)
	@hundreds, d = c.divmod(100)
	@fifties, e = d.divmod(50)
	@twenties, f = e.divmod(20)
	@tens, g = f.divmod(10)
	@fives, h = g.divmod(5)
	@ones = h

	coinbill = {:thousands => @thousands, :five_hundreds => @fivehundreds, :hundreds => @hundreds, :fifties => @fifties, :twenties => @twenties, :tens => @tens, :fives => @fives, :ones => @ones}
  
    "P#{payment} ang ibinayad niyo.<br/><br/> P#{change} ang sukli niyo.<br/>
    Ito po ang #{coinbill[:thousands]} na piraso ng P1000, <br/>
    #{coinbill[:five_hundreds]} na piraso ng P500, <br/>
    #{coinbill[:hundreds]} na piraso ng P100, <br/>
    #{coinbill[:fifties]} na piraso ng P50, <br/>
    #{coinbill[:twenties]} na piraso ng P20, <br/>
    #{coinbill[:tens]} na piraso ng P10, <br/>
    #{coinbill[:fives]} na piraso ng P5, at<br/>
    #{coinbill[:ones]} na piraso ng P1."
  end

end