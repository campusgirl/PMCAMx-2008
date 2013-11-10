      subroutine rateslo5(neq1,r,rate)
c
c-----CAMx v4.02 030709
c
c     RATESLOW computes reaction rates for slow state species
c
c     Copyright 1997, 1998, 1999, 2000, 2001, 2002, 2003
c     ENVIRON International Corporation
c
c     Routines Called:
c        none
c
c     Called by:
c        TRAP
c
      include "camx.prm"
      include "chmstry.com"
c
      real loss(MXSPEC+1),gain(MXSPEC+1),rate(MXSPEC+1),r(MXRXN)
c
      do l=neq1+1,ngas
        Loss(l) = 0.
        Gain(l) = 0.
      enddo
c
c   PAN  PAN2  MPAN  PBZN  NPHE  RNO3  CRES  DCB2  DCB3  HNO4
c  HONO  HNO3    XN  HO2H  HCHO  CCHO  RCHO  BALD  BACL  PROD
c  DCB1  PHEN  ISOP  ISPD   MVK  METH  MGLY   GLY  TERP  HC2H
c  CO2H  CO3H  RC2H  RC3H  ACET   MEK  MEOH  COOH  ROOH    CO
c  ETHE  ALK1  ALK2  ALK3  ALK4  ALK5  ARO1  ARO2  OLE1  OLE2
c   SO2  SULF
c
        Loss(kPAN  )= +( 1.000)*r( 70)
        Gain(kPAN  )= +( 1.000)*r( 69)
        Loss(kPAN2 )= +( 1.000)*r( 80)
        Gain(kPAN2 )= +( 1.000)*r( 79)
        Loss(kMPAN )= +( 1.000)*r(103)
        Gain(kMPAN )= +( 1.000)*r(102)
        Loss(kPBZN )= +( 1.000)*r( 91)
        Gain(kPBZN )= +( 1.000)*r( 90)
        Loss(kNPHE )= +( 1.000)*r(157)
        Gain(kNPHE )= +( 1.000)*r(117)+( 1.000)*r(121)+( 1.000)*r(122)
        Loss(kRNO3 )= +( 1.000)*r(176)+( 1.000)*r(177)
        Gain(kRNO3 )= +( 1.000)*r( 62)+( 1.000)*r(115)+( 0.572)*r(172)
     &                +( 0.310)*r(176)+( 0.813)*r(191)+( 0.276)*r(195)
     &                +( 0.511)*r(206)+( 0.321)*r(210)
        Loss(kCRES )= +( 1.000)*r(155)+( 1.000)*r(156)
        Gain(kCRES )= +( 0.207)*r(202)+( 0.187)*r(203)
        Loss(kDCB2 )= +( 1.000)*r(180)+( 1.000)*r(181)
        Gain(kDCB2 )= +( 0.108)*r(202)+( 0.099)*r(203)
        Loss(kDCB3 )= +( 1.000)*r(182)+( 1.000)*r(183)
        Gain(kDCB3 )= +( 0.051)*r(202)+( 0.093)*r(203)
        Loss(kHNO4 )= +( 1.000)*r( 33)+( 1.000)*r( 34)+( 1.000)*r( 35)
        Gain(kHNO4 )= +( 1.000)*r( 32)
        Loss(kHONO )= +( 1.000)*r( 22)+( 1.000)*r( 23)+( 1.000)*r( 24)
        Gain(kHONO )= +( 1.000)*r( 21)
        Loss(kHNO3 )= +( 1.000)*r( 27)+( 1.000)*r( 28)
        Gain(kHNO3 )= +( 2.000)*r( 13)+( 1.000)*r( 25)+( 0.200)*r( 39)
     &                +( 1.000)*r(129)+( 1.000)*r(132)+( 1.000)*r(135)
     &                +( 1.000)*r(148)+( 1.000)*r(151)+( 1.000)*r(154)
     &                +( 1.000)*r(156)+( 1.000)*r(157)+( 1.000)*r(160)
     &                +( 0.500)*r(163)+( 0.150)*r(172)

        Gain(kXN   )= +( 2.000)*r(120)+( 0.500)*r(163)+( 0.278)*r(172)
     &                +( 0.352)*r(176)+( 1.000)*r(187)+( 0.250)*r(195)
     &                +( 0.489)*r(206)+( 0.288)*r(210)
        Loss(kHO2H )= +( 1.000)*r( 41)+( 1.000)*r( 42)
        Gain(kHO2H )= +( 1.000)*r( 37)+( 1.000)*r( 38)
        Loss(kHCHO )= +( 1.000)*r(123)+( 1.000)*r(124)+( 1.000)*r(125)
     &                +( 1.000)*r(126)+( 1.000)*r(129)
        Gain(kHCHO )= +( 1.000)*r( 46)+( 1.000)*r( 48)+( 1.000)*r( 49)
     &                +( 2.000)*r( 50)+( 0.750)*r( 54)+( 0.750)*r( 64)
     &                +( 1.000)*r( 74)+( 1.000)*r( 84)+( 1.000)*r( 95)
     &                +( 1.000)*r(104)+( 1.000)*r(106)+( 1.000)*r(107)
     &                +( 1.000)*r(111)+( 1.000)*r(112)+( 1.000)*r(113)
     &                +( 2.000)*r(114)+( 1.000)*r(127)+( 1.000)*r(136)
     &                +( 0.115)*r(138)+( 1.000)*r(140)+( 0.350)*r(141)
     &                +( 1.000)*r(142)+( 1.000)*r(146)+( 0.084)*r(161)
     &                +( 0.200)*r(162)+( 0.670)*r(165)+( 0.300)*r(166)
        Gain(kHCHO ) = Gain(kHCHO )
     &                +( 0.100)*r(167)+( 0.055)*r(170)+( 0.125)*r(171)
     &                +( 0.227)*r(172)+( 0.300)*r(173)+( 0.213)*r(174)
     &                +( 0.506)*r(175)+( 0.010)*r(176)+( 0.134)*r(177)
     &                +( 1.610)*r(185)+( 1.000)*r(186)+( 0.191)*r(188)
     &                +( 0.624)*r(189)+( 0.592)*r(190)+( 0.240)*r(192)
     &                +( 0.276)*r(193)+( 0.235)*r(194)+( 0.039)*r(198)
     &                +( 0.026)*r(199)+( 0.024)*r(200)+( 0.026)*r(201)
     &                +( 0.732)*r(204)+( 0.500)*r(205)+( 0.244)*r(208)
        Gain(kHCHO ) = Gain(kHCHO )
     &                +( 0.269)*r(209)+( 0.079)*r(210)
        Loss(kCCHO )= +( 1.000)*r(130)+( 1.000)*r(131)+( 1.000)*r(132)
        Gain(kCCHO )= +( 1.000)*r( 81)+( 1.000)*r( 83)+( 1.000)*r( 88)
     &                +( 2.000)*r( 89)+( 1.000)*r(100)+( 1.000)*r(112)
     &                +( 0.034)*r(133)+( 1.000)*r(134)+( 0.482)*r(138)
     &                +( 1.000)*r(139)+( 0.129)*r(170)+( 0.047)*r(171)
     &                +( 0.467)*r(173)+( 0.084)*r(174)+( 0.246)*r(175)
     &                +( 0.439)*r(176)+( 0.431)*r(177)+( 0.195)*r(185)
     &                +( 0.250)*r(188)+( 1.000)*r(197)+( 0.445)*r(199)
     &                +( 0.455)*r(200)+( 0.099)*r(201)+( 0.294)*r(204)
     &                +( 0.154)*r(205)+( 0.009)*r(206)+( 0.732)*r(208)
        Gain(kCCHO ) = Gain(kCCHO )
     &                +( 0.456)*r(209)+( 0.507)*r(210)
        Loss(kRCHO )= +( 1.000)*r(133)+( 1.000)*r(134)+( 1.000)*r(135)
        Gain(kRCHO )= +( 0.370)*r(138)+( 1.000)*r(143)+( 1.000)*r(144)
     &                +( 1.000)*r(164)+( 0.675)*r(166)+( 0.450)*r(168)
     &                +( 0.013)*r(170)+( 0.218)*r(172)+( 0.558)*r(174)
     &                +( 0.710)*r(175)+( 0.213)*r(176)+( 0.147)*r(177)
     &                +( 1.000)*r(178)+( 1.000)*r(180)+( 1.000)*r(182)
     &                +( 1.000)*r(187)+( 0.474)*r(193)+( 0.205)*r(194)
     &                +( 0.474)*r(195)+( 0.147)*r(196)+( 0.155)*r(198)
     &                +( 0.122)*r(199)+( 0.244)*r(200)+( 0.204)*r(201)
     &                +( 0.497)*r(204)+( 0.363)*r(205)+( 0.037)*r(206)
        Gain(kRCHO ) = Gain(kRCHO )
     &                +( 0.450)*r(207)+( 0.511)*r(208)+( 0.305)*r(209)
     &                +( 0.151)*r(210)+( 0.069)*r(211)
        Loss(kBALD )= +( 1.000)*r(158)+( 1.000)*r(159)+( 1.000)*r(160)
        Gain(kBALD )= +( 0.059)*r(202)+( 0.050)*r(203)+( 0.061)*r(208)
     &                +( 0.042)*r(209)+( 0.015)*r(210)
        Loss(kBACL )= +( 1.000)*r(152)
        Gain(kBACL )= +( 0.031)*r(194)+( 0.087)*r(203)
        Loss(kPROD )= +( 1.000)*r(174)+( 1.000)*r(175)
        Gain(kPROD )= +( 0.500)*r( 64)+( 0.500)*r( 66)+( 1.000)*r( 68)
     &                +( 1.000)*r( 77)+( 1.000)*r( 87)+( 1.000)*r( 98)
     &                +( 0.700)*r(169)+( 0.332)*r(170)+( 0.329)*r(174)
     &                +( 0.048)*r(176)+( 0.435)*r(177)+( 0.100)*r(190)
     &                +( 0.750)*r(192)+( 0.276)*r(193)+( 0.276)*r(194)
     &                +( 0.853)*r(196)+( 0.125)*r(200)+( 0.417)*r(201)
     &                +( 0.055)*r(202)+( 0.119)*r(204)+( 0.215)*r(205)
     &                +( 0.113)*r(207)+( 0.006)*r(209)+( 0.259)*r(211)
        Loss(kDCB1 )= +( 1.000)*r(178)+( 1.000)*r(179)
        Gain(kDCB1 )= +( 0.491)*r(202)+( 0.561)*r(203)
        Loss(kPHEN )= +( 1.000)*r(153)+( 1.000)*r(154)
        Gain(kPHEN )= +( 1.000)*r(118)+( 1.000)*r(119)+( 0.017)*r(202)
        Loss(kISOP )= +( 1.000)*r(189)+( 1.000)*r(190)+( 1.000)*r(191)
     &                +( 1.000)*r(192)

        Loss(kISPD )= +( 1.000)*r(170)+( 1.000)*r(171)+( 1.000)*r(172)
     &                +( 1.000)*r(173)
        Gain(kISPD )= +( 0.357)*r(189)+( 0.936)*r(191)+( 0.025)*r(208)
        Loss(kMVK  )= +( 1.000)*r(166)+( 1.000)*r(167)+( 1.000)*r(168)
     &                +( 1.000)*r(169)
        Gain(kMVK  )= +( 0.320)*r(189)+( 0.160)*r(190)+( 0.048)*r(210)
        Loss(kMETH )= +( 1.000)*r(161)+( 1.000)*r(162)+( 1.000)*r(163)
     &                +( 1.000)*r(164)+( 1.000)*r(165)
        Gain(kMETH )= +( 0.230)*r(189)+( 0.390)*r(190)+( 0.025)*r(208)
     &                +( 0.026)*r(209)+( 0.012)*r(211)
        Loss(kMGLY )= +( 1.000)*r(149)+( 1.000)*r(150)+( 1.000)*r(151)
        Gain(kMGLY )= +( 0.230)*r(155)+( 0.084)*r(161)+( 0.900)*r(162)
     &                +( 0.300)*r(166)+( 0.950)*r(167)+( 0.174)*r(170)
     &                +( 0.742)*r(171)+( 0.008)*r(172)+( 0.500)*r(181)
     &                +( 0.500)*r(183)+( 0.119)*r(202)+( 0.287)*r(203)
        Loss(kGLY  )= +( 1.000)*r(145)+( 1.000)*r(146)+( 1.000)*r(147)
     &                +( 1.000)*r(148)
        Gain(kGLY  )= +( 0.230)*r(153)+( 0.150)*r(170)+( 0.023)*r(171)
     &                +( 1.000)*r(179)+( 0.500)*r(181)+( 0.500)*r(183)
     &                +( 0.009)*r(188)+( 0.001)*r(194)+( 0.248)*r(198)
     &                +( 0.118)*r(202)+( 0.097)*r(203)
        Loss(kTERP )= +( 1.000)*r(193)+( 1.000)*r(194)+( 1.000)*r(195)
     &                +( 1.000)*r(196)


        Gain(kHC2H )= +( 1.000)*r(128)+( 0.333)*r(162)+( 0.351)*r(167)
     &                +( 0.100)*r(171)+( 0.370)*r(186)+( 0.204)*r(190)
     &                +( 0.103)*r(194)+( 0.121)*r(198)+( 0.185)*r(205)
     &                +( 0.073)*r(209)

        Gain(kCO2H )= +( 0.250)*r( 72)+( 1.000)*r( 74)+( 1.000)*r( 75)
     &                +( 1.000)*r( 77)+( 0.050)*r(205)+( 0.129)*r(209)

        Gain(kCO3H )= +( 0.750)*r( 72)

        Gain(kRC2H )= +( 0.250)*r( 82)+( 1.000)*r( 84)+( 1.000)*r( 85)
     &                +( 1.000)*r( 87)+( 0.250)*r( 93)+( 1.000)*r( 95)
     &                +( 1.000)*r( 96)+( 1.000)*r( 98)+( 0.250)*r(105)
     &                +( 1.000)*r(107)+( 1.000)*r(108)+( 2.000)*r(110)
     &                +( 0.372)*r(171)+( 0.150)*r(190)+( 0.189)*r(194)
     &                +( 0.119)*r(205)+( 0.303)*r(209)

        Gain(kRC3H )= +( 0.750)*r( 82)+( 0.750)*r( 93)+( 0.750)*r(105)
        Loss(kACET )= +( 1.000)*r(136)+( 1.000)*r(137)
        Gain(kACET )= +( 1.000)*r(116)+( 0.006)*r(176)+( 0.020)*r(177)
     &                +( 0.130)*r(194)+( 0.417)*r(198)+( 0.024)*r(199)
     &                +( 0.452)*r(200)+( 0.072)*r(201)+( 0.005)*r(204)
     &                +( 0.001)*r(205)+( 0.024)*r(206)+( 0.127)*r(208)
     &                +( 0.045)*r(209)+( 0.102)*r(210)
        Loss(kMEK  )= +( 1.000)*r(138)+( 1.000)*r(139)
        Gain(kMEK  )= +( 0.500)*r( 64)+( 1.000)*r( 65)+( 0.500)*r( 66)
     &                +( 1.000)*r( 68)+( 0.416)*r(161)+( 0.550)*r(168)
     &                +( 0.150)*r(170)+( 0.210)*r(171)+( 0.233)*r(173)
     &                +( 0.115)*r(174)+( 0.177)*r(176)+( 0.243)*r(177)
     &                +( 0.332)*r(199)+( 0.110)*r(200)+( 0.089)*r(201)
     &                +( 0.437)*r(207)+( 0.072)*r(208)+( 0.026)*r(209)
     &                +( 0.001)*r(210)+( 0.659)*r(211)
        Loss(kMEOH )= +( 1.000)*r(140)
        Gain(kMEOH )= +( 1.000)*r( 49)+( 0.250)*r( 54)+( 0.250)*r( 64)
        Loss(kCOOH )= +( 1.000)*r(141)+( 1.000)*r(142)
        Gain(kCOOH )= +( 1.000)*r( 47)
        Loss(kROOH )= +( 1.000)*r(143)+( 1.000)*r(144)
        Gain(kROOH )= +( 1.000)*r( 52)+( 1.000)*r( 63)
        Loss(kCO   )= +( 1.000)*r( 29)
        Gain(kCO   )= +( 1.000)*r(123)+( 1.000)*r(124)+( 1.000)*r(125)
     &                +( 1.000)*r(129)+( 1.000)*r(131)+( 0.034)*r(133)
     &                +( 1.000)*r(134)+( 2.000)*r(145)+( 1.000)*r(146)
     &                +( 1.260)*r(147)+( 1.260)*r(148)+( 1.000)*r(149)
     &                +( 1.000)*r(150)+( 1.000)*r(151)+( 0.416)*r(161)
     &                +( 0.450)*r(162)+( 0.500)*r(163)+( 0.670)*r(165)
     &                +( 0.475)*r(167)+( 0.700)*r(169)+( 0.336)*r(170)
     &                +( 0.498)*r(171)+( 0.572)*r(172)+( 1.233)*r(173)
     &                +( 1.000)*r(178)+( 1.500)*r(179)+( 1.000)*r(181)
        Gain(kCO   ) = Gain(kCO   )
     &                +( 1.000)*r(183)+( 0.500)*r(186)+( 0.491)*r(188)
     &                +( 0.275)*r(190)+( 0.157)*r(194)+( 0.160)*r(198)
     &                +( 0.002)*r(200)+( 0.345)*r(205)+( 0.265)*r(209)
     &                +( 0.012)*r(211)
        Loss(kETHE )= +( 1.000)*r(185)+( 1.000)*r(186)+( 1.000)*r(187)
     &                +( 1.000)*r(188)

        Loss(kALK1 )= +( 1.000)*r(197)

        Loss(kALK2 )= +( 1.000)*r(198)

        Loss(kALK3 )= +( 1.000)*r(199)

        Loss(kALK4 )= +( 1.000)*r(200)

        Loss(kALK5 )= +( 1.000)*r(201)

        Loss(kARO1 )= +( 1.000)*r(202)

        Loss(kARO2 )= +( 1.000)*r(203)

        Loss(kOLE1 )= +( 1.000)*r(204)+( 1.000)*r(205)+( 1.000)*r(206)
     &                +( 1.000)*r(207)

        Loss(kOLE2 )= +( 1.000)*r(208)+( 1.000)*r(209)+( 1.000)*r(210)
     &                +( 1.000)*r(211)

        Loss(kSO2  )= +( 1.000)*r( 44)

        Gain(kSULF )= +( 1.000)*r( 44)
