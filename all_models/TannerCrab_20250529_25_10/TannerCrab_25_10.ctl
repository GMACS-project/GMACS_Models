##--25_05: 1 M block, 2 NMFS survey q/sel time blocks (attempt to match TCSAM02 2024 assessment model 24_22_03d5)
## ———————————————————————————————————————————————————————————————————————————————————— ##																					
## LEADING PARAMETER CONTROLS                                                           ##																					
##     Controls for leading parameter vector (theta)                                    ##																					
## LEGEND                                                                               ##																					
##     prior: 0 = uniform, 1 = normal, 2 = lognormal, 3 = beta, 4 = gamma               ##																				
## ———————————————————————————————————————————————————————————————————————————————————— ##		

# Block_Groups to be used in the model (Block_Group 0 is the year range)
9
# Number of blocks per Block_Group (after the first block, i.e. 1 means two blocks)
##--group 0 (styr-endyr): base for all (no other groups: recruitment, growth, M2M)
1 #--group 1: M      1980-84
1 #--group 2: NMFS   1982-2024
5 #--group 3: TCF male selectivity, z50
3 #--group 4: TCF male retention
0 #--group 5: TCF females
2 #--group 6: SCF    1997-2004, 2005+
2 #--group 7: RKF    1997-2004, 2005+
2 #--group 8: GFA    1988-1996, 1997+
1 #--group 9: TCF male selectivity, wid 2005+


# Block_Group definitions  (0 is last year)
## Block 0: styr endyr (always defined)
## 1948 2023 #--growth, M2M

## Block_Group 1: M
1980 1984 #--1: elevated mortality period

## Block_Group 2: NMFS 
1982 2024 #--1: current catchability/selectivity (leaving 1948/1975-1981 as "base")

## Block_Group 3: TCF male selectivity
1991 1996  #--1
2005 2009  #--2
2013 2015  #--3
2017 2018  #--4
2020 2023  #--5

## Block_Group 4: TCF male Retention
1991 1996  #--1
2005 2009  #--2
2013 2023  #--3

## Block_Group 5: TCF female selectivity

## Block_Group 6: SCF males and females
1997 2004 #--1
2005 2023 #--2

## Block_Group 7: RKC males and females
1997 2004 #--1
2005 2023 #--2

## Block_Group 8: GFA males and females 
1987 1996 #--1
1997 2023 #--2

## Block_Group 9: TCF selectivity males, wid
2005 2023 #--1

## ———————————————————————————————————————————————————————————————————————————————————— ##																					
## OTHER CONTROLS																					
## ———————————————————————————————————————————————————————————————————————————————————— ##																					
1974   # First year of recruitment estimation	(rdv_syr)																	
2023   # Last year of recruitment estimation    (rdv_eyr)
   1	 # Terminal molting (0 = off, 1 = on). If on, the calc_stock_recruitment_relationship() isn't called in the procedure																					
   1   # Phase for recruitment estimation
  -2   # Phase for recruitment sex-ratio estimation
0.50   # Initial value for recruitment sex-ratio
   5   # Initial conditions (0 = Unfished, 1 = Steady-state fished, 2 = Free parameters, 3 = Free parameters (revised), 5 = Zero population)
   1   # Reference size-class for initial conditons = 3
   1   # Lambda (proportion of mature male biomass for SPR reference points).																					
   0   # Stock-Recruit-Relationship (0 = none, 1 = Beverton-Holt)"																					
   0	 # Use average sex ratio for computing recruitment for reference points (0 = off -i.e. Rec based on End year, 1 = on)
  200  # Years to compute equilibria																			
   8   # Phase for deviation parameters
 -10   # First year of bias-correction
  20   # First full bias-correction
   2   # Last full bias-correction
   0   # Last year of bias-correction
   1   # recruitment size distribution option (0: standard way; 1: Tanner crab approach)

## ———————————————————————————————————————————————————————————————————————————————————— ##
## RECRUITMENT                                                                          ##																					
## ival           lb        ub        phz    prior     p1      p2         # parameter   ##																					
## ———————————————————————————————————————————————————————————————————————————————————— ##																					
    8.0               0        20         -2      0      10.0    20.0         # 1: logR0																					
    8.0    	          0        20         -1      0      10.0    20.0         # 2: logRini, to estimate if NOT initialized at unfished (n68)																					
    6.0               0        20          1      0      10.0    20.0         # 3: logRbar, to estimate if NOT initialized at unfished 																					
   35.1971           10        42.5       -4      0      32.5     2.25        # 4: recruitment size distribution expected value (males or combined)																					
    3.89774           0.1      10.0       -4      0       0.1     5.0         # 5: recruitment size distribution scale (variance component) (males or combined)																				
    0.0 	            -1         1         -4      0       0.0     1.0         # 6: ln-scale offset for female to male recruitment size distribution expected value																				
    0.0 	            -1         1         -4      0       0.0     1.0         # 7: ln-scale offset for female to male recruitment size distribution scale (variance component)																				
    0.0              -1         1         -4      0      -0.70     0.75       # 8: ln(sigma_R)																					
    0.75              0.20      1.00      -2      3       3.0     2.00        # 9: steepness																					
    0.01     	      -1         1         -3      3       1.01    1.01        #10: recruitment autocorrelation	

## ———————————————————————————————————————————————————————————————————————————————————— ##
## Initial abundance (ln-scale)                                                         ##
## ival           lb        ub        phz    prior     p1      p2         # parameter   ##
## ———————————————————————————————————————————————————————————————————————————————————— ##

##  ------------------------------------------------------------------------------------ ##
## Allometry
##  ------------------------------------------------------------------------------------ ##
# weight-at-length input  method:
## 1 = allometry  [w_l = a*l^b]
## 2 = vector by sex
## 3 = matrix by sex
1  #--selected method
# Males: alpha = 0.00027 yields grams. converted units to kg to yield 1000mt when abundance units are in millions 
0.000000270    3.022134   #--mature 													
0.000000270    3.022134   #--immature
# Females alpha = 0.000441, 0.000562 yields grams. converted units to kg to yield 1000mt when abundance units are in millions 
0.000000441    2.898686  #--mature
0.000000562    2.816928  #--immature								
# maturity (by size, 1 row/sex)
# 25  30  35  40  45  50  55  60  65  70  75  80  85  90  95  100  105  110  115  120  125  130  135  140  145  150  155  160  165  170  175  180
   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    1    1    1    1    1    1    1    1    1    1    1    1    1    1    1    1    1 
   0   0   0   0   0   0   0   0   0   1   1   1   1   1   1    1    1    1    1    1    1    1    1    1    1    1    1    1    1    1    1    1 
