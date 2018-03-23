class Frigo:

  T_EXT = 22
  T_IN  = 3
  T_NOW = 3

  def open_door(self, time):
    
    self.t_o = 0;
    
    print("door open")

    while self.t_o < time and self.T_NOW < self.T_EXT:
      self.T_NOW += 0.1
      self.t_o += 1
      print ("temp : ", self.T_NOW, " | time : ", self.t_o)
      
    self.__close_door__()

  def __close_door__(self):
    
    print("door close ")

    while self.T_NOW > self.T_IN:
      self.T_NOW -= 0.1
      print("temp : ", self.T_NOW)

def main():
  frigo = Frigo()
  frigo.open_door(5)
  print("end of the program")

main()