c
c-------SAPRC Base Case Biogenic Yields + High Anthropogenic Yields
c
c-------B is the branching ratio (NOx dependent SOA yields)
c        B = 0.0
        B =(r( 46)+r( 48)+r( 51)+r( 53)+r( 56)+r( 58)+r( 62)+r( 65)) /
     &     ( r( 46)+r( 48)+r( 51)+r( 53)+r( 56)+r( 58)+r( 62)+r( 65) +
     &     r( 47)+r( 49)+r( 50)+r( 52)+r( 54)+r( 55)+r( 57)+r( 59)+
     &     r( 60)+r( 61)+r( 63)+r( 64)+r( 66)+r( 67)+r( 68) )

        Gain(kCAS2 )= +(0.0366*(1-B) + 0.0183*B )*r(200)
        Gain(kCAS2 )= +Gain(kCAS2 )+(0.2139*(1-B) + 0.1070*B )*r(201)
        Gain(kCAS1 )= +(0.0502*(1-B) + 0.0020*B )*r(202)
        Gain(kCAS2 )= +Gain(kCAS2 )+(0.1507*(1-B) + 0.1105*B )*r(202)
        Gain(kCAS3 )= +(0.2512*(1-B) + 0.2009*B )*r(202)
        Gain(kCAS4 )= +(0.3516*(1-B) + 0.2914*B )*r(202)
        Gain(kCAS1 )= +Gain(kCAS1 )+(0.0570*(1-B) + 0.0011*B )*r(203)
        Gain(kCAS2 )= +Gain(kCAS2 )+(0.2279*(1-B) + 0.1481*B )*r(203)
        Gain(kCAS3 )= +Gain(kCAS3 )+(0.2848*(1-B) + 0.2279*B )*r(203)
        Gain(kCAS4 )= +Gain(kCAS4 )+(0.3988*(1-B) + 0.3304*B )*r(203)
        Gain(kCAS1 )= +Gain(kCAS1 )+(0.0019*(1-B) + 0.0003*B )*r(204)
     &                +(0.0019*(1-B) + 0.0003*B )*r(205)
     &                +(0.0019*(1-B) + 0.0003*B )*r(206)
     &                +(0.0019*(1-B) + 0.0003*B )*r(207)
        Gain(kCAS2 )= +Gain(kCAS2 )+(0.0037*(1-B) + 0.0019*B )*r(204)
     &                +(0.0037*(1-B) + 0.0019*B )*r(205)
     &                +(0.0037*(1-B) + 0.0019*B )*r(206)
     &                +(0.0037*(1-B) + 0.0019*B )*r(207)
        Gain(kCAS3 )= +Gain(kCAS3 )+(0.0247*(1-B) + 0.0154*B )*r(204)
     &                +(0.0247*(1-B) + 0.0154*B )*r(205)
     &                +(0.0247*(1-B) + 0.0154*B )*r(206)
     &                +(0.0247*(1-B) + 0.0154*B )*r(207)
        Gain(kCAS4 )= +Gain(kCAS4 )+(0.0925*(1-B) + 0.0617*B )*r(204)
     &                +(0.0925*(1-B) + 0.0617*B )*r(205)
     &                +(0.0925*(1-B) + 0.0617*B )*r(206)
     &                +(0.0925*(1-B) + 0.0617*B )*r(207)
        Gain(kCAS1 )= +Gain(kCAS1 )+(0.0119*(1-B) + 0.0016*B )*r(208)
     &                +(0.0119*(1-B) + 0.0016*B )*r(209)
     &                +(0.0119*(1-B) + 0.0016*B )*r(210)
     &                +(0.0119*(1-B) + 0.0016*B )*r(211)
        Gain(kCAS2 )= +Gain(kCAS2 )+(0.0229*(1-B) + 0.0134*B )*r(208)
     &                +(0.0229*(1-B) + 0.0134*B )*r(209)
     &                +(0.0229*(1-B) + 0.0134*B )*r(210)
     &                +(0.0229*(1-B) + 0.0134*B )*r(211)
        Gain(kCAS3 )= +Gain(kCAS3 )+(0.0680*(1-B) + 0.0435*B )*r(208)
     &                +(0.0680*(1-B) + 0.0435*B )*r(209)
     &                +(0.0680*(1-B) + 0.0435*B )*r(210)
     &                +(0.0680*(1-B) + 0.0435*B )*r(211)
        Gain(kCAS4 )= +Gain(kCAS4 )+(0.1976*(1-B) + 0.1423*B )*r(208)
     &                +(0.1976*(1-B) + 0.1423*B )*r(209)
     &                +(0.1976*(1-B) + 0.1423*B )*r(210)
     &                +(0.1976*(1-B) + 0.1423*B )*r(211)
        Gain(kCBS1 )= +(0.0034*(1-B) + 0.0001*B )*r(189)
     &                +(0.0034*(1-B) + 0.0001*B )*r(190)
        Gain(kCBS2 )= +(0.0114*(1-B) + 0.0085*B )*r(189)
     &                +(0.0114*(1-B) + 0.0085*B )*r(190)
        Gain(kCBS3 )= +(0.0057*(1-B) + 0.0057*B )*r(189)
     &                +(0.0057*(1-B) + 0.0057*B )*r(190)
        Gain(kCBS4 )= +(0.0000 )*r(189)
     &                +(0.0000 )*r(190)
        Gain(kCBS1 )= +Gain(kCBS1 )+(0.0812*(1-B) + 0.0091*B )*r(193)
     &                +(0.0812*(1-B) + 0.0091*B )*r(194)
     &                +(0.0812*(1-B) + 0.0091*B )*r(195)
     &                +(0.0812*(1-B) + 0.0091*B )*r(196)
        Gain(kCBS2 )= +Gain(kCBS2 )+(0.0695*(1-B) + 0.0919*B )*r(193)
     &                +(0.0695*(1-B) + 0.0919*B )*r(194)
     &                +(0.0695*(1-B) + 0.0919*B )*r(195)
     &                +(0.0695*(1-B) + 0.0919*B )*r(196)
        Gain(kCBS3 )= +Gain(kCBS3 )+(0.2714*(1-B) + 0.1521*B )*r(193)
     &                +(0.2714*(1-B) + 0.1521*B )*r(194)
     &                +(0.2714*(1-B) + 0.1521*B )*r(195)
     &                +(0.2714*(1-B) + 0.1521*B )*r(196)
        Gain(kCBS4 )= +Gain(kCBS4 )+(0.4597*(1-B) + 0.3836*B )*r(193)
     &                +(0.4597*(1-B) + 0.3836*B )*r(194)
     &                +(0.4597*(1-B) + 0.3836*B )*r(195)
     &                +(0.4597*(1-B) + 0.3836*B )*r(196)
        Gain(kCBS1 )= +Gain(kCBS1 )+(0.0255)*r(193)+(0.0255)*r(194)
     &                +(0.0255)*r(195)+(0.0255)*r(196)
        Gain(kCBS2 )= +Gain(kCBS2 )+(0.0510)*r(193)+(0.0510)*r(194)
     &                +(0.0510)*r(195)+(0.0510)*r(196)
        Gain(kCBS3 )= +Gain(kCBS3 )+(0.2550)*r(193)+(0.2500)*r(194)
     &                +(0.2500)*r(195)+(0.2500)*r(196)
        Gain(kCBS4 )= +Gain(kCBS4 )+(0.3060)*r(193)+(0.3060)*r(194)
     &                +(0.3060)*r(195)+(0.3060)*r(196)