# legal proportion  (by size, 1 row/sex)
# 25  30  35  40  45  50  55  60  65  70  75  80  85  90  95  100  105  110  115  120  125  130  135  140  145  150  155  160  165  170  175  180
   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0    0    0    0    0    1    1    1    1    1    1    1    1    1    1    1    1
   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0    0
## ———————————————————————————————————————————————————————————————————————————————————— ##																					

## ==================================================================================== ##
## GROWTH PARAMETER CONTROLS                                                            ##
## ==================================================================================== ##
## 
5 5 # Maximum size-class for recruitment(males then females)																					
0   # Use functional maturity for terminally molting animals (0=no; 1=Yes)?

#--General inputs
# Block: Block number for time-varying growth   
# Block_fn: 0:absolute values; 1:exponential
# Env_L: Environmental link - options are 1:additive; 2:multiplicative; 3:exponential
# EnvL_var: Environmental variable
# RW: 0 for not random walk changes; 1 otherwise
# RW_blk: Block number for random walks
# Sigma_RW: Sigma for the random walk parameters
#
#--Growth transition
## Type_1: Options for the growth matrix
#  1: Pre-specified growth transition matrix             (requires molt probability)
#  2: Pre-specified size transition matrix               (molt probability is ignored)
#  3: Growth increment is gamma distributed              (requires molt probability)
#  4: Post-molt size is gamma distributed                (requires molt probability)
#  5: Von Bert.: kappa varies among individuals          (requires molt probability)
#  6: Von Bert.: Linf varies among individuals           (requires molt probability)
#  7: Von Bert.: kappa and Linf varies among individuals (requires molt probability)
#  8: Growth increment is normally distributed           (requires molt probability)
## Type_2: Options for the growth increment model matrix
#  1: Linear
##     1. intercept 
##     2. slope
##     3. gamma distribution scale parameter (on ln-scale)
#  2: Individual
#  3: Individual (Same as 2)
#  4: Power law for mean post-molt size (3 parameters)
##     1. ln-scale intercept 
##     2. ln-scale slope
##     3. gamma distribution scale parameter (on ln-scale)
#  5: Alternative power law for mean post-molt size (5 parameters)
##     1. reference (small) pre-molt size (constant: must have phase < 0)
##     2. mean post-molt size corresponding to 1.
##     3. reference (large) pre-molt size (constant: must have phase < 0)
##     4. mean post-molt size corresponding to 3.
##     5. gamma distribution scale parameter (on arithmetic scale)
#  Block: Block number for time-varying growth   
## Type_1 Type_2  Block
       3     5       0    # Growth-transition Males
       3     5       0    # Growth-transition Females

#--Molt probability
## Options for the molt probability function
#  0: Pre-specified
#  1: Constant at 1
#  2: Logistic
#  3: Individual
## Type Block  
    1     0    # Molt probability Males
    1     0    # Molt probability Female

#--Mature probability                           TODO: revisit this!
## Options for the mature probability function
#  0: Pre-specified
#  1: Constant at 1
#  2: Logistic
#  3: Individual
#  4: spline fit
## Type Block  
    0    0       # Mature probability Males
    0    0       # Mature probability Female

## General parameter specificiations 
##  Initial: Initial value for the parameter (must lie between lower and upper)
##  Lower & Upper: Range for the parameter
##  Prior type:
##   0: Uniform   - parameters are the range of the uniform prior
##   1: Normal    - parameters are the mean and sd
##   2: Lognormal - parameters are the mean and sd of the log
##   3: Beta      - parameters are the two beta parameters [see dbeta]
##   4: Gamma     - parameters are the two gamma parameters [see dgamma]
##  Phase: Set equal to a negative number not to estimate
##  Relative: 0: absolute; 1 relative 
##  Block: Block number for time-varying selectivity   
##  Block_fn: 0:absolute values; 1:exponential
##  Env_L: Environmental link - options are 0:none; 1:additive; 2:multiplicative; 3:exponential
##  EnvL_var: Environmental variable
##  RW: 0 for no random walk changes; 1 otherwise
##  RW_blk: Block number for random walks
##  Sigma_RW: Sigma used for the random walk
#--Parameter inputs for growth increment
# Inputs for sex * type 1 (males)
# MAIN PARS: Initial   LB  UB Prior_type  Prior_1   Prior_2  Phase  Block Blk_fn  Env_L Env_vr  RW RW_Blk RW_Sigma
             25        24  26     0          0        999     -1      0     0      0      0      0    0   0.3000   # small reference pre-molt size (must be a constant)
             32        25  40     0          0        999     -4      0     0      0      0      0    0   0.3000   # mean post-molt size at above
            125       124 126     0          0        999     -1      0     0      0      0      0    0   0.3000   # small reference pre-molt size (must be a constant)
            166       130 180     0          0        999     -4      0     0      0      0      0    0   0.3000   # mean post-molt size at above
            0.82      0.3 2.0     0          0        999     -5      0     0      0      0      0    0   0.3000   # Gscale_male_period_1 (ln-scale)
# EXTRA PARS: Initial  Lower_bound  Upper_bound Prior_type      Prior_1      Prior_2  Phase Reltve 
#----no extra pars
# Inputs for sex * type 2 (females)
# MAIN PARS: Initial  LB  UB Prior_type       Prior_1      Prior_2  Phase  Block Blk_fn  Env_L Env_vr     RW RW_Blk RW_Sigma
             25        24  26     0          0        999     -1      0     0      0      0      0    0   0.3000   # small reference pre-molt size (must be a constant)
             32        25  40     0          0        999     -4      0     0      0      0      0    0   0.3000   # mean post-molt size at above
            100        99 101     0          0        999     -1      0     0      0      0      0    0   0.3000   # small reference pre-molt size (must be a constant)
            115       110 150     0          0        999     -4      0     0      0      0      0    0   0.3000   # mean post-molt size at above
            0.85      0.3 2.0     0          0        999     -5      0     0      0      0      0    0   0.3000   # Gscale_male_period_1 (ln-scale)
