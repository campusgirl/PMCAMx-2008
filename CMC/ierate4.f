      subroutine ierate4(neq,t,y,rate,rk,r,gain,loss)
c
c-----CAMx v4.02 030709
c
c     IERATE4 computes rates for LSODE in the IEH solver
c
c     Copyright 1997, 1998, 1999, 2000, 2001, 2002, 2003
c     ENVIRON International Corporation
c
c     Routines Called:
c        IERXN4
c
c     Called by:
c        LSODE
c
      include "camx.prm"
      include "iehchem.com"
c
      integer l, neq(3)
      real rate(neq(1)), y(neq(2)+6)
      real loss(neq(2)+1), gain(neq(2)+1), r(neq(3)), rk(neq(3))
      real t, H2O, M, O2, CH4, H2
c
c --- Entry point
c
      ny=neq(2)
      nk=neq(3)
      H2O = y(ny+2)
      M   = y(ny+3)
      O2  = y(ny+4)
      CH4 = y(ny+5)
      H2  = y(ny+6)
c
      do l=1,ny
        Loss(l) = 0.0
        Gain(l) = 0.0
      enddo
c
c --- Get the reaction rates
c
      call ierxn4(y,ny,r,rk,nk)
c
c --- Solve the steady state species
c
c
c   O1D
c
        Loss(iO1D  )= +( 1.000)*r( 10)+( 1.000)*r( 11)
        Gain(iO1D  )= +( 1.000)*r(  9)
      if (loss(iO1D).gt.1.0e-25.or.loss(iO1D).lt.-1.0e-25) then
        y(iO1D) = gain(iO1D)/loss(iO1D)*y(iO1D)
      else
        y(iO1D) = 0.0
      endif
      r( 10) = rk( 10)*y(iO1D)
      r( 11) = rk( 11)*y(iO1D)*H2O
c
c     O
c
        Loss(iO    )= +( 1.000)*r(  2)+( 1.000)*r(  4)+( 1.000)*r(  5)
     &                +( 1.000)*r(  6)+( 1.000)*r( 40)+( 1.000)*r( 42)
     &                +( 1.000)*r( 56)+( 1.000)*r( 60)+( 1.000)*r( 75)
     &                +( 1.000)*r( 97)
        Gain(iO    )= +( 1.000)*r(  1)+( 1.000)*r(  8)+( 1.000)*r( 10)
     &                +( 0.890)*r( 14)
      if (loss(iO).gt.1.0e-25.or.loss(iO).lt.-1.0e-25) then
        y(iO) = gain(iO)/loss(iO)*y(iO)
      else
        y(iO) = 0.0
      endif
      r(  2) = rk(  2)*y(iO)
      r(  4) = rk(  4)*y(iO)*y(iNO2)
      r(  5) = rk(  5)*y(iO)*y(iNO2)
      r(  6) = rk(  6)*y(iO)*y(iNO)
      r( 40) = rk( 40)*y(iFORM)*y(iO)
      r( 42) = rk( 42)*y(iALD2)*y(iO)
      r( 56) = rk( 56)*y(iO)*y(iOLE)
      r( 60) = rk( 60)*y(iO)*y(iETH)
      r( 75) = rk( 75)*y(iO)*y(iISOP)
      r( 97) = rk( 97)*y(iO)*y(iOLE2)
