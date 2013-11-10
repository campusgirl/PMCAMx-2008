      subroutine rxnrate5(H2O,M,O2,CH4,H2,cncrad,conc,r)
c
c-----CAMx v4.02 030709
c
c     RXNRATE computes fluxes for each reaction
c
c     Copyright 1997, 1998, 1999, 2000, 2001, 2002, 2003
c     ENVIRON International Corporation
c
c     Routines Called:
c        none
c
c     Called by:
c        RADINIT
c        TRAP
c
      include "camx.prm"
      include "chmstry.com"
c
      real M
      real cncrad(MXRADCL),conc(MXSPEC+1),r(MXRXN)
c
      r(  1) = rk(  1)*conc(kNO2)
      r(  2) = rk(  2)*cncrad(kO)*O2*M
      r(  3) = rk(  3)*cncrad(kO)*conc(kO3)
      r(  4) = rk(  4)*cncrad(kO)*conc(kNO)*M
      r(  5) = rk(  5)*cncrad(kO)*conc(kNO2)
      r(  6) = rk(  6)*cncrad(kO)*conc(kNO2)
      r(  7) = rk(  7)*conc(kO3)*conc(kNO)
      r(  8) = rk(  8)*conc(kO3)*conc(kNO2)
      r(  9) = rk(  9)*conc(kNO)*cncrad(kNO3)
      r( 10) = rk( 10)*conc(kNO)*conc(kNO)*O2
      r( 11) = rk( 11)*conc(kNO2)*cncrad(kNO3)
      r( 12) = rk( 12)*cncrad(kN2O5)
      r( 13) = rk( 13)*cncrad(kN2O5)*H2O
      r( 14) = rk( 14)*conc(kNO2)*cncrad(kNO3)
      r( 15) = rk( 15)*cncrad(kNO3)
      r( 16) = rk( 16)*cncrad(kNO3)
      r( 17) = rk( 17)*conc(kO3)
      r( 18) = rk( 18)*conc(kO3)
      r( 19) = rk( 19)*cncrad(kO1D)*H2O
      r( 20) = rk( 20)*cncrad(kO1D)*M
      r( 21) = rk( 21)*cncrad(kOH)*conc(kNO)
      r( 22) = rk( 22)*conc(kHONO)
      r( 23) = rk( 23)*conc(kHONO)
      r( 24) = rk( 24)*cncrad(kOH)*conc(kHONO)
      r( 25) = rk( 25)*cncrad(kOH)*conc(kNO2)
      r( 26) = rk( 26)*cncrad(kOH)*cncrad(kNO3)
      r( 27) = rk( 27)*cncrad(kOH)*conc(kHNO3)
      r( 28) = rk( 28)*conc(kHNO3)
      r( 29) = rk( 29)*cncrad(kOH)*conc(kCO)
      r( 30) = rk( 30)*cncrad(kOH)*conc(kO3)
      r( 31) = rk( 31)*cncrad(kHO2)*conc(kNO)
      r( 32) = rk( 32)*cncrad(kHO2)*conc(kNO2)
      r( 33) = rk( 33)*conc(kHNO4)
      r( 34) = rk( 34)*conc(kHNO4)
      r( 35) = rk( 35)*conc(kHNO4)*cncrad(kOH)
      r( 36) = rk( 36)*cncrad(kHO2)*conc(kO3)
      r( 37) = rk( 37)*cncrad(kHO2)*cncrad(kHO2)
      r( 38) = rk( 38)*cncrad(kHO2)*cncrad(kHO2)*H2O
      r( 39) = rk( 39)*cncrad(kNO3)*cncrad(kHO2)
      r( 40) = rk( 40)*cncrad(kNO3)*cncrad(kNO3)
      r( 41) = rk( 41)*conc(kHO2H)
      r( 42) = rk( 42)*conc(kHO2H)*cncrad(kOH)
      r( 43) = rk( 43)*cncrad(kOH)*cncrad(kHO2)
      r( 44) = rk( 44)*cncrad(kOH)*conc(kSO2)
      r( 45) = rk( 45)*cncrad(kOH)*H2
      r( 46) = rk( 46)*cncrad(kCXO2)*conc(kNO)
      r( 47) = rk( 47)*cncrad(kCXO2)*cncrad(kHO2)
      r( 48) = rk( 48)*cncrad(kCXO2)*cncrad(kNO3)
      r( 49) = rk( 49)*cncrad(kCXO2)*cncrad(kCXO2)
      r( 50) = rk( 50)*cncrad(kCXO2)*cncrad(kCXO2)
      r( 51) = rk( 51)*cncrad(kRO2R)*conc(kNO)
      r( 52) = rk( 52)*cncrad(kRO2R)*cncrad(kHO2)
      r( 53) = rk( 53)*cncrad(kRO2R)*cncrad(kNO3)
      r( 54) = rk( 54)*cncrad(kRO2R)*cncrad(kCXO2)
      r( 55) = rk( 55)*cncrad(kRO2R)*cncrad(kRO2R)
      r( 56) = rk( 56)*cncrad(kR2O2)*conc(kNO)
      r( 57) = rk( 57)*cncrad(kR2O2)*cncrad(kHO2)
      r( 58) = rk( 58)*cncrad(kR2O2)*cncrad(kNO3)
      r( 59) = rk( 59)*cncrad(kR2O2)*cncrad(kCXO2)
      r( 60) = rk( 60)*cncrad(kR2O2)*cncrad(kRO2R)
      r( 61) = rk( 61)*cncrad(kR2O2)*cncrad(kR2O2)
      r( 62) = rk( 62)*cncrad(kRO2N)*conc(kNO)
      r( 63) = rk( 63)*cncrad(kRO2N)*cncrad(kHO2)
      r( 64) = rk( 64)*cncrad(kRO2N)*cncrad(kCXO2)
      r( 65) = rk( 65)*cncrad(kRO2N)*cncrad(kNO3)
      r( 66) = rk( 66)*cncrad(kRO2N)*cncrad(kRO2R)
      r( 67) = rk( 67)*cncrad(kRO2N)*cncrad(kR2O2)
      r( 68) = rk( 68)*cncrad(kRO2N)*cncrad(kRO2N)
      r( 69) = rk( 69)*cncrad(kCCO3)*conc(kNO2)
      r( 70) = rk( 70)*conc(kPAN)
      r( 71) = rk( 71)*cncrad(kCCO3)*conc(kNO)
      r( 72) = rk( 72)*cncrad(kCCO3)*cncrad(kHO2)
      r( 73) = rk( 73)*cncrad(kCCO3)*cncrad(kNO3)
      r( 74) = rk( 74)*cncrad(kCCO3)*cncrad(kCXO2)
      r( 75) = rk( 75)*cncrad(kCCO3)*cncrad(kRO2R)
      r( 76) = rk( 76)*cncrad(kCCO3)*cncrad(kR2O2)
      r( 77) = rk( 77)*cncrad(kCCO3)*cncrad(kRO2N)
      r( 78) = rk( 78)*cncrad(kCCO3)*cncrad(kCCO3)
      r( 79) = rk( 79)*cncrad(kRCO3)*conc(kNO2)
      r( 80) = rk( 80)*conc(kPAN2)
      r( 81) = rk( 81)*cncrad(kRCO3)*conc(kNO)
      r( 82) = rk( 82)*cncrad(kRCO3)*cncrad(kHO2)
      r( 83) = rk( 83)*cncrad(kRCO3)*cncrad(kNO3)
      r( 84) = rk( 84)*cncrad(kRCO3)*cncrad(kCXO2)
      r( 85) = rk( 85)*cncrad(kRCO3)*cncrad(kRO2R)
      r( 86) = rk( 86)*cncrad(kRCO3)*cncrad(kR2O2)
      r( 87) = rk( 87)*cncrad(kRCO3)*cncrad(kRO2N)
      r( 88) = rk( 88)*cncrad(kRCO3)*cncrad(kCCO3)
      r( 89) = rk( 89)*cncrad(kRCO3)*cncrad(kRCO3)
      r( 90) = rk( 90)*cncrad(kBZCO)*conc(kNO2)
      r( 91) = rk( 91)*conc(kPBZN)
      r( 92) = rk( 92)*cncrad(kBZCO)*conc(kNO)
      r( 93) = rk( 93)*cncrad(kBZCO)*cncrad(kHO2)
      r( 94) = rk( 94)*cncrad(kBZCO)*cncrad(kNO3)
      r( 95) = rk( 95)*cncrad(kBZCO)*cncrad(kCXO2)
      r( 96) = rk( 96)*cncrad(kBZCO)*cncrad(kRO2R)
      r( 97) = rk( 97)*cncrad(kBZCO)*cncrad(kR2O2)
      r( 98) = rk( 98)*cncrad(kBZCO)*cncrad(kRO2N)
      r( 99) = rk( 99)*cncrad(kBZCO)*cncrad(kCCO3)
      r(100) = rk(100)*cncrad(kBZCO)*cncrad(kRCO3)
      r(101) = rk(101)*cncrad(kBZCO)*cncrad(kBZCO)
      r(102) = rk(102)*cncrad(kMCO3)*conc(kNO2)
      r(103) = rk(103)*conc(kMPAN)
      r(104) = rk(104)*cncrad(kMCO3)*conc(kNO)
      r(105) = rk(105)*cncrad(kMCO3)*cncrad(kHO2)
      r(106) = rk(106)*cncrad(kMCO3)*cncrad(kNO3)
      r(107) = rk(107)*cncrad(kMCO3)*cncrad(kCXO2)
      r(108) = rk(108)*cncrad(kMCO3)*cncrad(kRO2R)
      r(109) = rk(109)*cncrad(kMCO3)*cncrad(kR2O2)
      r(110) = rk(110)*cncrad(kMCO3)*cncrad(kRO2N)
      r(111) = rk(111)*cncrad(kMCO3)*cncrad(kCCO3)
      r(112) = rk(112)*cncrad(kMCO3)*cncrad(kRCO3)
      r(113) = rk(113)*cncrad(kMCO3)*cncrad(kBZCO)
      r(114) = rk(114)*cncrad(kMCO3)*cncrad(kMCO3)
      r(115) = rk(115)*cncrad(kTBUO)*conc(kNO2)
      r(116) = rk(116)*cncrad(kTBUO)
      r(117) = rk(117)*cncrad(kBZO)*conc(kNO2)
      r(118) = rk(118)*cncrad(kBZO)*cncrad(kHO2)
      r(119) = rk(119)*cncrad(kBZO)
      r(120) = rk(120)*cncrad(kBZNO)*conc(kNO2)
      r(121) = rk(121)*cncrad(kBZNO)*cncrad(kHO2)
      r(122) = rk(122)*cncrad(kBZNO)
      r(123) = rk(123)*conc(kHCHO)
      r(124) = rk(124)*conc(kHCHO)
      r(125) = rk(125)*conc(kHCHO)*cncrad(kOH)
      r(126) = rk(126)*conc(kHCHO)*cncrad(kHO2)
      r(127) = rk(127)*cncrad(kHCO3)
      r(128) = rk(128)*cncrad(kHCO3)*conc(kNO)
      r(129) = rk(129)*conc(kHCHO)*cncrad(kNO3)
      r(130) = rk(130)*conc(kCCHO)*cncrad(kOH)
      r(131) = rk(131)*conc(kCCHO)
      r(132) = rk(132)*conc(kCCHO)*cncrad(kNO3)
      r(133) = rk(133)*conc(kRCHO)*cncrad(kOH)
      r(134) = rk(134)*conc(kRCHO)
      r(135) = rk(135)*conc(kRCHO)*cncrad(kNO3)
      r(136) = rk(136)*conc(kACET)*cncrad(kOH)
      r(137) = rk(137)*conc(kACET)
      r(138) = rk(138)*conc(kMEK)*cncrad(kOH)
      r(139) = rk(139)*conc(kMEK)
      r(140) = rk(140)*conc(kMEOH)*cncrad(kOH)
      r(141) = rk(141)*conc(kCOOH)*cncrad(kOH)
      r(142) = rk(142)*conc(kCOOH)
      r(143) = rk(143)*conc(kROOH)*cncrad(kOH)
      r(144) = rk(144)*conc(kROOH)
      r(145) = rk(145)*conc(kGLY)
      r(146) = rk(146)*conc(kGLY)
      r(147) = rk(147)*conc(kGLY)*cncrad(kOH)
      r(148) = rk(148)*conc(kGLY)*cncrad(kNO3)
      r(149) = rk(149)*conc(kMGLY)
      r(150) = rk(150)*conc(kMGLY)*cncrad(kOH)
      r(151) = rk(151)*conc(kMGLY)*cncrad(kNO3)
      r(152) = rk(152)*conc(kBACL)
      r(153) = rk(153)*conc(kPHEN)*cncrad(kOH)
      r(154) = rk(154)*conc(kPHEN)*cncrad(kNO3)
      r(155) = rk(155)*conc(kCRES)*cncrad(kOH)
      r(156) = rk(156)*conc(kCRES)*cncrad(kNO3)
      r(157) = rk(157)*conc(kNPHE)*cncrad(kNO3)
      r(158) = rk(158)*conc(kBALD)*cncrad(kOH)
      r(159) = rk(159)*conc(kBALD)
      r(160) = rk(160)*conc(kBALD)*cncrad(kNO3)
      r(161) = rk(161)*conc(kMETH)*cncrad(kOH)
      r(162) = rk(162)*conc(kMETH)*conc(kO3)
      r(163) = rk(163)*conc(kMETH)*cncrad(kNO3)
      r(164) = rk(164)*conc(kMETH)*cncrad(kO)
      r(165) = rk(165)*conc(kMETH)
      r(166) = rk(166)*conc(kMVK)*cncrad(kOH)
      r(167) = rk(167)*conc(kMVK)*conc(kO3)
      r(168) = rk(168)*conc(kMVK)*cncrad(kO)
      r(169) = rk(169)*conc(kMVK)
      r(170) = rk(170)*conc(kISPD)*cncrad(kOH)
      r(171) = rk(171)*conc(kISPD)*conc(kO3)
      r(172) = rk(172)*conc(kISPD)*cncrad(kNO3)
      r(173) = rk(173)*conc(kISPD)
      r(174) = rk(174)*conc(kPROD)*cncrad(kOH)
      r(175) = rk(175)*conc(kPROD)
      r(176) = rk(176)*conc(kRNO3)*cncrad(kOH)
      r(177) = rk(177)*conc(kRNO3)
      r(178) = rk(178)*conc(kDCB1)*cncrad(kOH)
      r(179) = rk(179)*conc(kDCB1)*conc(kO3)
      r(180) = rk(180)*conc(kDCB2)*cncrad(kOH)
      r(181) = rk(181)*conc(kDCB2)
      r(182) = rk(182)*conc(kDCB3)*cncrad(kOH)
      r(183) = rk(183)*conc(kDCB3)
      r(184) = rk(184)*CH4*cncrad(kOH)
      r(185) = rk(185)*conc(kETHE)*cncrad(kOH)
      r(186) = rk(186)*conc(kETHE)*conc(kO3)
      r(187) = rk(187)*conc(kETHE)*cncrad(kNO3)
      r(188) = rk(188)*conc(kETHE)*cncrad(kO)
      r(189) = rk(189)*conc(kISOP)*cncrad(kOH)
      r(190) = rk(190)*conc(kISOP)*conc(kO3)
      r(191) = rk(191)*conc(kISOP)*cncrad(kNO3)
      r(192) = rk(192)*conc(kISOP)*cncrad(kO)
      r(193) = rk(193)*conc(kTERP)*cncrad(kOH)
      r(194) = rk(194)*conc(kTERP)*conc(kO3)
      r(195) = rk(195)*conc(kTERP)*cncrad(kNO3)
      r(196) = rk(196)*conc(kTERP)*cncrad(kO)
      r(197) = rk(197)*conc(kALK1)*cncrad(kOH)
      r(198) = rk(198)*conc(kALK2)*cncrad(kOH)
      r(199) = rk(199)*conc(kALK3)*cncrad(kOH)
      r(200) = rk(200)*conc(kALK4)*cncrad(kOH)
      r(201) = rk(201)*conc(kALK5)*cncrad(kOH)
      r(202) = rk(202)*conc(kARO1)*cncrad(kOH)
      r(203) = rk(203)*conc(kARO2)*cncrad(kOH)
      r(204) = rk(204)*conc(kOLE1)*cncrad(kOH)
      r(205) = rk(205)*conc(kOLE1)*conc(kO3)
      r(206) = rk(206)*conc(kOLE1)*cncrad(kNO3)
      r(207) = rk(207)*conc(kOLE1)*cncrad(kO)
      r(208) = rk(208)*conc(kOLE2)*cncrad(kOH)
      r(209) = rk(209)*conc(kOLE2)*conc(kO3)
      r(210) = rk(210)*conc(kOLE2)*cncrad(kNO3)
      r(211) = rk(211)*conc(kOLE2)*cncrad(kO)