# EXTRA PARS: Initial  Lower_bound  Upper_bound Prior_type      Prior_1      Prior_2  Phase Reltve 
#----no extra pars

#--Parameter inputs for probability of molting (probability of molting is fixed at 1 for immature crab)
# Inputs for sex * type 3 (males)
# MAIN PARS: Initial  Lower_bound  Upper_bound Prior_type   Prior_1   Prior_2  Phase  Block Blk_fn  Env_L Env_vr   RW RW_Blk RW_Sigma
#               1.0       -1.0         1.0          0           0.0     999.0     -1      0      0      0      0     0    0     1.0 # Molt_probability_mu_base_male_period_1
#               1.0       -1.0         1.0          0           0.0     999.0     -1      0      0      0      0     0    0     1.0 # Molt_probability_CV_base_male_period_1
# EXTRA PARS: Initial  Lower_bound  Upper_bound Prior_type      Prior_1      Prior_2  Phase Reltve 
# Inputs for sex * type 4 (females)
# MAIN PARS: Initial  Lower_bound  Upper_bound Prior_type   Prior_1   Prior_2  Phase  Block Blk_fn  Env_L Env_vr   RW RW_Blk RW_Sigma
#               1.0       -1.0         1.0          0           0.0     999.0     -1      0      0      0      0     0    0     1.0 # Molt_probability_mu_base_female_period_1
#               1.0       -1.0         1.0          0           0.0     999.0     -1      0      0      0      0     0    0     1.0 # Molt_probability_CV_base_female_period_1
# EXTRA PARS: Initial  Lower_bound  Upper_bound Prior_type  Prior_1      Prior_2  Phase Reltve 

#--Parameter inputs for probability of maturing
# Inputs for sex * type 5 (males)
# MAIN PARS: Initial  Lower_bound  Upper_bound Prior_type       Prior_1      Prior_2  Phase  Block Blk_fn  Env_L Env_vr  RW RW_Blk RW_Sigma
#               120.0     50.0          150.0        0            120.0        999.0     4      0      0      0     0      0     0   1.0000 # Mature_probability_mu_base_male_period_1
#                20.0     10.0           80.0        0             20.0        999.0     4      0      0      0     0      0     0   1.0000 # Mature_probability_CV_base_male_period_1
# EXTRA PARS: Initial  Lower_bound  Upper_bound Prior_type      Prior_1      Prior_2  Phase Reltve 
# Inputs for sex * type 6 (females)
# MAIN PARS: Initial  Lower_bound  Upper_bound Prior_type       Prior_1      Prior_2  Phase  Block Blk_fn  Env_L Env_vr  RW RW_Blk RW_Sigma
#                70.0     40.0          130.0        0             70.0        999.0     4      0      0      0     0      0     0   1.0000 # Mature_probability_mu_base_female_period_1
#                20.0     10.0           80.0        0             20.0        999.0     4      0      0      0     0      0     0   1.0000 # Mature_probability_CV_base_female_period_1
# EXTRA PARS: Initial  Lower_bound  Upper_bound Prior_type      Prior_1      Prior_2  Phase Reltve 


#--pre-specified growth or size transition matrices
#--pre-specified molt probability matrices
#--pre-specified probability of maturing matrices
##--males (mean for all years)
# 25   30   35   40   45   50   55   60   65   70   75   80   85   90   95   100   105   110   115   120   125   130   135   140   145   150   155   160   165   170   175   180    year   
1.68E-04   3.27E-04   6.38E-04   0.001241029   0.002414326   0.004691671   0.009097565   0.017567952   0.033645312   0.062956906   0.112176006   0.184996116   0.275917432   0.371860473   0.460677568   0.53923384   0.613179014   0.688977743   0.769313372   0.846706701   0.909443791   0.951368742   0.975026671   0.987341006   0.993622864   0.996797544   0.998394352   0.999195602   0.999597174   0.999798313   0.99989903   0.999949454   #   1948
##--females (mean for all years)
#  25   30   35   40   45   50   55   60   65   70   75   80   85   90   95   100   105   110   115   120   125   130   135   140   145   150   155   160   165   170   175   180      year   
0.002287103   0.001212232   0.000669859   0.000445324   0.003742105   0.007126075   0.01781986   0.075375171   0.261953156   0.460552625   0.55734892   0.669922394   0.812740586   0.921229814   0.955901076   0.98790913   0.991698005   0.999184072   1   1   1   1   1   1   1   1   1   1

## ==================================================================================== ##
## NATURAL MORTALITIY PARAMETER CONTROLS                                                ##
## ==================================================================================== ##
## baseline M: immature crab; mature M's: sex-specfic ln-scale offsets
# Relative: 0 - absolute values; 1+ - based on another M-at-size vector (indexed by ig)
# Type: 0 for standard; 1: Spline
#  For spline: set extra to the number of knots, the parameters are the knots (phase -1) and the log-differences from base M
# Extra: control the number of knots for splines
# Brkpts: number of changes in M by size
# Mirror: Mirror M-at-size over to that for another partition (indexed by ig)
# Block: Block number for time-varying M-at-size
# Block_fn: 0:absolute values; 1:exponential
# Env_L: Environmental link - options are 0: none; 1:additive; 2:multiplicative; 3:exponential
# EnvL_var: Environmental variable
# RW: 0: no random walk ; 1: reference value mulitplied by exponentiated dev; 2: dev added to reference value
# RW_blk: Block number for random walks
# Sigma_RW: Sigma for the random walk parameters
# Mirror_RW: Should time-varying aspects be mirrored (Indexed by ig)
## Relative?   Type   Extra  Brkpts  Mirror   Block  Blk_fn Env_L   EnvL_Vr      RW  RW_blk Sigma_RW Mirr_RW
       0       0       0       0       0       1       0       0       0       0       0   0.3000       0  # ig 1: sex*maturity state: male & mature
       1       0       0       0       0       0       1       0       0       0       0   0.3000       0  # ig 2: sex*maturity state: male & immature
       1       0       0       0       0       1       1       0       0       0       0   0.3000       0  # ig 3: sex*maturity state: female & mature
       0       0       0       0       2       0       1       0       0       0       0   0.3000       0  # ig 4: sex*maturity state: female & immature

