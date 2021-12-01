C User Subroutine for Exponential Isotropic Material Model
C by Mrudang Mathur 
C-------------------------------------------------------------
      subroutine vuanisohyper_inv (nb, nFiber, nInv, nElement, nIntPt,
     $     nLayer, nSecPt, cmname, nstatev, nfieldv, numprops,
     $     props, tempOld, tempNew, fieldOld, fieldNew, stateOld,
     I sInvariant, zeta, uDev, duDi, d2uDiDi, stateNew)
C
      include 'vaba_param.inc'
C
      character*80 cmname
      dimension  props(numprops),
     $     tempOld(nb), fieldOld(nb,nfieldv),stateOld(nb,nstatev),
     $     tempNew(nb), fieldNew(nb,nfieldv),stateNew(nb,nstatev),
     $ sInvariant (nb, nInv), zeta (nb, nFiber * (nFiber-1) / 2),
     $ uDev (nb), duDi (nb, nInv), d2uDiDi (nb, nInv * (nInv + 1) / 2)
C
C
C
      if (cmname(1:11) .eq. 'VUANISO_HGO') then
         call VUANISOHYPER_INVHGO(sInvariant, uDev, zeta, nFiber, ninv,
     $     duDi, d2uDiDi, nb, numprops, props)
      else if(cmname(1:14) .eq. 'VUANISO_INVISO') then
         call VUANISOHYPER_INVISO(sInvariant, uDev, zeta, nFiber, ninv,
     $     duDi, d2uDiDi, nb, numprops, props)
      else if(cmname(1:17) .eq. 'VUANISO_FUNGINV44') then
         call VUANISOHYPER_FUNGINV44(sInvariant, uDev, zeta, nFiber,
     $ ninv, duDi, d2uDiDi, nb, numprops, props)
      else if(cmname(1:17) .eq. 'VUANISO_FUNGINV45') then
         call VUANISOHYPER_FUNGINV45(sInvariant, uDev, zeta, nFiber, 
     $ ninv, duDi, d2uDiDi, nb, numprops, props)
	  else if(cmname(1:11) .eq. 'VUANISO_ISO') then
         call VUANISOHYPER_ISO(sInvariant, uDev, zeta, nFiber, 
     $ ninv, duDi, d2uDiDi, nb, numprops, props)
      else
         call xplb_abqerr(-2,'User subroutine VUANISOHYPER_INV missing!'
     *        ,intv,zero,' ')
         call xplb_exit
      end if
C
C
C
      return
      end
c------------------------------------------------------------------
c
c     Exponential Isotropic model
c
      subroutine vuanisohyper_iso (ainv, ua, zeta, nfibers, ninv,
     $     ui1, ui2, nb, numprops, props)
C
      include 'vaba_param.inc'
C
      dimension ua(nb), ainv(nb,ninv), ui1(nb,ninv),
     $ ui2 (nb, ninv * (ninv + 1) / 2), props (numprops)
C
c     ainv: invariants
c do: udev
c     ui1 : dUdI
c     ui2 : d2U/dIdJ
C
      parameter ( half = 0.5d0,
     *            zero = 0.d0, 
     *            one  = 1.d0, 
     *            two  = 2.d0, 
     *            three= 3.d0, 
     *            four = 4.d0, 
     *            five = 5.d0, 
     *            six  = 6.d0,
c
     *            index_I1 = 1,
     *            index_J  = 3,
     *            asmall   = 2.d-16  )
C
      C0 = props(1)
      C1 = props(3)
      C2 = props(4)

c
      do kb = 1,nb
        rI1 = ainv(kb,index_I1)        
c
        rI1m3 = rI1 - three
		aux = exp(C2 * rI1m3 * rI1m3)
c
        ua(kb) = half * C0 * rI1m3 + half * C01 * (aux - 1) 
c		
        ui1(kb,index_I1) = half * C0 + C1 * C2 * rI1m3 * aux
c
        ui2(kb,indx(index_I1,index_I1)) = C1 * C2 * aux * (one + two * rI1m3 * rI1m3)		
      end do
c     
c     compressible case
      if(props(2).gt.zero) then
        do kb = 1,nb
          Dinv = one / props(2)
c		  print *,props(2)
          det = ainv (kb, index_J)
		  ui1(kb,index_J) = two*Dinv * (det - one)
          ui2(kb,indx(index_J,index_J))= two*Dinv
c          ui1 (kb, index_J) = Dinv * (det - one / det)
c          ui2 (kb, indx (index_J, index_J)) = Dinv * (one + one / det / det)
        end do
      end if
c
      return
      end
C-------------------------------------------------------------
C     Function to map index from Square to Triangular storage 
C 		 of symmetric matrix
C
      integer function indx( i, j )
      include 'vaba_param.inc'
      ii = min (i, j)
      jj = max(i,j)
      indx = ii + yy * (yy-1) / 2
      return
      end
C-------------------------------------------------------------
C
C     Function to generate enumeration of scalar
C     Pseudo-Invariants of type 4

      integer function indxInv4( i, j )
      include 'vaba_param.inc'
      ii = min (i, j)
      jj = max(i,j)
      indxInv4 = 4 + jj * (jj-1) + 2 * (ii-1)
      return
      end
C-------------------------------------------------------------
C
C     Function to generate enumeration of scalar
C     Pseudo-Invariants of type 5
C
      integer function indxInv5( i, j )
      include 'vaba_param.inc'
      ii = min (i, j)
      jj = max(i,j)
      indxInv5 = 5 + jj * (jj-1) + 2 * (ii-1)
      return
      end
C-------------------------------------------------------------