c
c --- Calculate the species rates
c
c
c  N2O5   NO3    OH   HO2  C2O3   XO2  XO2N   TO2   ROR   CRO
c    NO   NO2    O3   PAN
c
        Loss(iN2O5 )= +( 1.000)*r( 18)+( 1.000)*r( 19)
        Gain(iN2O5 )= +( 1.000)*r( 17)
        Loss(iNO3  )= +( 1.000)*r( 14)+( 1.000)*r( 15)+( 1.000)*r( 16)
     &                +( 1.000)*r( 17)+( 1.000)*r( 41)+( 1.000)*r( 44)
     &                +( 1.000)*r( 59)+( 1.000)*r( 67)+( 1.000)*r( 78)
     &                +( 1.000)*r( 94)+( 1.000)*r(100)
        Gain(iNO3  )= +( 1.000)*r(  5)+( 1.000)*r(  7)+( 1.000)*r( 19)
     &                +( 1.000)*r( 27)
        Loss(iOH   )= +( 1.000)*r( 12)+( 1.000)*r( 22)+( 1.000)*r( 24)
     &                +( 1.000)*r( 26)+( 1.000)*r( 27)+( 1.000)*r( 31)
     &                +( 1.000)*r( 35)+( 1.000)*r( 36)+( 1.000)*r( 37)
     &                +( 1.000)*r( 43)+( 1.000)*r( 51)+( 1.000)*r( 52)
     &                +( 1.000)*r( 57)+( 1.000)*r( 61)+( 1.000)*r( 63)
     &                +( 1.000)*r( 66)+( 1.000)*r( 70)+( 1.000)*r( 72)
     &                +( 1.000)*r( 73)+( 1.000)*r( 76)+( 1.000)*r( 82)
     &                +( 1.000)*r( 84)+( 1.000)*r( 85)+( 1.000)*r( 90)
     &                +( 1.000)*r( 92)+( 1.000)*r( 98)
        Gain(iOH   )= +( 2.000)*r( 11)+( 1.000)*r( 13)+( 1.000)*r( 23)
     &                +( 1.000)*r( 28)+( 2.000)*r( 34)+( 1.000)*r( 40)
     &                +( 1.000)*r( 42)+( 0.790)*r( 50)+( 0.200)*r( 56)
     &                +( 0.100)*r( 58)+( 0.300)*r( 60)+( 0.080)*r( 71)
     &                +( 0.266)*r( 77)+( 0.268)*r( 93)+( 0.200)*r( 97)
     &                +( 0.100)*r( 99)
        Loss(iHO2  )= +( 1.000)*r( 13)+( 1.000)*r( 28)+( 1.000)*r( 29)
     &                +( 2.000)*r( 32)+( 2.000)*r( 33)+( 1.000)*r( 50)
     &                +( 1.000)*r( 86)+( 1.000)*r( 87)+( 1.000)*r( 90)
        Gain(iHO2  )= +( 1.000)*r( 12)+( 1.000)*r( 30)+( 1.000)*r( 35)
     &                +( 1.000)*r( 36)+( 1.000)*r( 37)+( 2.000)*r( 38)
     &                +( 1.000)*r( 40)+( 1.000)*r( 41)+( 2.000)*r( 45)
     &                +( 1.000)*r( 46)+( 2.000)*r( 49)+( 0.790)*r( 50)
     &                +( 1.000)*r( 51)+( 0.110)*r( 52)+( 0.940)*r( 53)
     &                +( 1.000)*r( 54)+( 0.380)*r( 56)+( 1.000)*r( 57)
     &                +( 0.440)*r( 58)+( 1.700)*r( 60)+( 1.000)*r( 61)
     &                +( 0.120)*r( 62)+( 0.440)*r( 63)+( 0.900)*r( 64)
     &                +( 1.000)*r( 65)+( 0.600)*r( 66)+( 1.000)*r( 69)
        Gain(iHO2  ) = Gain(iHO2  )
     &                +( 2.000)*r( 70)+( 0.760)*r( 71)+( 0.700)*r( 72)
     &                +( 1.000)*r( 74)+( 0.250)*r( 75)+( 0.912)*r( 76)
     &                +( 0.066)*r( 77)+( 0.800)*r( 78)+( 1.000)*r( 82)
     &                +( 1.000)*r( 84)+( 1.000)*r( 85)+( 0.503)*r( 92)
     &                +( 0.154)*r( 93)+( 0.925)*r( 94)+( 1.033)*r( 95)
     &                +( 0.800)*r( 96)+( 0.380)*r( 97)+( 1.000)*r( 98)
     &                +( 0.440)*r( 99)
        Loss(iC2O3 )= +( 1.000)*r( 46)+( 1.000)*r( 47)+( 2.000)*r( 49)
     &                +( 1.000)*r( 50)
        Gain(iC2O3 )= +( 1.000)*r( 42)+( 1.000)*r( 43)+( 1.000)*r( 44)
     &                +( 1.000)*r( 48)+( 1.000)*r( 69)+( 1.000)*r( 70)
     &                +( 0.620)*r( 71)+( 1.000)*r( 73)+( 1.000)*r( 74)
     &                +( 0.250)*r( 75)+( 0.200)*r( 77)+( 0.498)*r( 92)
     &                +( 0.114)*r( 93)+( 0.075)*r( 94)+( 0.967)*r( 95)
        Loss(iXO2  )= +( 1.000)*r( 79)+( 2.000)*r( 80)+( 1.000)*r( 86)
     &                +( 1.000)*r( 89)
        Gain(iXO2  )= +( 1.000)*r( 45)+( 1.000)*r( 46)+( 2.000)*r( 49)
     &                +( 0.790)*r( 50)+( 1.000)*r( 51)+( 0.870)*r( 52)
     &                +( 0.960)*r( 53)+( 0.280)*r( 56)+( 1.000)*r( 57)
     &                +( 0.220)*r( 58)+( 0.910)*r( 59)+( 0.700)*r( 60)
     &                +( 1.000)*r( 61)+( 0.080)*r( 63)+( 0.600)*r( 66)
     &                +( 1.000)*r( 70)+( 0.030)*r( 71)+( 0.500)*r( 72)
     &                +( 1.000)*r( 73)+( 0.250)*r( 75)+( 0.991)*r( 76)
     &                +( 0.200)*r( 77)+( 1.000)*r( 78)+( 0.713)*r( 92)
     &                +( 0.064)*r( 93)+( 0.075)*r( 94)+( 0.700)*r( 95)
        Gain(iXO2  ) = Gain(iXO2  )
     &                +( 1.000)*r( 96)+( 0.280)*r( 97)+( 1.000)*r( 98)
     &                +( 0.220)*r( 99)+( 0.910)*r(100)
        Loss(iXO2N )= +( 1.000)*r( 81)+( 1.000)*r( 87)+( 2.000)*r( 88)
     &                +( 1.000)*r( 89)
        Gain(iXO2N )= +( 0.130)*r( 52)+( 0.040)*r( 53)+( 0.020)*r( 56)
     &                +( 0.090)*r( 59)+( 0.088)*r( 76)+( 0.020)*r( 97)
     &                +( 0.090)*r(100)
        Loss(iTO2  )= +( 1.000)*r( 64)+( 1.000)*r( 65)
        Gain(iTO2  )= +( 0.560)*r( 63)+( 0.300)*r( 72)
        Loss(iROR  )= +( 1.000)*r( 53)+( 1.000)*r( 54)+( 1.000)*r( 55)
        Gain(iROR  )= +( 0.760)*r( 52)
        Loss(iCRO  )= +( 1.000)*r( 68)+( 1.000)*r( 91)
        Gain(iCRO  )= +( 0.400)*r( 66)+( 1.000)*r( 67)
        Loss(iNO   )= +( 1.000)*r(  3)+( 1.000)*r(  6)+( 1.000)*r( 15)
     &                +( 2.000)*r( 20)+( 1.000)*r( 21)+( 1.000)*r( 22)
     &                +( 1.000)*r( 28)+( 1.000)*r( 46)+( 1.000)*r( 64)
     &                +( 1.000)*r( 79)+( 1.000)*r( 81)
        Gain(iNO   )= +( 1.000)*r(  1)+( 1.000)*r(  4)+( 0.110)*r( 14)
     &                +( 1.000)*r( 16)+( 1.000)*r( 23)+( 1.000)*r( 25)
     &                +( 0.200)*r( 96)
        Loss(iNO2  )= +( 1.000)*r(  1)+( 1.000)*r(  4)+( 1.000)*r(  5)
     &                +( 1.000)*r(  7)+( 1.000)*r( 16)+( 1.000)*r( 17)
     &                +( 1.000)*r( 21)+( 1.000)*r( 26)+( 1.000)*r( 29)
     &                +( 1.000)*r( 47)+( 1.000)*r( 55)+( 1.000)*r( 68)
     &                +( 1.000)*r( 96)
        Gain(iNO2  )= +( 1.000)*r(  3)+( 1.000)*r(  6)+( 0.890)*r( 14)
     &                +( 2.000)*r( 15)+( 1.000)*r( 16)+( 1.000)*r( 19)
     &                +( 2.000)*r( 20)+( 1.000)*r( 24)+( 1.000)*r( 25)
     &                +( 1.000)*r( 28)+( 1.000)*r( 30)+( 1.000)*r( 31)
     &                +( 1.000)*r( 46)+( 1.000)*r( 48)+( 1.000)*r( 59)
     &                +( 0.900)*r( 64)+( 0.200)*r( 78)+( 1.000)*r( 79)
     &                +( 1.000)*r(100)
        Loss(iO3   )= +( 1.000)*r(  3)+( 1.000)*r(  7)+( 1.000)*r(  8)
     &                +( 1.000)*r(  9)+( 1.000)*r( 12)+( 1.000)*r( 13)
     &                +( 1.000)*r( 58)+( 1.000)*r( 62)+( 1.000)*r( 71)
     &                +( 1.000)*r( 77)+( 1.000)*r( 93)+( 1.000)*r( 99)
        Gain(iO3   )= +( 1.000)*r(  2)
        Loss(iPAN  )= +( 1.000)*r( 48)
        Gain(iPAN  )= +( 1.000)*r( 47)
c
      do l=1,neq(1)
        rate(l) = gain(l) -loss(l)
      enddo
c
      return
      end