#      Initial    Lower_bound    Upper_bound  Prior_type        Prior_1        Prior_2      Phase 
    0.2300000      0.10000000     1.50000000      1            0.2300000      0.0045400      4 #1--  male,   mature
    0.0000000     -1.00000000     2.00000000      1            0.0000000      0.2500000      4 #2--  male,   mature block group 1 (1980-84)
    0.0000000     -1.00000000     1.00000000      1            0.0000000      0.2500000      4 #3--  male, immature
    0.0000000     -1.00000000     2.00000000      1            0.0000000      0.2500000      4 #4--female,   mature
    0.0000000     -1.00000000     1.00000000      1            0.0000000      0.2500000      4 #5--female,   mature block group 1 (1980-84)
#--not used because this is mirrored to ig 2
#   0.000000      -1.0000000      1.0000000       1            0.0000000      0.2500000      4 #--female, immature
 
## ==================================================================================== ##
## SELECTIVITY/RETENTION PARAMETER CONTROLS                                             ##
## ==================================================================================== ##
# ##  <0: Mirror selectivity
# ##   0: Nonparametric selectivity (one parameter per class)
# ##   1: Nonparametric selectivity (one parameter per class, constant from last specified class)
# ##   2: Logistic selectivity (inflection point and width (i.e. 1/slope))
# ##   3: Logistic selectivity (50% and 95% selection)
# ##   4: Double normal selectivity (3 parameters)
# ##   5: Flat equal to zero (1 parameter; phase must be negative)
# ##   6: Flat equal to one (1 parameter; phase must be negative)
# ##   7: Flat-topped double normal selectivity (4 parameters)
# ##   8: Declining logistic selectivity with initial values (50% and 95% selection plus extra)
# ##   9: Cubic-spline (specified with knots and values at knots)
# ##      Inputs: knots (in length units); values at knots (0-1) - at least one should have phase -1
# ##  10: One parameter logistic selectivity (inflection point and slope)
# ##  11: Pre-specified selectivity (matrix by year and class)
# ##  12: Spline with 0 until one size-class and 1 after another
# ##      Inputs: knots (in length units); values at knots (0-1) - at least one should have phase -1
# ##  13: Stacked logistic
# ##  14. Ascending normal (2 parameters: ascending width, size at mode)
## Selectivity specifications --
# ## Extra (type 1): number of selectivity parameters to estimated
## 1   2   3   4   5   6   
##  TCF   SCF   RKF   GFA   NMFS   BSFRF   
      1    1     1     1     1       1   # sex specific selectivity
      2    4    14     2    14      11   #   males:   selectivity type (slx_type_in, to mirror, make negative and equal to the fleet to be mirrored)
      2    2    14     2    14      11   # females:   selectivity type (slx_type_in, to mirror, make negative and equal to the fleet to be mirrored)
      0    0     0     0     0       0   # within another gear
      0    0     0     0     0       0   #   males:   extra parameters for each pattern by fleet
      0    0     0     0     0       0   # females:   extra parameters for each pattern by fleet
      1    0     1     1     0       0   #   males:   determines if maximum selectivity at size is forced to equal 1 or not
      1    1     1     1     0       0   # females:   determines if maximum selectivity at size is forced to equal 1 or not
      0    0     0     0     0       0   #   males:   size-class index at which selectivity is 1 (ignored if max-sxl-at-size above is 1)
      0    0     0     0     0       0   # females:   size-class index at which selectivity is 1 (ignored if max-sxl-at-size above is 1)
##  TCF   SCF   RKF   GFA   NMFS   BSFRF   
      1    0     0     0     0      0   # sex specific retention
      2    5     5     5     5      5   #   males: retention type
      5    5     5     5     5      5   # females: retention type
      1    0     0     0     0      0   #   males: retention flag (0 = no, 1 = yes)
      0    0     0     0     0      0   # females: retention flag (0 = no, 1 = yes)
      0    0     0     0     0      0   #   males: extra parameters for each pattern by fleet
      0    0     0     0     0      0   # females: extra parameters for each pattern by fleet
      0    0     0     0     0      0   #   males: estimate maximum retention (1=Yes, 0=No)
      0    0     0     0     0      0   # females: estimate maximum retention (1=Yes, 0=No)
## ==================================================================================== ##
## SELECTIVITY/RETENTION PARAMETER VALUES                                               ##
## ==================================================================================== ##
#Initial	Lower_bound	Upper_bound	Prior_type	Prior_1	Prior_2	Phase	Block	Block_fn	Env_L	EnvL_var	RW	RW_Block	Sigma
#--male selectivity
#Init   LB     UB   PrT  Pr1  Pr1  Phz  Blk  BlkFn  EnvL  EnvLV  RW  RW_Blk  Sigma  
100     5     180   0   100   999   4    0     0     0     0     2    3       0.3  #1--z50:   TCF males logistic z50 base
 20     1     100   0    20   999   4    9     0     0     0     0    0       0.3  #2--width: TCF males logistic wid base 
# EXTRA PARS:  Initial   LB     UB  PrTyp  Pr1   Pr2  Phz  Relative
                  20     1      50   0      20   999   4      0       #3--width: TCF males logistic wid BG 9, block 1

#Init   LB     UB   PrT  Pr1  Pr1  Phz  Blk  BlkFn  EnvL  EnvLV  RW  RW_Blk  Sigma   
 20     1     100   0    20   999   4    6     0     0     0     0    0       0.3  #7--ascending width:  SCF males block group 4 base
100     5     180   0   100   999   4    6     0     0     0     0    0       0.3  #8--z50:              SCF males block group 4 base
 20     1     100   0    20   999   4    6     0     0     0     0    0       0.3  #9--descending width: SCF males block group 4 base
# EXTRA PARS:  Initial   LB     UB  PrTyp  Pr1   Pr2  Phz  Relative
                   20     1     100   0     20   999   4     0     #10--ascending width:  SCF males block group 4 block 1
                   20     1     100   0     20   999   4     0     #11--ascending width:  SCF males block group 4 block 2
                  100     5     180   0    100   999   4     0     #12--z50:              SCF males block group 4 block 1
                  100     5     180   0    100   999   4     0     #13--z50:              SCF males block group 4 block 2
                   20     1     100   0     20   999   4     0     #14--descending width: SCF males block group 4 block 1
                   20     1     100   0     20   999   4     0     #15--descending width: SCF males block group 4 block 2