c
c-------SAPRC Primary aging reactions
c
        Loss(kCPO1 )= +( 0.000)*r(212)
        Loss(kCPO2 )= +( 1.000)*r(213)
        Loss(kCPO3 )= +( 1.000)*r(214)
        Loss(kCPO4 )= +( 1.000)*r(215)
        Loss(kCPO5 )= +( 1.000)*r(216)
        Loss(kCPO6 )= +( 1.000)*r(217)
        Loss(kCPO7 )= +( 1.000)*r(218)
        Loss(kCPO8 )= +( 1.000)*r(219)
        Loss(kCPO9 )= +( 1.000)*r(220)
        Loss(kCOO1 )= +( 0.000)*r(221)
        Loss(kCOO2 )= +( 1.000)*r(222)
        Loss(kCOO3 )= +( 1.000)*r(223)
        Loss(kCOO4 )= +( 1.000)*r(224)
        Loss(kCOO5 )= +( 1.000)*r(225)
        Loss(kCOO6 )= +( 1.000)*r(226)
        Loss(kCOO7 )= +( 1.000)*r(227)
        Loss(kCOO8 )= +( 1.000)*r(228)
        Loss(kCOO9 )= +( 0.000)*r(229)
c
        Gain(kCOO1 )= +( 1.075)*r(213)+( 0.0  )*r(214)+( 0.0  )*r(215)
     &                +( 0.0  )*r(216)+( 0.0  )*r(217)+( 0.0  )*r(218)
     &                +( 0.0  )*r(219)+( 0.0  )*r(220)
     &                +( 1.075)*r(222)+( 0.0  )*r(223)+( 0.0  )*r(224)
     &                +( 0.0  )*r(225)+( 0.0  )*r(226)+( 0.0  )*r(227)
     &                +( 0.0  )*r(228)+( 0.0  )*r(229)
        Gain(kCOO2 )= +( 0.0  )*r(213)+( 1.075)*r(214)+( 0.0  )*r(215)
     &                +( 0.0  )*r(216)+( 0.0  )*r(217)+( 0.0  )*r(218)
     &                +( 0.0  )*r(219)+( 0.0  )*r(220)
     &                +( 0.0  )*r(222)+( 1.075)*r(223)+( 0.0  )*r(224)
     &                +( 0.0  )*r(225)+( 0.0  )*r(226)+( 0.0  )*r(227)
     &                +( 0.0  )*r(228)+( 0.0  )*r(229)
        Gain(kCOO3 )= +( 0.0  )*r(213)+( 0.0  )*r(214)+( 1.075)*r(215)
     &                +( 0.0  )*r(216)+( 0.0  )*r(217)+( 0.0  )*r(218)
     &                +( 0.0  )*r(219)+( 0.0  )*r(220)
     &                +( 0.0  )*r(222)+( 0.0  )*r(223)+( 1.075)*r(224)
     &                +( 0.0  )*r(225)+( 0.0  )*r(226)+( 0.0  )*r(227)
     &                +( 0.0  )*r(228)+( 0.0  )*r(229)
        Gain(kCOO4 )= +( 0.0  )*r(213)+( 0.0  )*r(214)+( 0.0  )*r(215)
     &                +( 1.075)*r(216)+( 0.0  )*r(217)+( 0.0  )*r(218)
     &                +( 0.0  )*r(219)+( 0.0  )*r(220)
     &                +( 0.0  )*r(222)+( 0.0  )*r(223)+( 0.0  )*r(224)
     &                +( 1.075)*r(225)+( 0.0  )*r(226)+( 0.0  )*r(227)
     &                +( 0.0  )*r(228)+( 0.0  )*r(229)
        Gain(kCOO5 )= +( 0.0  )*r(213)+( 0.0  )*r(214)+( 0.0  )*r(215)
     &                +( 0.0  )*r(216)+( 1.075)*r(217)+( 0.0  )*r(218)
     &                +( 0.0  )*r(219)+( 0.0  )*r(220)
     &                +( 0.0  )*r(222)+( 0.0  )*r(223)+( 0.0  )*r(224)
     &                +( 0.0  )*r(225)+( 1.075)*r(226)+( 0.0  )*r(227)
     &                +( 0.0  )*r(228)+( 0.0  )*r(229)
        Gain(kCOO6 )= +( 0.0  )*r(213)+( 0.0  )*r(214)+( 0.0  )*r(215)
     &                +( 0.0  )*r(216)+( 0.0  )*r(217)+( 1.075)*r(218)
     &                +( 0.0  )*r(219)+( 0.0  )*r(220)
     &                +( 0.0  )*r(222)+( 0.0  )*r(223)+( 0.0  )*r(224)
     &                +( 0.0  )*r(225)+( 0.0  )*r(226)+( 1.075)*r(227)
     &                +( 0.0  )*r(228)+( 0.0  )*r(229)
        Gain(kCOO7 )= +( 0.0  )*r(213)+( 0.0  )*r(214)+( 0.0  )*r(215)
     &                +( 0.0  )*r(216)+( 0.0  )*r(217)+( 0.0  )*r(218)
     &                +( 1.075)*r(219)+( 0.0  )*r(220)
     &                +( 0.0  )*r(222)+( 0.0  )*r(223)+( 0.0  )*r(224)
     &                +( 0.0  )*r(225)+( 0.0  )*r(226)+( 0.0  )*r(227)
     &                +( 1.075)*r(228)+( 0.0  )*r(229)
        Gain(kCOO8 )= +( 0.0  )*r(213)+( 0.0  )*r(214)+( 0.0  )*r(215)
     &                +( 0.0  )*r(216)+( 0.0  )*r(217)+( 0.0  )*r(218)
     &                +( 0.0  )*r(219)+( 1.075)*r(220)
     &                +( 0.0  )*r(222)+( 0.0  )*r(223)+( 0.0  )*r(224)
     &                +( 0.0  )*r(225)+( 0.0  )*r(226)+( 0.0  )*r(227)
     &                +( 0.0  )*r(228)+( 1.075)*r(229)

