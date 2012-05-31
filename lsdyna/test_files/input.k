$ LS-DYNA Keyword file
$ author: Tim Hartman
$**************************************#***************************************$
$                                     UNITS
$   length       = m 
$   time         = s
$   mass         = kg        
$   density      = kg/m^3
$   velocity     = m/s
$   acceleration = m/s^2
$   energy       = N*m
$   g            = 9.81
$**************************************#***************************************$
$                                    RULERS
$--------1---------2---------3---------4---------5---------6---------7---------8
$------1-------2-------3-------4-------5-------6-------7-------8-------9------10
$------1---------------2---------------3---------------4-------5-------6-------7
$**************************************#***************************************$
*KEYWORD  
*TITLE
Stress recovery trial
*INCLUDE
input.plate.k
$**************************************#***************************************$
$                              CONTROL & DATABASE
$**************************************#***************************************$
*CONTROL_IMPLICIT_GENERAL
$   imflag       dt0    imform      nsbs       igs     cnstn      form    zero_v
         1      0.01
*CONTROL_OUTPUT
$    npopt    neecho    nrefup    iaccop     opifs    ipnint    ikedit    iflush

$    iprtf    ierode     tet10    msgmax    ipcurv

*CONTROL_STRUCTURED
*CONTROL_TERMINATION
$   endtim    endsyc     dtmin    endeng    endmas
       1.0
*CONTROL_TIMESTEP
$   dtinit    tssfac      isdo    tslimt     dt2ms      lctm     erode     ms1st

$   dt2msf   dt2mslc     imscl

$*DATABASE_BINARY_D3DUMP
$$       dt      lcdt      beam     npltc    psetid
$       1.0
*DATABASE_BINARY_D3PLOT
$       dt      lcdt      beam     npltc    psetid
      0.05
$    ioopt
         
*DATABASE_EXTENT_BINARY
$    neiph     neips    maxint    strflg    sigflg    epsflg    rltflg    engflg
                                       1
$   cmpflg    ieverp    beamip     dcomp      shge     stssz    n3thdt   ialemat
         1
$  nintsld   pkp_sen      sclp               msscl     therm

*DATABASE_NODOUT
       0.5
*DATABASE_ELOUT
       0.5
$*DATABASE_RCFORC
$    0.0001
$*DATABASE_GLSTAT
$    0.0005
*DATABASE_HISTORY_NODE_SET
        51
*DATABASE_HISTORY_SHELL_SET
        51
$******************************************************************************$
$                                 Model Stats                                  $
$________type__________id____________name______________________________________$
$         pid         100            Plate                                     $
$------------------------------------------------------------------------------$
$        nsid          11            -x edge                                   $
$        nsid          12            +x edge                                   $
$        nsid          13            -y edge                                   $
$        nsid          14            +y edge                                   $
$        nsid          20            center node                               $
$------------------------------------------------------------------------------$
$******************************************************************************$
$**************************************#***************************************$
$                                  BCs & ICs
$**************************************#***************************************$
*BOUNDARY_SPC_SET
$     nsid       cid      dofx      dofy      dofz     dofrx     dofry     dofrz
        11                   1         1         1
        12                   1         1         1
        13                   1         1         1
        14                   1         1         1
$**************************************#***************************************$
$                                    LOADS
$**************************************#***************************************$
*DEFINE_CURVE
$     lcid      sidr       sfa       sfo      offa      offo    dattyp
         1                        1.0e+1
$                 ai                  oi
                 0.0                 0.0
                 2.0                 2.0
$**************************************#***************************************$
$                             PARTS, MATS, SECTIONS
$**************************************#***************************************$
*PART_COMPOSITE
$ heading
Layered Plate
$      pid    elform      shrf      nloc     marea      hgid    adpopt
       100        16
$     mid1    thick1        b1                mid2    thick2        b2
         1 0.075e-02       0.0                   1 0.075e-02       0.0
         2 0.075e-02      90.0                   2 0.075e-02      90.0
         1 0.075e-02       0.0                   1 0.075e-02       0.0
         2 0.075e-02      90.0                   2 0.075e-02      90.0
         2 0.075e-02      90.0                   2 0.075e-02      90.0
         1 0.075e-02       0.0                   1 0.075e-02       0.0
         2 0.075e-02      90.0                   2 0.075e-02      90.0
         1 0.075e-02       0.0                   1 0.075e-02       0.0
*MAT_ORTHOTROPIC_ELASTIC
$      mid        ro        ea        eb        ec      prba      prca      prcb
         1  1.00e+04 155.0e+09  12.1e+09  12.1e+09   0.01936   0.01936     0.458
$      gab       gbc       gca      aopt         g      sigf
     4.4e9     3.2e9     4.4e9       0.0
$       xp        yp        zp        a1        a2        a3      macf

$       v1        v2        v3        d1        d2        d3      beta       ref

*MAT_LAMINATED_COMPOSITE_FABRIC
$      mid        ro        ea        eb        ec      prba      tau1    gamma1
         2  1.00e+04 155.0e+09  12.1e+09  12.1e+09   0.01936  50.0e+06 0.0113636
$      gab       gbc       gca    slimt1    slimc1    slimt2    slimc2     slims
   4.4e+09   3.2e+09   4.4e+09       1.0       1.0       1.0       1.0       1.0
$     aopt     tsize     erods      soft        fs
       0.0                 5.0       1.0       1.0
$       xp        yp        zp        a1        a2        a3
       0.0       0.0       0.0       0.0       0.0       0.0
$       v1        v2        v3        d1        d2        d3      beta
       0.0       0.0       0.0       0.0       0.0       0.0       0.0
$     e11c      e11t      e22c      e22t       gms
       1e6       1e6       1e6       1e6       1e6
$       xc        xt        yc        yt        sc
      1e50      1e50      1e50      1e50      1e50
*END