#Init   LB     UB   PrT  Pr1  Pr1  Phz  Blk  BlkFn  EnvL  EnvLV  RW  RW_Blk  Sigma  
 20     1     100   0    20   999   4    7     0     0     0     0    0       0.3  #17--width: RKF males
100     5     180   0   100   999   4    7     0     0     0     0    0       0.3  #16--mode:  RKF males
# EXTRA PARS:  Initial   LB     UB  PrTyp  Pr1   Pr2  Phz  Relative
                  20     1     100    0     20   999   4      0     #17--width: RKF males
                  20     1     100    0     20   999   4      0     #17--width: RKF males
                 100     5     180    0    100   999   4      0     #16--mode:   RKF males
                 100     5     180    0    100   999   4      0     #16--mode:   RKF males

#Init   LB     UB   PrT  Pr1  Pr1  Phz  Blk  BlkFn  EnvL  EnvLV  RW  RW_Blk  Sigma  
100     5     180   0   100   999   4    8     0     0     0     0    0       0.3  #18--z50:   GFA males
 20     1     100   0    20   999   4    8     0     0     0     0    0       0.3  #19--width: GFA males
# EXTRA PARS:  Initial   LB     UB  PrTyp  Pr1   Pr2  Phz  Relative
                 100     5     180    0    100   999   4      0     #18--z50:   GFA males
                 100     5     180    0    100   999   4      0     #18--z50:   GFA males
                  20     1     100    0     20   999   4      0     #19--width: GFA males
                  20     1     100    0     20   999   4      0     #19--width: GFA males

#Init   LB     UB   PrT  Pr1  Pr1  Phz  Blk  BlkFn  EnvL  EnvLV  RW  RW_Blk  Sigma  
 20     1     100   0    20   999   4    2     0     0     0     0    0       0.3  #20--asc. width: NMFS males base (1975-1981)
100     5     180   0   100   999   4    2     0     0     0     0    0       0.3  #21--mode z50:   NMFS males base (1975-1981)
# EXTRA PARS:  Initial  Lower_bound  Upper_bound Prior_type     Prior_1      Prior_2     Phase  Relative
            20.000000     1.000000   100.000000      0         20.000000   999.000000      4       0     # 22 Sel_NMFS_male_asc_normal_cv_block_group_1_block_1
           100.000000     5.000000   180.000000      0        100.000000   999.000000      4       0     # 23 Sel_NMFS_male_asc_normal_mode_block_group_1_block_1
#--females
#Init   LB     UB   PrT  Pr1  Pr1  Phz  Blk  BlkFn  EnvL  EnvLV  RW  RW_Blk  Sigma  
60      5     180   0   100   999   4    0     0     0     0     0    0       0.3  #24--z50:   TCF females
 20     1     100   0    20   999   4    0     0     0     0     0    0       0.3  #25--width: TCF females

#Init   LB     UB   PrT  Pr1  Pr1  Phz  Blk  BlkFn  EnvL  EnvLV  RW  RW_Blk  Sigma  
60      5     180   0   100   999   4    6     0     0     0     0    0       0.3  #26--z50:   SCF females
 20     1     100   0    20   999   4    6     0     0     0     0    0       0.3  #27--width: SCF females
# EXTRA PARS:  Initial   LB     UB  PrTyp  Pr1   Pr2  Phz  Relative
                 100      5     180   0   100    999   4      0     #26--z50:   SCF females
                 100      5     180   0   100    999   4      0     #26--z50:   SCF females
                  20      1     100   0    20    999   4      0     #27--width: SCF females
                  20      1     100   0    20    999   4      0     #27--width: SCF females

#Init   LB     UB   PrT  Pr1  Pr1  Phz  Blk  BlkFn  EnvL  EnvLV  RW  RW_Blk  Sigma  
 20     1      50   0    20   999   4    7     0     0     0     0    0       0.3  #29--width: RKF females
60      5     150   0   100   999   4    7     0     0     0     0    0       0.3  #28--mode:  RKF females
# EXTRA PARS:  Initial   LB     UB  PrTyp  Pr1   Pr2  Phz  Relative
                  20      1     100   0    20    999   4      0     #29--width: RKF females
                  20      1     100   0    20    999   4      0     #29--width: RKF females
                 100      5     180   0   100    999   4      0     #28--mode:  RKF females
                 100      5     180   0   100    999   4      0     #28--mode:  RKF females

#Init   LB     UB   PrT  Pr1  Pr1  Phz  Blk  BlkFn  EnvL  EnvLV  RW  RW_Blk  Sigma  
60      5     180   0   100   999   4    8     0     0     0     0    0       0.3  #30--z50:   GFA females
 20     1     100   0    20   999   4    8     0     0     0     0    0       0.3  #31--width: GFA females
# EXTRA PARS:  Initial   LB     UB  PrTyp  Pr1   Pr2  Phz  Relative
                 100      5     180   0   100    999   4      0     #30--z50:   GFA females
                 100      5     180   0   100    999   4      0     #30--z50:   GFA females
                  20      1     100   0    20    999   4      0     #31--width: GFA females
                  20      1     100   0    20    999   4      0     #31--width: GFA females

#Init   LB     UB   PrT  Pr1  Pr1  Phz  Blk  BlkFn  EnvL  EnvLV  RW  RW_Blk  Sigma  
 20     1     100   0    20   999   4    2     0     0     0     0    0       0.3  #32--asc. width: NMFS females base
60      5     180   0   100   999   4    2     0     0     0     0    0       0.3  #33--mode z50:   NMFS females base
# EXTRA PARS:  Initial  Lower_bound  Upper_bound Prior_type     Prior_1      Prior_2  Phase  Relative
              20.000000   1.000000   100.000000       0       20.000000   999.000000    4       0       #34 Sel_NMFS_female_asc_normal_cv_block_group_1_block_1
              60.000000   5.000000   180.000000       0       60.000000   999.000000    4       0       #35 Sel_NMFS_female_asc_normal_mode_block_group_1_block_1
#--Retention
#Init   LB     UB   PrT  Pr1  Pr1  Phz  Blk  BlkFn  EnvL  EnvLV  RW  RW_Blk  Sigma  
125     5     180   0   125   999   4    4     0     0     0     0    0       0.3  #56--z50:   TCF males base
 20     0.01  100   0    20   999   4    4     0     0     0     0    0       0.3  #57--width: TCF males base 
