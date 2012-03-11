class CartesianProduct
  include Enumerable
  def initialize(col1,col2)
    @colection1 = col1
    @colection2 = col2
  end
  def each  
    @colection1.each { |el1|
      @colection2.each { |el2| 
       yield ([el1,el2])
      }
    }
  end
end