c-------SAPRC SOA aging reactions
c
        Loss(kCBS1 )= +( 0.000)*r(230)
        Loss(kCBS2 )= +( 1.000)*r(231)
        Loss(kCBS3 )= +( 1.000)*r(232)
        Loss(kCBS4 )= +( 1.000)*r(233)
        Loss(kCAS1 )= +( 0.000)*r(234)
        Loss(kCAS2 )= +( 1.000)*r(235)
        Loss(kCAS3 )= +( 1.000)*r(236)
        Loss(kCAS4 )= +( 1.000)*r(237)

c BNM corrected following 6 lines 4-21-08.  All read Gain(kCBS1) before
c Oxidation causes one-bin volatility shift

        Gain(kCBS1 )= Gain(kCBS1 )+( 1.075)*r(231)+( 0.0  )*r(232)+( 0.0  )*r(233)
        Gain(kCBS2 )= Gain(kCBS2 )+( 0.0  )*r(231)+( 1.075)*r(232)+( 0.0  )*r(233)
        Gain(kCBS3 )= Gain(kCBS3 )+( 0.0  )*r(231)+( 0.0  )*r(232)+( 1.075)*r(233)
        Gain(kCAS1 )= Gain(kCAS1 )+( 1.075)*r(235)+( 0.0  )*r(236)+( 0.0  )*r(237)
        Gain(kCAS2 )= Gain(kCAS2 )+( 0.0  )*r(235)+( 1.075)*r(236)+( 0.0  )*r(237)
        Gain(kCAS3 )= Gain(kCAS3 )+( 0.0  )*r(235)+( 0.0  )*r(236)+( 1.075)*r(237)

c
      do l=neq1+1,ngas
        rate(l) = gain(l) -loss(l)
      enddo
c
c
      return
      end