# EXTRA PARS:  Initial   LB     UB  PrTyp  Pr1   Pr2  Phz  Relative
                 125     5     180    0    125   999   4       0     #58--z50:   TCF males BG3, block 1 1991-1996
                 125     5     180    0    125   999   4       0     #59--z50:   TCF males BG3, block 2 2005-2009
                 125     5     180    0    125   999   4       0     #59--z50:   TCF males BG3, block 3 2013-2023
                  20     0.01  100    0     20   999   4       0     #60--width: TCF males BG3, block 1
                  20     0.01  100    0     20   999   4       0     #61--width: TCF males BG3, block 2
                  20     0.01  100    0     20   999   4       0     #61--width: TCF males BG3, block 3

# pre-specified selectivity/retention (ordered by type, sex, fleet and year)
##--BSFRF males
#27.5 32.5 37.5 42.5 47.5 52.5 57.5 62.5 67.5 72.5 77.5 82.5 87.5 92.5 97.5 102.5 107.5 112.5 117.5 122.5 127.5 132.5 137.5 142.5 147.5 152.5 157.5 162.5 167.5 172.5 177.5 182.5 #--year
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1948
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1949
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1950
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1951
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1952
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1953
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1954
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1955
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1956
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1957
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1958
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1959
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1960
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1961
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1962
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1963
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1964
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1965
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1966
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1967
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1968
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1969
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1970
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1971
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1972
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1973
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1974
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1975
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1976
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1977
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1978
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1979
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1980
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1981
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1982
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1983
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1984
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1985
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1986
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1987
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1988
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1989
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1990
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1991
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1992
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1993
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1994
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1995
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1996
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1997
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1998
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1999
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2000
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2001
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2002
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2003
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2004
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2005
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2006
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2007
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2008
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2009
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2010
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2011
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2012
0.001633084   0.003370465   0.006442352   0.01057896   0.01395342   0.01546712   0.0165836   0.01983511   0.0285981   0.04471326   0.0662343   0.08295722   0.08986231   0.093178   0.1021162   0.1240659   0.158191   0.1987081   0.2346777   0.2643606   0.2946109   0.3348432   0.385463   0.427814   0.4394742   0.403483   0.3304234   0.2443845   0.1681316   0   0   0   #--   2013
0.002928989   0.006695252   0.01366622   0.02234824   0.02662882   0.02453896   0.02113826   0.02068254   0.02592166   0.03776376   0.05586802   0.07455049   0.09030739   0.1075474   0.1356633   0.1836166   0.2426255   0.2873681   0.2900423   0.2684122   0.2604763   0.303135   0.415157   0.5515465   0.6402676   0.640852   0.5800666   0.5049346   0.4690948   0.492378   0.5563231   0   #--   2014
0.01321698   0.02851567   0.0530623   0.07508334   0.07299639   0.05374412   0.03963658   0.03957282   0.06257666   0.1206222   0.2060428   0.251977   0.2324349   0.1879692   0.1562924   0.1489552   0.1548343   0.1630095   0.1635384   0.1615086   0.1695066   0.2029828   0.2745999   0.3749157   0.4728443   0.5325082   0.5470862   0.520369   0.4557879   0.3633773   0   0   #--   2015
0.1199457   0.1092634   0.1017665   0.09926233   0.103745   0.117193   0.1423817   0.1843702   0.2469806   0.3192581   0.3769266   0.394334   0.3788004   0.3590365   0.3627624   0.4018469   0.4537906   0.4880355   0.4779959   0.4356935   0.3915723   0.3737326   0.3894784   0.4176922   0.4335969   0.4188096   0.3958646   0.400273   0.4680484   0.608443   0   0   #--   2016
0.3115137   0.3167607   0.3343673   0.3783394   0.464142   0.5751002   0.6623519   0.689475   0.6434103   0.5547699   0.4751945   0.457124   0.4969562   0.5573048   0.5995879   0.6051449   0.5903564   0.5752582   0.5777283   0.5935794   0.6081349   0.6072776   0.582952   0.5360959   0.4692179   0.390146   0.3220018   0.2858821   0.2972279   0.3629179   0   0   #--   2017
0.5152122   0.4294163   0.3628397   0.3297445   0.3404595   0.3925152   0.4693255   0.5476549   0.6080181   0.6501694   0.677999   0.6950612   0.7030778   0.7025074   0.6933931   0.6772601   0.6596455   0.6471946   0.6457533   0.6518453   0.6575336   0.6550881   0.6407167   0.6166769   0.5859019   0.5510857   0.5114689   0.4651931   0.4110481   0   0   0   #--   2018
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2019
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2020
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2021
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2022
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2023
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2024
##--BSFRF females
#27.5 32.5 37.5 42.5 47.5 52.5 57.5 62.5 67.5 72.5 77.5 82.5 87.5 92.5 97.5 102.5 107.5 112.5 117.5 122.5 127.5 132.5 137.5 142.5 147.5 152.5 157.5 162.5 167.5 172.5 177.5 182.5 #--year
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1948
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1949
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1950
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1951
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1952
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1953
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1954
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1955
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1956
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1957
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1958
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1959
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1960
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1961
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1962
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1963
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1964
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1965
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1966
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1967
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1968
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1969
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1970
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1971
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1972
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1973
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1974
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1975
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1976
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1977
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1978
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1979
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1980
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1981
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1982
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1983
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1984
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1985
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1986
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1987
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1988
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1989
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1990
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1991
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1992
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1993
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1994
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1995
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1996
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1997
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1998
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   1999
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2000
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2001
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2002
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2003
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2004
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2005
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2006
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2007
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2008
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2009
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2010
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2011
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2012
0.001816498   0.00598675   0.01200295   0.01061233   0.007400889   0.008771722   0.01343101   0.01334086   0.01069891   0.01487081   0.03653687   0.08539888   0.1483108   0.2261759   0.3581964   0.6181084   0.8292825   0.713034   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2013
0.002911754   0.006019654   0.01151139   0.0190958   0.02744807   0.03475847   0.03812784   0.03535567   0.03011217   0.02737232   0.02846237   0.03375363   0.04669668   0.0791139   0.1596744   0.3290483   0.5770673   0.7927837   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2014
0.00688077   0.01300305   0.02312213   0.03673131   0.050858   0.06033714   0.05874379   0.04504076   0.03285169   0.03178227   0.04045336   0.05024524   0.05769723   0.07685522   0.138487   0.3235833   0.6809857   0.9184479   0.9829665   0.9965207   0   0   0   0   0   0   0   0   0   0   0   0   #--   2015
0.08841084   0.09677277   0.09901672   0.09282167   0.1013223   0.1615083   0.2384508   0.1869171   0.1087663   0.1327077   0.2892467   0.4083239   0.3735183   0.4010196   0.5593461   0.6279155   0.654833   0.9615099   0.9999535   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2016
0.3872241   0.3874446   0.408707   0.4673267   0.5433369   0.6022596   0.6214633   0.5882422   0.5458676   0.5743818   0.6501818   0.6720855   0.6216145   0.5617391   0.4806249   0.2508185   0.04491329   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2017
0.4295606   0.4681835   0.469057   0.4105867   0.3614672   0.4007185   0.5163268   0.6394019   0.7252659   0.7669828   0.7873171   0.8194688   0.8582474   0.8750538   0.8633813   0.8310746   0.7842028   0.7273219   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2018
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2019
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2020
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2021
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2022
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2023
0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   #--   2024
## ==================================================================================== ##
## CATCHABILITY PARAMETER CONTROLS                                                      ##
## ==================================================================================== ##
# Analytic: should q be estimated analytically (1) or not (0)
# Lambda  : the weight lambda
# Emphasis: the weighting emphasis
# Block   : Block_Group number for time-varying q
# Block_fn: 0:absolute values; 1:exponential
# Env_L   : Environmental link - options are 0: none; 1:additive; 2:multiplicative; 3:exponential
# EnvL_var: Environmental variable
# RW      : 0 for no random walk changes; 1 otherwise
# RW_blk  : Block number for random walks
# Sigma_RW: Sigma for the random walk parameters
## Analytic? LAMBDA Emphasis Mirror block Env_L EnvL_Var  RW RW_blk Sigma_RW
      0        1        1      0     2     0        0      0    0       0.3    # Index 1: NMFS males        (BG 2 has 1 block, so 1 additional q)
      0        1        1      0     2     0        0      0    0       0.3    # Index 2: NMFS imm females  (BG 2 has 1 block, so 1 additional q)
      0        1        1      2     0     0        0      0    0       0.3    # Index 3: NMFS mat females  (no q, mirrored to imm. females)
      0        1        1      0     0     0        0      0    0       0.3    # Index 4: BSFRF males       (1 q)
      0        1        1      4     0     0        0      0    0       0.3    # Index 5: BSFRF imm females (1 q)
      0        1        1      4     0     0        0      0    0       0.3    # Index 6: BSFRF matfemales  (no q, mirrored)
