class Transfer
  # your code here

attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
end

def valid?
  sender.valid? && receiver.valid? 
end

def execute_transaction
  if valid? && sender.balance > @amount && self.status == "pending"
    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"
  else
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    end
  end
end 
end