c      r(212) = rk(212)*cncrad(kOH)*conc(kCPO1)
c      r(213) = rk(213)*cncrad(kOH)*conc(kCPO2)
c      r(214) = rk(214)*cncrad(kOH)*conc(kCPO3)
c      r(215) = rk(215)*cncrad(kOH)*conc(kCPO4)
c      r(216) = rk(216)*cncrad(kOH)*conc(kCPO5)
c      r(217) = rk(217)*cncrad(kOH)*conc(kCPO6)
c      r(218) = rk(218)*cncrad(kOH)*conc(kCPO7)
c      r(219) = rk(219)*cncrad(kOH)*conc(kCPO8)
c      r(220) = rk(220)*cncrad(kOH)*conc(kCPO9)
c      r(221) = rk(221)*cncrad(kOH)*conc(kCOO1)
c      r(222) = rk(222)*cncrad(kOH)*conc(kCOO2)
c      r(223) = rk(223)*cncrad(kOH)*conc(kCOO3)
c      r(224) = rk(224)*cncrad(kOH)*conc(kCOO4)
c      r(225) = rk(225)*cncrad(kOH)*conc(kCOO5)
c      r(226) = rk(226)*cncrad(kOH)*conc(kCOO6)
c      r(227) = rk(227)*cncrad(kOH)*conc(kCOO7)
c      r(228) = rk(228)*cncrad(kOH)*conc(kCOO8)
c      r(229) = rk(229)*cncrad(kOH)*conc(kCOO9)

      r(212) = 0
      r(213) = 0
      r(214) = 0
      r(215) = 0
      r(216) = 0
      r(217) = 0
      r(218) = 0
      r(219) = 0
      r(220) = 0
      r(221) = 0
      r(222) = 0
      r(223) = 0
      r(224) = 0
      r(225) = 0
      r(226) = 0
      r(227) = 0
      r(228) = 0
      r(229) = 0

c      r(230) = rk(230)*cncrad(kOH)*conc(kCBS1)
c      r(231) = rk(231)*cncrad(kOH)*conc(kCBS2)
c      r(232) = rk(232)*cncrad(kOH)*conc(kCBS3)
c      r(233) = rk(233)*cncrad(kOH)*conc(kCBS4)
      r(230) = 0
      r(231) = 0
      r(232) = 0
      r(233) = 0

c      r(234) = rk(234)*cncrad(kOH)*conc(kCAS1)
c      r(235) = rk(235)*cncrad(kOH)*conc(kCAS2)
c      r(236) = rk(236)*cncrad(kOH)*conc(kCAS3)
c      r(237) = rk(237)*cncrad(kOH)*conc(kCAS4)

      r(234) = 0
      r(235) = 0
      r(236) = 0
      r(237) = 0

c
      return
      end