### ———————————————————————————————————————————————————————————————————————————————————— ##
## CATCHABILITY PARAMETERS: VALUES                                                      ##
## prior: 0 = uniform, 1 = normal, 2 = lognormal, 3 = beta, 4 = gamma                   ##
##     If a uniform prior is selected for a parameter then the lb and ub are used (p1   ##
##     and p2 are ignored). ival must be > 0                                            ##
## ———————————————————————————————————————————————————————————————————————————————————— ##
## ival     lb       ub       prior        p1     p2     phz
   0.8     0.01      1.1        1        0.8     0.2     5    # q_par 1: Relative Abundance Index 1: NMFS males             base
   0.9     0.01      1.1        0        0.8     0.2     5    # q_par 2: Relative Abundance Index 1: NMFS males             block 1 (BG 2)
   0.8     0.01      1.1        1        0.8     0.2     5    # q_par 3: Relative Abundance Index 2: NMFS imm females       base
   0.8     0.01      1.1        1        0.8     0.2     5    # q_par 4: Relative Abundance Index 2: NMFS imm females       block 1 (BG 2)
   1.0     0.01      1.1        0        0.8     0.3    -5    # q_par 5: Relative Abundance Index 4: BSFRF males base       (no block group)
## 
## ———————————————————————————————————————————————————————————————————————————————————— ##
## ADDITIONAL CV FOR SURVEYS/INDICES: CONTROLS                                          ##
## ———————————————————————————————————————————————————————————————————————————————————— ##
# Mirror: should additional variance be mirrored (value > 1) or not (0)?                ##
# Block: Block number for time-varying additional variance                              ##
# Block_fn: 0: absolute values; 1: exponential                                          ##
# Env_L: Environmental link -                                                           ##
#          options are 0: none; 1: additive; 2: multiplicative; 3: exponential          ##
# EnvL_var: Environmental variable                                                      ##
# RW: 0: no random walk changes; 1: otherwise                                           ##
# RW_blk: Block number for random walks                                                 ##
# Sigma_RW: Sigma for the random walk parameters                                        ##
## ———————————————————————————————————————————————————————————————————————————————————— ##
##   Mirror   Block   Env_L EnvL_Vr     RW   RW_blk Sigma_RW
       0       0       0       0        0       0   0.3   # Relative Abundance Index 1: NMFS males
       0       0       0       0        0       0   0.3   # Relative Abundance Index 2: NMFS immature females
       2       0       0       0        0       0   0.3   # Relative Abundance Index 3: NMFS mature females
       0       0       0       0        0       0   0.3   # Relative Abundance Index 4: BSFRF males
       4       0       0       0        0       0   0.3   # Relative Abundance Index 5: BSFRF immature females
       4       0       0       0        0       0   0.3   # Relative Abundance Index 6: BSFRF mature females
## ———————————————————————————————————————————————————————————————————————————————————— ##
## ADDITIONAL CV FOR SURVEYS/INDICES: PARAMETER VALUES                                  ##
## ———————————————————————————————————————————————————————————————————————————————————— ##
##  prior type: 0 = uniform, 1 = normal, 2 = lognormal, 3 = beta, 4 = gamma             ##
##     If a uniform prior is selected for a parameter then the lb and ub are used (p1   ##
##     and p2 are ignored). ival must be > 0                                            ##
## ———————————————————————————————————————————————————————————————————————————————————— ##
## ival        lb        ub      prior          p1      p2       phz
   0.0001      0.00001   10.0        0         1.0     100       -4 # addCV_par 1: Relative Abundance Index 1--NMFS males
   0.0001      0.00001   10.0        0         1.0     100       -4 # addCV_par 2: Relative Abundance Index 2--NMFS immature females
#--NMFS mature females mirrored to imm. females
   0.0001      0.00001   10.0        0         1.0     100       -4 # addCV_par 3: Relative Abundance Index 4--BSFRF males
 #--BSFRF immature females mirrored to males
 #--BSFRF   mature females mirrored to males

## ==================================================================================== ##
## CONTROLS ON F                                                                        ##
## ==================================================================================== ##
## 
# Controls on F
#--male init F's are arithmetic scale, female init F's are multiplicative offsets
#  -Init Mean F-   -----Pen_SD-----     -Mean F Phase-   -Mean F Bounds- -Annual Male F-  -Mean Female F-
#  male   female    (early)  (later)     males  females    lower  upper     lower upper      lower upper
     0.1   0.1       0.5     45.50       1       4         -12     4        -10   10         -10   -0.5  # TCF
     0.1   0.1       0.5     45.50       1       4         -12     4        -10   10         -10   -0.5  # SCF
     0.1   0.1       0.5     45.50       1       4         -12     4        -10   10         -10   -0.5  # RKF
     0.1   0.1       0.5     45.50       1       4         -12     4        -10   10         -10   -0.5  # GFA
     0.0   0.0       0.0      0.00      -1      -1         -12     4        -10   10         -10   -0.5  # NMFS
     0.0   0.0       0.0      0.00      -1      -1         -12     4        -10   10         -10   -0.5  # BSFRF
## ———————————————————————————————————————————————————————————————————————————————————— ##
## OPTIONS FOR SIZE COMPOSTION DATA                                                     ##
## ———————————————————————————————————————————————————————————————————————————————————— ##
## One column for each data matrix in order of entry into dat file                      ##
## LEGEND                                                                               ##
##     Likelihood: 1 = Multinomial with estimated/fixed sample size                     ##
##                 2 = Robust approximation to multinomial                              ##
##                 3 = logistic normal (NIY)                                            ##
##                 4 = multivariate-t (NIY)                                             ##
##                 5 = Dirichlet                                                        ##
## AUTO TAIL COMPRESSION                                                                ##
##     pmin is the cumulative proportion used in tail compression                       ##
## ———————————————————————————————————————————————————————————————————————————————————— ##
#     1      2      3      4      5      6      7      8      9     10     11     12      13    14     15 
#    TCF    TCF    TCF    SCF    SCF    RKF    RKF    GFA    GFA   NMFS   NMFS   NMFS   BSFRF  BSFRF  BSFRF
#     M      M      F      M      F      M      F      M      F     IF     MF     AM      IF    MF     AM
#    ret    tot    tot    tot    tot    tot    tot    tot    tot    tot    tot   tot     tot   tot    tot
#   allSC  allSC  allSC  allSC  allSC  allSC  allSC  allSC  allSC  allSC  allSC allSC   allSC allSC  allSC
#   allMat allMat allMat allMat allMat allMat allMat allMat allMat  imm   mat  allMat    imm   mat   allMat
      1      1      1      1      1      1      1      1      1      1      1      1      1     1      1   # Type of likelihood
      0      0      0      0      0      0      0      0      0      0      0      0      0     0      0   # Auto tail compression
      0      0      0      0      0      0      0      0      0      0      0      0      0     0      0   # Auto tail compression (pmin)
      1      2      2      4      4      6      6      8      8     10     11     12     13    14     15   # Composition aggregator codes
      1      1      1      1      1      1      1      1      1      2      2      2      2     2      2   # Set to 1 for catch-based predictions; 2 for survey or total catch predictions
      1      1      1      1      1      1      1      1      1      1      1      1      1     1      1   # Lambda for effective sample size
      1      1      1      1      1      1      1      1      1      1      1      1      1     1      1   # Lambda for overall likelihood
      0      0      0      0      0      0      0      0      0      2      3      1      5     6      4   # Survey to set Q for this comp
## ———————————————————————————————————————————————————————————————————————————————————— ##																					

#--the number of parameters listed here must match the MAXIMUM composition aggregator index
#      Initial    Lower_bound    Upper_bound  Prior_type        Prior_1        Prior_2  Phase 
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--1
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--2
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--3
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--4
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--5
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--6
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--7
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--8
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--9
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--10
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--11
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--12
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--13
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--14
    1.00000000     0.10000000     5.00000000           0     0.00000000   999.00000000     -4 #--15


## ==================================================================================== ##
## EMPHASIS FACTORS                                                                     ##
## ==================================================================================== ##

0.0000 # Emphasis on tagging data

# Emphasis on Catch: (by catch dataframes)
 100.0000 #--TCF retained catch
   1.0000 #--TCF total catch combined
   1.0000 #--SCF males
   1.0000 #--RKF males 
   1.0000 #--GFA combined

# Weights for penalties 1, 11, and 12 (1 line / fleet)
#   Mean_M_fdevs | Mean_F_fdevs |  Ann_M_fdevs |  Ann_F_fdevs
      1.0000         0.1000         1.0000         1.0000 # TCF
      1.0000         0.1000         1.0000         1.0000 # SCF
      1.0000         0.1000         1.0000         1.0000 # RKF
      1.0000         0.1000         1.0000         1.0000 # GFA
      0.0000         0.0000         0.0000         0.0000 # NMFS
      0.0000         0.0000         0.0000         0.0000 # BSFRF

## Emphasis Factors (Priors/Penalties: 13 values) ##
 10000.0000 #--Penalty on log_fdev (male+combined; female) to ensure they sum to zero
     1.0000 #--Penalty on mean F by fleet to regularize the solution
     0.0000 #--Not used
     0.0000 #--Not used
     0.0000 #--Not used
     0.0000 #--Smoothness penalty on the recruitment devs
     0.0000 #--Penalty on the difference of the mean_sex_ratio from 0.5
     0.0000 #--Smoothness penalty on molting probability
     0.0000 #--Smoothness penalty on selectivity patterns with class-specific coefficients
     0.0000 #--Smoothness penalty on initial numbers at length
     1.0000 #--Penalty on annual F-devs for males by fleet
     1.0000 #--Penalty on annual F-devs for females by fleet
     1.0000 #--Penalty on deviation parameters
## EOF
9999
