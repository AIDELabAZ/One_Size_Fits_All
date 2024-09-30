/********************************************************************************
*																				*
*					Code for One Size Fits All? (2020)							*
*																				*
********************************************************************************/

*Packages necessary to run the code
*leebounds
*rwolf
*ritest
*eststo

use "Arouna_et_al_AJAE_data.dta", clear

*Set global variables
quietly tabulate lga, generate(_lga)

global hhvar age tailmen educ2 agric njour_agri_form credit_riz ricearea
global covar age tailmen educ2 agric njour_agri_form credit_riz
global prodvar Yieldn RBE Qnpk_T Qurea_T
global depvar Yieldn RBE Qnpk_T Qurea_T
global lga _lga2 _lga3 _lga4 _lga5


/********************************************************************************
*				Figure 1.A & 1.B: Screenshot of RiceAdvice						*
********************************************************************************/

*Figure does not rely on RCT data

/********************************************************************************
*						Figure 2: Experiment design								*
********************************************************************************/

*Figure does not rely on RCT data
	
/********************************************************************************
*					Figure 3: Outcomes by treatment group						*
********************************************************************************/

by ntreatment, sort: sum $depvar if year != 0

twoway 	(kdensity Yieldn if ntreatment == 1 & year != 0, lwidth(medium) lcolor(black) lpattern(solid)) ///
		(kdensity Yieldn if ntreatment == 2 & year != 0, lwidth(medthick) lcolor(gs10) lpattern(dash)) ///
		(kdensity Yieldn if ntreatment == 3 & year != 0, lwidth(medthick) lcolor(sky) lpattern(shortdash_dot) ///
		ytitle("Density") xtitle("Rice yield (t/ha)") ///
		xline(3.755393, lpattern(solid) lwidth(thin) lcolor(black)) ///
		text(0.01 `=3.755393-.1' "Control mean", color(black) j(left) size(vsmall) place(nw) orient(vertical)) ///
		xline(4.253655, lpattern(solid) lwidth(thin) lcolor(gs10)) ///
		text(0.01 `=4.253655-.1' "T1 mean", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		xline(4.323538, lpattern(solid) lwidth(thin) lcolor(sky)) ///
		text(0.01 `=4.323538+.1' "T2 mean", color(sky) j(left) size(vsmall) place(ne) orient(vertical))), ///
		legend(label(1 "Control [C]") label(2 "RiceAdvice [T1]") label(3 "RiceAdivce + Subsidy [T2]") ///
		position(6) col(3) row(1)) saving(Yieldn, replace)
		
		graph export "Yieldn.png", as(png) replace

twoway 	(kdensity RBE if ntreatment == 1 & year != 0, lwidth(medium) lcolor(black) lpattern(solid)) ///
		(kdensity RBE if ntreatment == 2 & year != 0, lwidth(medthick) lcolor(gs10) lpattern(dash)) ///
		(kdensity RBE if ntreatment == 3 & year != 0, lwidth(medthick) lcolor(sky) lpattern(shortdash_dot) ///
		ytitle("Density") xtitle("Profit (US$/ha)") ///
		xline(1180.672, lpattern(solid) lwidth(thin) lcolor(black)) ///
		text(.00001 `=1180.672-20' "Control mean", color(black) j(left) size(vsmall) place(nw) orient(vertical)) ///
		xline(1384.187, lpattern(solid) lwidth(thin) lcolor(gs10)) ///
		text(.00001 `=1384.187-20' "T1 mean", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		xline(1406.868, lpattern(solid) lwidth(thin) lcolor(sky)) ///
		text(.00001 `=1406.868+20' "T2 mean", color(sky) j(left) size(vsmall) place(ne) orient(vertical))), ///
		legend(label(1 "Control [C]") label(2 "RiceAdvice [T1]") label(3 "RiceAdivce + Subsidy [T2]") ///
		position(6) col(3) row(1)) saving(RBE, replace)
		
		graph export "RBE.png", as(png) replace

twoway 	(kdensity Qnpk_T if ntreatment == 1 & year != 0, lwidth(medium) lcolor(black) lpattern(solid)) ///
		(kdensity Qnpk_T if ntreatment == 2 & year != 0, lwidth(medthick) lcolor(gs10) lpattern(dash)) ///
		(kdensity Qnpk_T if ntreatment == 3 & year != 0, lwidth(medthick) lcolor(sky) lpattern(shortdash_dot) ///
		ytitle("Density") xtitle("Quantity of NPK (kg/ha)") ///
		xline(210.4447, lpattern(solid) lwidth(thin) lcolor(black)) ///
		text(.00005 `=210.4447+5' "Control mean", color(black) j(left) size(vsmall) place(ne) orient(vertical)) ///
		xline(196.2159, lpattern(solid) lwidth(thin) lcolor(gs10)) ///
		text(.00005 `=196.2159-5' "T1 mean", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		xline(173.9034, lpattern(solid) lwidth(thin) lcolor(sky)) ///
		text(.00005 `=173.9034-5' "T2 mean", color(sky) j(left) size(vsmall) place(nw) orient(vertical))), ///
		legend(label(1 "Control [C]") label(2 "RiceAdvice [T1]") label(3 "RiceAdivce + Subsidy [T2]") ///
		position(6) col(3) row(1)) saving(Qnpk_T, replace)
		
		graph export "Qnpk_T.png", as(png) replace		
	
twoway 	(kdensity Qurea_T if ntreatment == 1 & year != 0, lwidth(medium) lcolor(black) lpattern(solid)) ///
		(kdensity Qurea_T if ntreatment == 2 & year != 0, lwidth(medthick) lcolor(gs10) lpattern(dash)) ///
		(kdensity Qurea_T if ntreatment == 3 & year != 0, lwidth(medthick) lcolor(sky) lpattern(shortdash_dot) ///
		ytitle("Density") xtitle("Quantity of urea (kg/ha)") ///
		xline(158.0093, lpattern(solid) lwidth(thin) lcolor(black)) ///
		text(.00005 `=158.0093+5' "Control mean", color(black) j(left) size(vsmall) place(ne) orient(vertical)) ///
		xline(173.9034, lpattern(solid) lwidth(thin) lcolor(gs10)) ///
		text(.00005 `=173.9034+5' "T1 mean", color(gs10) j(left) size(vsmall) place(ne) orient(vertical)) ///
		xline(154.5432, lpattern(solid) lwidth(thin) lcolor(sky)) ///
		text(.00005 `=154.5432-5' "T2 mean", color(sky) j(left) size(vsmall) place(nw) orient(vertical))), ///
		legend(label(1 "Control [C]") label(2 "RiceAdvice [T1]") label(3 "RiceAdivce + Subsidy [T2]") ///
		position(6) col(3) row(1)) saving(Qurea_T, replace)
		
		graph export "Qurea_T.png", as(png) replace
	
gr combine Yieldn.gph RBE.gph Qnpk_T.gph Qurea_T.gph, col(2) iscale(.5) commonscheme

graph export "outcomes.eps", as(eps) replace


/********************************************************************************
*		Table 1: Baseline characteristics and balance pre-contamination			*
********************************************************************************/

*Summary stats for control group at baseline
by ntreatment, sort: sum $hhvar $prodvar if year == 0

foreach dvar of varlist $hhvar $prodvar {
	reg `dvar' ntreated $lga if year == 0, vce(cl village)
	} // Compare T with C

foreach dvar of varlist $hhvar $prodvar {
	reg `dvar' ntreated1 $lga if year == 0, vce(cl village)
	} // Compare T1 with C

foreach dvar of varlist $hhvar $prodvar {
	reg `dvar' ntreated2 $lga if year == 0, vce(cl village)
	} // Compare T2 with C


/********************************************************************************
*			Table 2a: Treatment effects on rice yield for all years				*
********************************************************************************/

****OLS and OLS with covariates
	reg Yieldn T1 T2 $lga if year!=0 [pw=1/pweight], cluster(village)  // OLS
		outreg2 using "Yieldn_a.doc", ///
		title (Table 2a: Treatment effects on yield) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Yieldn T1 T2 $covar $lga if year!=0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "Yieldn_a.doc", ///
		title (Table 2a: Treatment effects on yield) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Yieldn T1 T2 Yieldn0n i.year $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "Yieldn_a.doc", ///
		title (Table 2a: Treatment effects on yield) ctitle (ANCOVA) ///
		drop(_lga* Yieldn0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Yieldn T1 T2 Yieldn0n i.year $covar $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "Yieldn_a.doc", ///
		title (Table 2a: Treatment effects on yield) ctitle (ANCOVA) ///
		drop(_lga* Yieldn0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Yieldn if ntreatment == 1 & year != 0

****Randomization inference
	ritest ntreatment _b[2.ntreatment], cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots fix(3) kdens saving(ri_Yield_1, replace): ///
		reg Yieldn i.ntreatment Yieldn0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.0040
		
	ritest ntreatment _b[3.ntreatment], cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots fix(2) kdens saving(ri_Yield_2, replace): ///
		reg Yieldn i.ntreatment Yieldn0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.0012

	ritest ntreatment (_b[2.ntreatment] - _b[3.ntreatment]), cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots kdens saving(ri_Yield_12, replace): ///
		reg Yieldn i.ntreatment Yieldn0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.0684
		

		
/********************************************************************************
*				Table 2b: Treatment effects on rice yield for 2016				*
********************************************************************************/

****OLS and OLS with covariates
	reg Yieldn T1 T2 $lga if year== 1 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "Yieldn_b.doc", ///
		title (Table 2b: Treatment effects on yield) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Yieldn T1 T2 $covar $lga if year== 1 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "Yieldn_b.doc", ///
		title (Table 2b: Treatment effects on yield) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Yieldn T1 T2 Yieldn0n $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "Yieldn_b.doc", ///
		title (Table 2b: Treatment effects on yield) ctitle (ANCOVA) ///
		drop(_lga* Yieldn0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Yieldn T1 T2 Yieldn0n $covar $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "Yieldn_b.doc", ///
		title (Table 2b: Treatment effects on yield) ctitle (ANCOVA) ///
		drop(_lga* Yieldn0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Yieldn if ntreatment == 1 & year == 1
	

/********************************************************************************
*				Table 2c: Treatment effects on rice yield for 2017				*
********************************************************************************/

****OLS and OLS with covariates
	reg Yieldn T1 T2 $lga if year== 2 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "Yieldn_c.doc", ///
		title (Table 2c: Treatment effects on yield) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Yieldn T1 T2 $covar $lga if year== 2 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "Yieldn_c.doc", ///
		title (Table 2c: Treatment effects on yield) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Yieldn T1 T2 Yieldn0n $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "Yieldn_c.doc", ///
		title (Table 2c: Treatment effects on yield) ctitle (ANCOVA) ///
		drop(_lga* Yieldn0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Yieldn T1 T2 Yieldn0n $covar $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "Yieldn_c.doc", ///
		title (Table 2c: Treatment effects on yield) ctitle (ANCOVA) ///
		drop(_lga* Yieldn0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Yieldn if ntreatment == 1 & year == 2


/********************************************************************************
*		Table 3a: Treatment effects on rice profit for all years				*
********************************************************************************/

****OLS and OLS with covariates
	reg RBE T1 T2 $lga if year!=0 [pw=1/pweight], cluster(village)  // OLS
		outreg2 using "profit_a.doc", ///
		title (Table 3a: Treatment effects on profit) ctitle (OLS) ///
		drop(_lga*) se dec(2) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg RBE T1 T2 $covar $lga if year!=0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "profit_a.doc", ///
		title (Table 3a: Treatment effects on profit) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(2) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg RBE T1 T2 RBE0n i.year $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "profit_a.doc", ///
		title (Table 3a: Treatment effects on profit) ctitle (ANCOVA) ///
		drop(_lga* RBE0n 2.year) se dec(2) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg RBE T1 T2 RBE0n i.year $covar $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "profit_a.doc", ///
		title (Table 3a: Treatment effects on profit) ctitle (ANCOVA) ///
		drop(_lga* RBE0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(2) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum RBE if ntreatment == 1 & year != 0

****Randomization inference
	ritest ntreatment _b[2.ntreatment], cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots fix(3) kdens saving(ri_RBE_1, replace): ///
		reg RBE i.ntreatment RBE0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.0044

	ritest ntreatment _b[3.ntreatment], cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots fix(2) kdens saving(ri_RBE_2, replace): ///
		reg RBE i.ntreatment RBE0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.0012

	ritest ntreatment (_b[2.ntreatment] - _b[3.ntreatment]), cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots kdens saving(ri_RBE_12, replace): ///
		reg RBE i.ntreatment RBE0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.1232
		

/********************************************************************************
*			Table 3b: Treatment effects on rice profit for 2016					*
********************************************************************************/

****OLS and OLS with covariates
	reg RBE T1 T2 $lga if year == 1 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "profit_b.doc", ///
		title (Table 3b: Treatment effects on profit) ctitle (OLS) ///
		drop(_lga*) se dec(2) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg RBE T1 T2 $covar $lga if year == 1 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "profit_b.doc", ///
		title (Table 3b: Treatment effects on profit) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(2) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg RBE T1 T2 RBE0n $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "profit_b.doc", ///
		title (Table 3b: Treatment effects on profit) ctitle (ANCOVA) ///
		drop(_lga* RBE0n) se dec(2) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg RBE T1 T2 RBE0n $covar $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "profit_b.doc", ///
		title (Table 3b: Treatment effects on profit) ctitle (ANCOVA) ///
		drop(_lga* RBE0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(2) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum RBE if ntreatment == 1 & year == 1


/********************************************************************************
*			Table 3c: Treatment effects on rice profit for 2017					*
********************************************************************************/

****OLS and OLS with covariates
	reg RBE T1 T2 $lga if year == 2 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "profit_c.doc", ///
		title (Table 3c: Treatment effects on profit) ctitle (OLS) ///
		drop(_lga*) se dec(2) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg RBE T1 T2 $covar $lga if year == 2 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "profit_c.doc", ///
		title (Table 3c: Treatment effects on profit) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(2) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg RBE T1 T2 RBE0n $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "profit_c.doc", ///
		title (Table 3c: Treatment effects on profit) ctitle (ANCOVA) ///
		drop(_lga* RBE0n) se dec(2) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg RBE T1 T2 RBE0n $covar $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "profit_c.doc", ///
		title (Table 3c: Treatment effects on profit) ctitle (ANCOVA) ///
		drop(_lga* RBE0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(2) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum RBE if ntreatment == 1 & year == 2
	


/********************************************************************************
*	Table 4a: Treatment effects on quantity of fertilizer for all years			*
********************************************************************************/

****OLS and OLS with covariates
	reg Qfert T1 T2 $lga if year != 0 [pw=1/pweight], cluster(village)  // OLS
		outreg2 using "fert_a.doc", ///
		title (Table 4a: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qfert T1 T2 $covar $lga if year!=0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "fert_a.doc", ///
		title (Table 4a: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qfert T1 T2 Qfert0n i.year $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "fert_a.doc", ///
		title (Table 4a: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qfert T1 T2 Qfert0n i.year $covar $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "fert_a.doc", ///
		title (Table 4a: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qfert if ntreatment == 1 & year != 0

****Randomization inference
	ritest ntreatment _b[2.ntreatment], cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots fix(3) kdens saving(ri_Qfert_1, replace): ///
		reg Qfert i.ntreatment Qfert0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.4236

	ritest ntreatment _b[3.ntreatment], cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots fix(2) kdens saving(ri_Qfert_2, replace): ///
		reg Qfert i.ntreatment Qfert0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.0448

	ritest ntreatment (_b[2.ntreatment] - _b[3.ntreatment]), cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots kdens saving(ri_Qfert_12, replace): ///
		reg Qfert i.ntreatment Qfert0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.2080
	

/********************************************************************************
*		Table 4b: Treatment effects on quantity of fertilizer for 2016			*
********************************************************************************/

****OLS and OLS with covariates
	reg Qfert T1 T2 $lga if year == 1 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "fert_b.doc", ///
		title (Table 4b: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qfert T1 T2 $covar $lga if year == 1 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "fert_b.doc", ///
		title (Table 4b: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qfert T1 T2 Qfert0n $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "fert_b.doc", ///
		title (Table 4b: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qfert T1 T2 Qfert0n $covar $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "fert_b.doc", ///
		title (Table 4b: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qfert if ntreatment == 1 & year == 1


/********************************************************************************
*		Table 4c: Treatment effects on quantity of fertilizer for 2017			*
********************************************************************************/

****OLS and OLS with covariates
	reg Qfert T1 T2 $lga if year == 2 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "fert_c.doc", ///
		title (Table 4c: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga*) se dec(2) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qfert T1 T2 $covar $lga if year == 2 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "fert_c.doc", ///
		title (Table 4c: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(2) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qfert T1 T2 Qfert0n $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "fert_c.doc", ///
		title (Table 4c: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert0n) se dec(2) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qfert T1 T2 Qfert0n $covar $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "fert_c.doc", ///
		title (Table 4c: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(2) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qfert if ntreatment == 1 & year == 2
	

/********************************************************************************
*	Table 5a: Treatment effects on quantity of NPK fertilizer for all years		*
********************************************************************************/

****OLS and OLS with covariates
	reg Qnpk_T T1 T2 $lga if year != 0 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "npk_a.doc", ///
		title (Table 5a: Treatment effects on NPK) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qnpk_T T1 T2 $covar $lga if year != 0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "npk_a.doc", ///
		title (Table 5a: Treatment effects on NPK) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qnpk_T T1 T2 Qnpk_T0n i.year $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "npk_a.doc", ///
		title (Table 5a: Treatment effects on NPK) ctitle (ANCOVA) ///
		drop(_lga* Qnpk_T0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qnpk_T T1 T2 Qnpk_T0n i.year $covar $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "npk_a.doc", ///
		title (Table 5a: Treatment effects on NPK) ctitle (ANCOVA) ///
		drop(_lga* Qnpk_T0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qnpk_T if ntreatment == 1 & year != 0

****Randomization inference
	ritest ntreatment _b[2.ntreatment], cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots fix(3) kdens saving(ri_Qnpk_1, replace): ///
		reg Qnpk_T i.ntreatment Qnpk_T0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.0152

	ritest ntreatment _b[3.ntreatment], cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots fix(2) kdens saving(ri_Qnpk_2, replace): ///
		reg Qnpk_T i.ntreatment Qnpk_T0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.0478

	ritest ntreatment (_b[2.ntreatment] - _b[3.ntreatment]), cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots kdens saving(ri_Qnpk_12, replace): ///
		reg Qnpk_T i.ntreatment Qnpk_T0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.7250
	
	
/********************************************************************************
*		Table 5b: Treatment effects on quantity of NPK fertilizer for 2016		*
********************************************************************************/

****OLS and OLS with covariates
	reg Qnpk_T T1 T2 $lga if year == 1 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "npk_b.doc", ///
		title (Table 5b: Treatment effects on NPK) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qnpk_T T1 T2 $covar $lga if year == 1 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "npk_b.doc", ///
		title (Table 5b: Treatment effects on NPK) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qnpk_T T1 T2 Qnpk_T0n $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "npk_b.doc", ///
		title (Table 5b: Treatment effects on NPK) ctitle (ANCOVA) ///
		drop(_lga* Qnpk_T0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qnpk_T T1 T2 Qnpk_T0n $covar $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "npk_b.doc", ///
		title (Table 5b: Treatment effects on NPK) ctitle (ANCOVA) ///
		drop(_lga* Qnpk_T0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qnpk_T if ntreatment == 1 & year == 1


/********************************************************************************
*		Table 5c: Treatment effects on quantity of NPK fertilizer for 2017		*
********************************************************************************/

****OLS and OLS with covariates
	reg Qnpk_T T1 T2 $lga if year == 2 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "npk_c.doc", ///
		title (Table 5c: Treatment effects on NPK) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qnpk_T T1 T2 $covar $lga if year == 2 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "npk_c.doc", ///
		title (Table 5c: Treatment effects on NPK) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qnpk_T T1 T2 Qnpk_T0n $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "npk_c.doc", ///
		title (Table 5c: Treatment effects on NPK) ctitle (ANCOVA) ///
		drop(_lga* Qnpk_T0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qnpk_T T1 T2 Qnpk_T0n $covar $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "npk_c.doc", ///
		title (Table 5c: Treatment effects on NPK) ctitle (ANCOVA) ///
		drop(_lga* Qnpk_T0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qnpk_T if ntreatment == 1 & year == 2
	

/********************************************************************************
*	Table 6a: Treatment effects on quantity of urea fertilizer for all years	*
********************************************************************************/

****OLS and OLS with covariates
	reg Qurea_T T1 T2 $lga if year != 0 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "urea_a.doc", ///
		title (Table 6a: Treatment effects on urea) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qurea_T T1 T2 $covar $lga if year != 0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "urea_a.doc", ///
		title (Table 6a: Treatment effects on urea) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qurea_T T1 T2 Qurea_T0n i.year $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "urea_a.doc", ///
		title (Table 6a: Treatment effects on urea) ctitle (ANCOVA) ///
		drop(_lga* Qurea_T0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qurea_T T1 T2 Qurea_T0n i.year $covar $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "urea_a.doc", ///
		title (Table 6a: Treatment effects on urea) ctitle (ANCOVA) ///
		drop(_lga* Qurea_T0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qurea_T if ntreatment == 1 & year != 0

****Randomization inference
	ritest ntreatment _b[2.ntreatment], cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots fix(3) kdens saving(ri_Qurea_1, replace): ///
		reg Qurea_T i.ntreatment Qurea_T0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.0094

	ritest ntreatment _b[3.ntreatment], cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots fix(2) kdens saving(ri_Qurea_2, replace): ///
		reg Qurea_T i.ntreatment Qurea_T0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.9718 

	ritest ntreatment (_b[2.ntreatment] - _b[3.ntreatment]), cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots kdens saving(ri_Qurea_12, replace): ///
		reg Qurea_T i.ntreatment Qurea_T0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.0646
	
	
/********************************************************************************
*		Table 6b: Treatment effects on quantity of urea fertilizer for 2016		*
********************************************************************************/

****OLS and OLS with covariates
	reg Qurea_T T1 T2 $lga if year == 1 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "urea_b.doc", ///
		title (Table 6b: Treatment effects on urea) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qurea_T T1 T2 $covar $lga if year == 1 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "urea_b.doc", ///
		title (Table 6b: Treatment effects on urea) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qurea_T T1 T2 Qurea_T0n $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "urea_b.doc", ///
		title (Table 6b: Treatment effects on urea) ctitle (ANCOVA) ///
		drop(_lga* Qurea_T0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qurea_T T1 T2 Qurea_T0n $covar $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "urea_b.doc", ///
		title (Table 6b: Treatment effects on urea) ctitle (ANCOVA) ///
		drop(_lga* Qurea_T0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qurea_T if ntreatment == 1 & year == 1


/********************************************************************************
*		Table 6c: Treatment effects on quantity of urea fertilizer for 2017		*
********************************************************************************/

****OLS and OLS with covariates
	reg Qurea_T T1 T2 $lga if year == 2 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "urea_c.doc", ///
		title (Table 6c: Treatment effects on urea) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qurea_T T1 T2 $covar $lga if year == 2 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "urea_c.doc", ///
		title (Table 6c: Treatment effects on urea) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qurea_T T1 T2 Qurea_T0n $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "urea_c.doc", ///
		title (Table 6c: Treatment effects on urea) ctitle (ANCOVA) ///
		drop(_lga* Qurea_T0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qurea_T T1 T2 Qurea_T0n $covar $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "urea_c.doc", ///
		title (Table 6c: Treatment effects on urea) ctitle (ANCOVA) ///
		drop(_lga* Qurea_T0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qurea_T if ntreatment == 1 & year == 2


/********************************************************************************
* Table 7a: Treatment effects on timing of first NPK application for all years	*
********************************************************************************/

****OLS and OLS with covariates
	reg period1_npk T1 T2 $lga if year != 0 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "NPKt_a.doc", ///
		title (Table 7a: Treatment effects on NPK timing) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_npk T1 T2 $covar $lga if year != 0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "NPKt_a.doc", ///
		title (Table 7a: Treatment effects on NPK timing) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg period1_npk T1 T2 period1_npk0n i.year $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "NPKt_a.doc", ///
		title (Table 7a: Treatment effects on NPK timing) ctitle (ANCOVA) ///
		drop(_lga* period1_npk0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_npk T1 T2 period1_npk0n i.year $covar $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "NPKt_a.doc", ///
		title (Table 7a: Treatment effects on NPK timing) ctitle (ANCOVA) ///
		drop(_lga* period1_npk0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum period1_npk if ntreatment == 1 & year != 0
	
****Randomization inference
	ritest ntreatment _b[2.ntreatment], cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots fix(3) kdens saving(ri_period1_npk_1, replace): ///
		reg period1_npk i.ntreatment period1_npk0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.0006

	ritest ntreatment _b[3.ntreatment], cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots fix(2) kdens saving(ri_period1_npk_2, replace): ///
		reg period1_npk i.ntreatment period1_npk0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.0762

	ritest ntreatment (_b[2.ntreatment] - _b[3.ntreatment]), cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots kdens saving(ri_period1_npk_12, replace): ///
		reg period1_npk i.ntreatment period1_npk0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.6076
	
	
/********************************************************************************
*	Table 7b: Treatment effects on timing of first NPK application for 2016		*
********************************************************************************/

****OLS and OLS with covariates
	reg period1_npk T1 T2 $lga if year == 1 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "NPKt_b.doc", ///
		title (Table 7b: Treatment effects on NPK timing) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_npk T1 T2 $covar $lga if year == 1 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "NPKt_b.doc", ///
		title (Table 7b: Treatment effects on NPK timing) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg period1_npk T1 T2 period1_npk0n $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "NPKt_b.doc", ///
		title (Table 7b: Treatment effects on NPK timing) ctitle (ANCOVA) ///
		drop(_lga* period1_npk0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_npk T1 T2 period1_npk0n $covar $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "NPKt_b.doc", ///
		title (Table 7b: Treatment effects on NPK timing) ctitle (ANCOVA) ///
		drop(_lga* period1_npk0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum period1_npk if ntreatment == 1 & year == 1


/********************************************************************************
*	Table 7c: Treatment effects on timing of first NPK application for 2017		*
********************************************************************************/

****OLS and OLS with covariates
	reg period1_npk T1 T2 $lga if year == 2 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "NPKt_c.doc", ///
		title (Table 7c: Treatment effects on NPK timing) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_npk T1 T2 $covar $lga if year == 2 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "NPKt_c.doc", ///
		title (Table 7c: Treatment effects on NPK timing) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg period1_npk T1 T2 period1_npk0n $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "NPKt_c.doc", ///
		title (Table 7c: Treatment effects on NPK timing) ctitle (ANCOVA) ///
		drop(_lga* period1_npk0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_npk T1 T2 period1_npk0n $covar $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "NPKt_c.doc", ///
		title (Table 7c: Treatment effects on NPK timing) ctitle (ANCOVA) ///
		drop(_lga* period1_npk0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum period1_npk if ntreatment == 1 & year == 2


/********************************************************************************
* Table 8a: Treatment effects on timing of first urea application for all years	*
********************************************************************************/

****OLS and OLS with covariates
	reg period1_urea T1 T2 $lga if year != 0 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "ureat_a.doc", ///
		title (Table 8a: Treatment effects on urea timing) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_urea T1 T2 $covar $lga if year != 0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "ureat_a.doc", ///
		title (Table 8a: Treatment effects on urea timing) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg period1_urea T1 T2 period1_urea0n i.year $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "ureat_a.doc", ///
		title (Table 8a: Treatment effects on urea timing) ctitle (ANCOVA) ///
		drop(_lga* period1_urea0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_urea T1 T2 period1_urea0n i.year $covar $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "ureat_a.doc", ///
		title (Table 8a: Treatment effects on urea timing) ctitle (ANCOVA) ///
		drop(_lga* period1_urea0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum period1_urea if ntreatment == 1 & year != 0
	
****Randomization inference
	ritest ntreatment _b[2.ntreatment], cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots fix(3) kdens saving(ri_period1_urea_1, replace): ///
		reg period1_urea i.ntreatment period1_urea0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.4576

	ritest ntreatment _b[3.ntreatment], cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots fix(2) kdens saving(ri_period1_urea_2, replace): ///
		reg period1_urea i.ntreatment period1_urea0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.3950

	ritest ntreatment (_b[2.ntreatment] - _b[3.ntreatment]), cluster(village) strata(lga) ///
		reps(5000) seed(0) nodots kdens saving(ri_period1_urea_12, replace): ///
		reg period1_urea i.ntreatment period1_urea0n i.year $covar $lga if year!=0, cluster (village)
		* p-value = 0.7340
		
		
/********************************************************************************
*	Table 8b: Treatment effects on timing of first urea application for 2016	*
********************************************************************************/

****OLS and OLS with covariates
	reg period1_urea T1 T2 $lga if year == 1 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "ureat_b.doc", ///
		title (Table 8b: Treatment effects on urea timing) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_urea T1 T2 $covar $lga if year == 1 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "ureat_b.doc", ///
		title (Table 8b: Treatment effects on urea timing) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg period1_urea T1 T2 period1_urea0n $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "ureat_b.doc", ///
		title (Table 8b: Treatment effects on urea timing) ctitle (ANCOVA) ///
		drop(_lga* period1_urea0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_urea T1 T2 period1_urea0n $covar $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "ureat_b.doc", ///
		title (Table 8b: Treatment effects on urea timing) ctitle (ANCOVA) ///
		drop(_lga* period1_urea0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum period1_urea if ntreatment == 1 & year == 1


/********************************************************************************
*	Table 8c: Treatment effects on timing of first urea application for 2017	*
********************************************************************************/

****OLS and OLS with covariates
	reg period1_urea T1 T2 $lga if year == 2 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "ureat_c.doc", ///
		title (Table 8c: Treatment effects on urea timing) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_urea T1 T2 $covar $lga if year == 2 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "ureat_c.doc", ///
		title (Table 8c: Treatment effects on urea timing) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg period1_urea T1 T2 period1_urea0n $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "ureat_c.doc", ///
		title (Table 8c: Treatment effects on urea timing) ctitle (ANCOVA) ///
		drop(_lga* period1_urea0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_urea T1 T2 period1_urea0n $covar $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "ureat_c.doc", ///
		title (Table 8c: Treatment effects on urea timing) ctitle (ANCOVA) ///
		drop(_lga* period1_urea0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum period1_urea if ntreatment == 1 & year == 2


/********************************************************************************
*			Table A.1: Fertility recommendations for rice in Nigeria			*
********************************************************************************/

*Table does not rely on data from the RCT


/********************************************************************************
*			Table A.2: Non-rice producing households in each year				*
********************************************************************************/

ta ntreatment year if Yieldn==.


/********************************************************************************
*		Table A.3: Baseline characteristics and balance post-contamination		*
********************************************************************************/

*Summary stats for control group at baseline
by ittva, sort: eststo: quietly estpost sum $hhvar $prodvar if year == 0

esttab using sum_stat_post.csv, replace cell(mean(fmt(3)) sd(par fmt(3))) p(3) label nodepvar

foreach dvar of varlist $hhvar $prodvar {
	reg `dvar' treated $lga if year == 0, vce(cl village)
	} // Compare T with C

foreach dvar of varlist $hhvar $prodvar {
	reg `dvar' treated1 $lga if year == 0, vce(cl village)
	} // Compare T1 with C

foreach dvar of varlist $hhvar $prodvar {
	reg `dvar' treated2 $lga if year == 0, vce(cl village)
	} // Compare T2 with C


/********************************************************************************
* Table A.4: Intra-cluster correlation coefficients for the outcomes variables	*
********************************************************************************/

foreach icc_chk of varlist Yieldn RBE Qfert Qnpk_T Qurea_T period1_npk period1_urea {

loneway `icc_chk' village if year==0
}


/********************************************************************************
* Table A.5: Quartile treatment effects on the quantity of fertilizer (kg/ha)	*
********************************************************************************/

rename Qnpk_T Qnpk
rename Qurea_T Qurea
rename period1_npk Pnpk
rename period1_urea Purea
rename Yieldn0n Yieldn_bl
rename RBE0n RBE_bl
rename Qfert0n Qfert_bl
rename Qnpk_T0n Qnpk_bl
rename Qurea_T0n Qurea_bl
rename period1_npk0n Pnpk_bl
rename period1_urea0n Purea_bl

	*Quartile .25
	
****OLS and OLS with covariates
	sqreg Qfert T1 T2 $lga if year!=0, q(.25) reps(100) nodots // OLS
		outreg2 using "fert_q25.doc", ///
		title (Table A8a: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
		
	sqreg Qfert T1 T2 $covar $lga if year!=0, q(.25) reps(100) nodots // OLS with covariates
		outreg2 using "fert_q25.doc", ///
		title (Table A8a: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)

****ANCOVA and ANCOVA with covariates
	sqreg Qfert T1 T2 Qfert_bl i.year $lga if year!=0, q(.25) reps(100) nodots // ANCOVA
		outreg2 using "fert_q25.doc", ///
		title (Table A8a: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert_bl 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
		
	sqreg Qfert T1 T2 Qfert_bl i.year $covar $lga if year!=0, q(.25) reps(100) nodots // ANCOVA with covariates
		outreg2 using "fert_q25.doc", ///
		title (Table A8a: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert_bln age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)

	*Quartile .5
	
****OLS and OLS with covariates
	sqreg Qfert T1 T2 $lga if year!=0, q(.5) reps(100) nodots // OLS
		outreg2 using "fert_q5.doc", ///
		title (Table A8b: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
		
	sqreg Qfert T1 T2 $covar $lga if year!=0, q(.5) reps(100) nodots // OLS with covariates
		outreg2 using "fert_q5.doc", ///
		title (Table A8b: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)

****ANCOVA and ANCOVA with covariates
	sqreg Qfert T1 T2 Qfert_bl i.year $lga if year!=0, q(.5) reps(100) nodots // ANCOVA
		outreg2 using "fert_q5.doc", ///
		title (Table A8ba: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert_bl 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
		
	sqreg Qfert T1 T2 Qfert_bl i.year $covar $lga if year!=0, q(.5) reps(100) nodots // ANCOVA with covariates
		outreg2 using "fert_q5.doc", ///
		title (Table A8b: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert_bln age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)

	*Quartile .75
	
****OLS and OLS with covariates
	sqreg Qfert T1 T2 $lga if year!=0, q(.75) reps(100) nodots // OLS
		outreg2 using "fert_q75.doc", ///
		title (Table A8c: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
		
	sqreg Qfert T1 T2 $covar $lga if year!=0, q(.75) reps(100) nodots // OLS with covariates
		outreg2 using "fert_q75.doc", ///
		title (Table A8c: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)

****ANCOVA and ANCOVA with covariates
	sqreg Qfert T1 T2 Qfert_bl i.year $lga if year!=0, q(.75) reps(100) nodots // ANCOVA
		outreg2 using "fert_q75.doc", ///
		title (Table A8c: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert_bl 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
		
	sqreg Qfert T1 T2 Qfert_bl i.year $covar $lga if year!=0, q(.75) reps(100) nodots // ANCOVA with covariates
		outreg2 using "fert_q75.doc", ///
		title (Table A8c: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert_bln age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)

	
/********************************************************************************
*		Table A.6 and A.7: Multiple hypothesis testing for treatment effect		*
********************************************************************************/

****OLS and OLS with covariates
rwolf 	Yieldn RBE Qfert Qnpk Qurea Pnpk Purea ///
		if year != 0 [pw=1/pweight], indepvar(T1) method(reg) nodots ///
		controls($lga) vce(cluster village) seed(12345) reps(5000)

rwolf 	Yieldn RBE Qfert Qnpk Qurea Pnpk Purea ///
		if year != 0 [pw=1/pweight], indepvar(T1 T2) method(reg) nodots ///
		controls($covar $lga) vce(cluster village) seed(12345) reps(5000) holm

****ANCOVA and ANCOVA with covariates
rwolf 	Yieldn RBE Qfert Qnpk Qurea Pnpk Purea ///
		if year != 0 [pw=1/pweight], indepvar(T1 T2) method(reg) nodots ///
		bl(_bl) controls(i.year $covar $lga) vce(cluster village) seed(12345) reps(5000) holm

rwolf 	Yieldn RBE Qfert Qnpk Qurea Pnpk Purea ///
		if year != 0 [pw=1/pweight], indepvar(T1 T2) method(reg) nodots ///
		bl(_bl) controls(i.year $covar $lga) vce(cluster village) seed(12345) reps(5000) holm

*Sharpened q-values calculated using code found at https://are.berkeley.edu/~mlanderson/ARE_Website/Research.html


/********************************************************************************
*				Table A.8: Lee bounds on the treatment effect					*
********************************************************************************/
eststo clear

****Bounds on treatment from OLS regression
eststo: quietly reg Yieldn ntreated if year != 0 [pw=1/pweight]
eststo: quietly leebounds Yieldn ntreated if year != 0 [pw=1/pweight]
eststo: quietly reg RBE ntreated if year != 0 [pw=1/pweight]
eststo: quietly leebounds RBE ntreated if year != 0 [pw=1/pweight]
eststo: quietly reg Qfert ntreated if year != 0 [pw=1/pweight]
eststo: quietly leebounds Qfert ntreated if year != 0 [pw=1/pweight]
eststo: quietly reg Qnpk ntreated if year != 0 [pw=1/pweight]
eststo: quietly leebounds Qnpk ntreated if year != 0 [pw=1/pweight]
eststo: quietly reg Qurea ntreated if year != 0 [pw=1/pweight]
eststo: quietly leebounds Qurea ntreated if year != 0 [pw=1/pweight]
eststo: quietly reg Pnpk ntreated if year != 0 [pw=1/pweight]
eststo: quietly leebounds Pnpk ntreated if year != 0 [pw=1/pweight]
eststo: quietly reg Purea ntreated if year != 0 [pw=1/pweight]
eststo: quietly leebounds Purea ntreated if year != 0 [pw=1/pweight]

esttab using Lee.csv, cells(b(star fmt(3)) se(par fmt(3))) ///
	noobs label replace

	
/********************************************************************************
*				Table A.9a: Treatment effects on total harvest					*
********************************************************************************/

*Treatment effects on total harvest
gen harv = Yieldn * ricearea
	lab var harv "rice harvest (kg)"
gen harv0n = Yieldn_bl * ricearea
	lab var harv0n "rice harvest in 2015 (kg)"

****OLS and OLS with covariates
	reg harv T1 T2 $lga if year!=0 [pw=1/pweight], cluster(village)  // OLS
		outreg2 using "harv_a.doc", ///
		title (Table A9a: Treatment effects on harvest) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg harv T1 T2 $covar ricearea $lga if year!=0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "harv_a.doc", ///
		title (Table A9a: Treatment effects on harvest) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form ricearea credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg harv T1 T2 harv0n i.year $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "harv_a.doc", ///
		title (Table A9a: Treatment effects on harvest) ctitle (ANCOVA) ///
		drop(_lga* harv0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg harv T1 T2 harv0n i.year $covar ricearea $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "harv_a.doc", ///
		title (Table A9a: Treatment effects on harvest) ctitle (ANCOVA) ///
		drop(_lga* harv0n age tailmen educ2 agric njour_agri_form ricearea credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum harv if ntreatment == 1 & year != 0


/********************************************************************************
*				Table A.9b: Treatment effects on total profit					*
********************************************************************************/

*Generate total profits.
gen rev = RBE * ricearea
	lab var rev "rice revenue (US$)"
gen rev0n = RBE_bl * ricearea
	lab var rev0n "rice revenue in 2015 (US$)"

****OLS and OLS with covariates
	reg rev T1 T2 $lga if year!=0 [pw=1/pweight], cluster(village)  // OLS
		outreg2 using "rev_a.doc", ///
		title (Table A9b: Treatment effects on profits) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg rev T1 T2 $covar $lga if year!=0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "rev_a.doc", ///
		title (Table A9b: Treatment effects on profits) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg rev T1 T2 rev0n i.year $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "rev_a.doc", ///
		title (Table A9b: Treatment effects on profits) ctitle (ANCOVA) ///
		drop(_lga* rev0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg rev T1 T2 rev0n i.year $covar $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "rev_a.doc", ///
		title (Table A9b: Treatment effects on profitsd) ctitle (ANCOVA) ///
		drop(_lga* rev0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum rev if ntreatment == 1 & year != 0

	
/********************************************************************************
*				Table A.9c: Treatment effects on rice area						*
********************************************************************************/

****OLS and OLS with covariates
	reg ricearea T1 T2 $lga if year!=0 [pw=1/pweight], cluster(village)  // OLS
		outreg2 using "area_a.doc", ///
		title (Table A9c: Treatment effects on area) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg ricearea T1 T2 $covar $lga if year!=0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "area_a.doc", ///
		title (Table A9c: Treatment effects on area) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg ricearea T1 T2 area0n i.year $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "area_a.doc", ///
		title (Table A9c: Treatment effects on area) ctitle (ANCOVA) ///
		drop(_lga* area0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg ricearea T1 T2 area0n i.year $covar $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "area_a.doc", ///
		title (Table A9c: Treatment effects on area) ctitle (ANCOVA) ///
		drop(_lga* area0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum ricearea if ntreatment == 1 & year != 0

/********************************************************************************
* 						Figure A.1: Map of study area							*
********************************************************************************/

*Map requires no data

	
/********************************************************************************
* Figure A.2 and A.3: Randomization Inference on treatment effect of contract	*
********************************************************************************/

*Build RI data set
use ri_Yield_1.dta, clear
	rename _pm_1 yield_T1
append using ri_Yield_2.dta
	rename _pm_1 yield_T2
append using ri_RBE_1.dta
	rename _pm_1 RBE_T1
append using ri_RBE_2.dta
	rename _pm_1 RBE_T2
append using ri_Qfert_1.dta
	rename _pm_1 qfert_T1
append using ri_Qfert_2.dta
	rename _pm_1 qfert_T2
append using ri_Qnpk_1.dta
	rename _pm_1 qnpk_T1
append using ri_Qnpk_2.dta
	rename _pm_1 qnpk_T2
append using ri_Qurea_1.dta
	rename _pm_1 qurea_T1
append using ri_Qurea_2.dta
	rename _pm_1 qurea_T2
append using ri_period1_npk_1.dta
	rename _pm_1 tnpk_T1
append using ri_period1_npk_2.dta
	rename _pm_1 tnpk_T2
append using ri_period1_urea_1.dta
	rename _pm_1 turea_T1
append using ri_period1_urea_2.dta
	rename _pm_1 turea_T2	

twoway 	(kdensity yield_T1, lwidth(medthick) lcolor(gs10) lpattern(dash)) ///
		(kdensity yield_T2, lwidth(medthick) lcolor(sky) lpattern(shortdash_dot) ///
		ytitle("Density") xtitle("Hypothetical treatment effect estimate") title("Treatment effect on rice yield (t/ha)") ///
		xline(0.258, lpattern(solid) lwidth(thin) lcolor(gs10)) ///
		text(.18 `=0.258-.01' "T1 TE", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		text(2.2 `=0.258-.01' "p-value = 0.004", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		xline(0.728, lpattern(solid) lwidth(thin) lcolor(sky)) ///
		text(.18 `=0.728-.01' "T2 TE", color(sky) j(left) size(vsmall) place(nw) orient(vertical)) ///
		text(2.2 `=0.728-.01' "p-value = 0.045", color(sky) j(left) size(vsmall) place(nw) orient(vertical))), ///
		legend(label(1 "RiceAdvice [T1]") label(2 "RiceAdvice + Subsidy [T2]") ///
		position(6) col(2) row(1) order(1 2)) saving(ri_yield, replace)

twoway 	(kdensity RBE_T1, lwidth(medthick) lcolor(gs10) lpattern(dash)) ///
		(kdensity RBE_T2, lwidth(medthick) lcolor(sky) lpattern(shortdash_dot) ///
		ytitle("Density") xtitle("Hypothetical treatment effect estimate") title("Treatment effect on profit (US$/ha)") ///
		xline(126.1, lpattern(solid) lwidth(thin) lcolor(gs10)) ///
		text(.0001 `=126.1-.01' "T1 TE", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		text(.0045 `=126.1-.01' "p-value = 0.004", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		xline(279.9, lpattern(solid) lwidth(thin) lcolor(sky)) ///
		text(.0003 `=279.9-.01' "T2 TE", color(sky) j(left) size(vsmall) place(nw) orient(vertical)) ///
		text(.0045 `=279.9-.01' "p-value = 0.001", color(sky) j(left) size(vsmall) place(nw) orient(vertical))), ///
		legend(label(1 "RiceAdvice [T1]") label(2 "RiceAdvice + Subsidy [T2]") ///
		position(6) col(2) row(1) order(1 2)) saving(ri_profit, replace)
		
twoway 	(kdensity qnpk_T1, lwidth(medthick) lcolor(gs10) lpattern(dash)) ///
		(kdensity qnpk_T2, lwidth(medthick) lcolor(sky) lpattern(shortdash_dot) ///
		ytitle("Density") xtitle("Hypothetical treatment effect estimate") title("Treatment effect on quantity of NPK (kg/ha)") ///
		xline(-16.03, lpattern(solid) lwidth(thin) lcolor(gs10)) ///
		text(.0035 `=-16.03-.01' "T1 TE", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		text(.045 `=-16.03-.01' "p-value = 0.015", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		xline(-21.98, lpattern(solid) lwidth(thin) lcolor(sky)) ///
		text(.0035 `=-21.98-.01' "T2 TE", color(sky) j(left) size(vsmall) place(nw) orient(vertical)) ///
		text(.045 `=-21.98-.01' "p-value = 0.048", color(sky) j(left) size(vsmall) place(nw) orient(vertical))), ///
		legend(label(1 "RiceAdvice [T1]") label(2 "RiceAdvice + Subsidy [T2]") ///
		position(6) col(2) row(1) order(1 2)) saving(ri_qnpk, replace)
		
twoway 	(kdensity qurea_T1, lwidth(medthick) lcolor(gs10) lpattern(dash)) ///
		(kdensity qurea_T2, lwidth(medthick) lcolor(sky) lpattern(shortdash_dot) ///
		ytitle("Density") xtitle("Hypothetical treatment effect estimate") title("Treatment effect on quantity of urea (kg/ha)") ///
		xline(12.10, lpattern(solid) lwidth(thin) lcolor(gs10)) ///
		text(.0018 `=12.10-.01' "T1 TE", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		text(.05 `=12.10-.01' "p-value = 0.009", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		xline(-4.912, lpattern(solid) lwidth(thin) lcolor(sky)) ///
		text(.0018 `=-4.912-.01' "T2 TE", color(sky) j(left) size(vsmall) place(nw) orient(vertical)) ///
		text(.05 `=-4.912-.01' "p-value = 0.972", color(sky) j(left) size(vsmall) place(nw) orient(vertical))), ///
		legend(label(1 "RiceAdvice [T1]") label(2 "RiceAdvice + Subsidy [T2]") ///
		position(6) col(2) row(1) order(1 2)) saving(ri_qurea, replace)

gr combine ri_yield.gph ri_profit.gph ri_qnpk.gph ri_qurea.gph, col(2) iscale(.5) commonscheme

graph export "ri_result1.png", as(png) replace
		
twoway 	(kdensity qfert_T1, lwidth(medthick) lcolor(gs10) lpattern(dash)) ///
		(kdensity qfert_T2, lwidth(medthick) lcolor(sky) lpattern(shortdash_dot) ///
		ytitle("Density") xtitle("Hypothetical treatment effect estimate") title("Treatment effect on quantity of fertilizer (kg/ha)") ///
		xline(-10.92, lpattern(solid) lwidth(thin) lcolor(gs10)) ///
		text(.003 `=-10.92-.01' "T1 TE", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		text(.03 `=-10.92-.01' "p-value = 0.424", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		xline(-32.65, lpattern(solid) lwidth(thin) lcolor(sky)) ///
		text(.003 `=-32.65-.01' "T2 TE", color(sky) j(left) size(vsmall) place(nw) orient(vertical)) ///
		text(.03 `=-32.65-.01' "p-value = 0.045", color(sky) j(left) size(vsmall) place(nw) orient(vertical))), ///
		legend(label(1 "RiceAdvice [T1]") label(2 "RiceAdvice + Subsidy [T2]") ///
		position(6) col(2) row(1) order(1 2)) saving(ri_fert, replace)
		
twoway 	(kdensity tnpk_T1, lwidth(medthick) lcolor(gs10) lpattern(dash)) ///
		(kdensity tnpk_T2, lwidth(medthick) lcolor(sky) lpattern(shortdash_dot) ///
		ytitle("Density") xtitle("Hypothetical treatment effect estimate") title("Treatment effect on timing of first NPK application (days)") ///
		xline(-1.565, lpattern(solid) lwidth(thin) lcolor(gs10)) ///
		text(.18 `=-1.565-.01' "T1 TE", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		text(.45 `=-1.565-.01' "p-value = 0.001", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		xline(-1.235, lpattern(solid) lwidth(thin) lcolor(sky)) ///
		text(.18 `=-1.235-.01' "T2 TE", color(sky) j(left) size(vsmall) place(nw) orient(vertical)) ///
		text(.45 `=-1.235-.01' "p-value = 0.076", color(sky) j(left) size(vsmall) place(nw) orient(vertical))), ///
		legend(label(1 "RiceAdvice [T1]") label(2 "RiceAdvice + Subsidy [T2]") ///
		position(6) col(2) row(1) order(1 2)) saving(ri_tnpk, replace)
		
twoway 	(kdensity turea_T1, lwidth(medthick) lcolor(gs10) lpattern(dash)) ///
		(kdensity turea_T2, lwidth(medthick) lcolor(sky) lpattern(shortdash_dot) ///
		ytitle("Density") xtitle("Hypothetical treatment effect estimate") title("Treatment effect on timing of first urea application (days)") ///
		xline(-0.595, lpattern(solid) lwidth(thin) lcolor(gs10)) ///
		text(.02 `=-0.595-.01' "T1 TE", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		text(.33 `=-0.595-.01' "p-value = 0.458", color(gs10) j(left) size(vsmall) place(nw) orient(vertical)) ///
		xline(-0.434, lpattern(solid) lwidth(thin) lcolor(sky)) ///
		text(.02 `=-0.434-.01' "T2 TE", color(sky) j(left) size(vsmall) place(nw) orient(vertical)) ///
		text(.33 `=-0.434-.01' "p-value = 0.395", color(sky) j(left) size(vsmall) place(nw) orient(vertical))), ///
		legend(label(1 "RiceAdvice [T1]") label(2 "RiceAdvice + Subsidy [T2]") ///
		position(6) col(2) row(1) order(1 2)) saving(ri_turea, replace)

gr combine ri_fert.gph ri_tnpk.gph ri_turea.gph, col(2) iscale(.5) commonscheme

graph export "ri_result2.png", as(png) replace

save ri_TC.dta, replace


/********************************************************************************
*									Log Conversions								*
********************************************************************************/

replace Yieldn = asinh(Yieldn)
replace Yieldn0n = asinh(Yieldn0n)
replace RBE = asinh(RBE)
replace RBE0n = asinh(RBE0n)
replace Qfert = asinh(Qfert)
replace Qfert0n = asinh(Qfert0n)
gen lnQnpk_T = asinh(Qnpk_T)
gen lnQnpk_T0n = asinh(Qnpk_T0n)
replace Qurea_T = asinh(Qurea_T)
replace Qurea_T0n = asinh(Qurea_T0n)
replace period1_npk = asinh(period1_npk)
replace period1_npk0n = asinh(period1_npk0n) 
replace period1_urea = asinh(period1_urea)
replace period1_urea0n = asinh(period1_urea0n) 


/********************************************************************************
*			Table A.10a: Treatment effects on rice yield for all years			*
********************************************************************************/

****OLS and OLS with covariates
	reg Yieldn T1 T2 $lga if year!=0 [pw=1/pweight], cluster(village)  // OLS
		outreg2 using "Yieldn_a.doc", ///
		title (Table 2a: Treatment effects on yield) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Yieldn T1 T2 $covar $lga if year!=0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "Yieldn_a.doc", ///
		title (Table 2a: Treatment effects on yield) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Yieldn T1 T2 Yieldn0n i.year $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "Yieldn_a.doc", ///
		title (Table 2a: Treatment effects on yield) ctitle (ANCOVA) ///
		drop(_lga* Yieldn0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Yieldn T1 T2 Yieldn0n i.year $covar $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "Yieldn_a.doc", ///
		title (Table 2a: Treatment effects on yield) ctitle (ANCOVA) ///
		drop(_lga* Yieldn0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Yieldn if ntreatment == 1 & year != 0

		
/********************************************************************************
*				Table A.10b: Treatment effects on rice yield for 2016			*
********************************************************************************/

****OLS and OLS with covariates
	reg Yieldn T1 T2 $lga if year== 1 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "Yieldn_b.doc", ///
		title (Table 2b: Treatment effects on yield) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Yieldn T1 T2 $covar $lga if year== 1 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "Yieldn_b.doc", ///
		title (Table 2b: Treatment effects on yield) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Yieldn T1 T2 Yieldn0n $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "Yieldn_b.doc", ///
		title (Table 2b: Treatment effects on yield) ctitle (ANCOVA) ///
		drop(_lga* Yieldn0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Yieldn T1 T2 Yieldn0n $covar $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "Yieldn_b.doc", ///
		title (Table 2b: Treatment effects on yield) ctitle (ANCOVA) ///
		drop(_lga* Yieldn0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Yieldn if ntreatment == 1 & year == 1
	

/********************************************************************************
*				Table A.10c: Treatment effects on rice yield for 2017			*
********************************************************************************/

****OLS and OLS with covariates
	reg Yieldn T1 T2 $lga if year== 2 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "Yieldn_c.doc", ///
		title (Table 2c: Treatment effects on yield) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Yieldn T1 T2 $covar $lga if year== 2 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "Yieldn_c.doc", ///
		title (Table 2c: Treatment effects on yield) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Yieldn T1 T2 Yieldn0n $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "Yieldn_c.doc", ///
		title (Table 2c: Treatment effects on yield) ctitle (ANCOVA) ///
		drop(_lga* Yieldn0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Yieldn T1 T2 Yieldn0n $covar $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "Yieldn_c.doc", ///
		title (Table 2c: Treatment effects on yield) ctitle (ANCOVA) ///
		drop(_lga* Yieldn0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Yieldn if ntreatment == 1 & year == 2


/********************************************************************************
*		Table A.11a: Treatment effects on rice profit for all years				*
********************************************************************************/

****OLS and OLS with covariates
	reg RBE T1 T2 $lga if year!=0 [pw=1/pweight], cluster(village)  // OLS
		outreg2 using "profit_a.doc", ///
		title (Table 3a: Treatment effects on profit) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg RBE T1 T2 $covar $lga if year!=0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "profit_a.doc", ///
		title (Table 3a: Treatment effects on profit) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg RBE T1 T2 RBE0n i.year $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "profit_a.doc", ///
		title (Table 3a: Treatment effects on profit) ctitle (ANCOVA) ///
		drop(_lga* RBE0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg RBE T1 T2 RBE0n i.year $covar $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "profit_a.doc", ///
		title (Table 3a: Treatment effects on profit) ctitle (ANCOVA) ///
		drop(_lga* RBE0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum RBE if ntreatment == 1 & year != 0


/********************************************************************************
*			Table A.11b: Treatment effects on rice profit for 2016				*
********************************************************************************/

****OLS and OLS with covariates
	reg RBE T1 T2 $lga if year == 1 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "profit_b.doc", ///
		title (Table 3b: Treatment effects on profit) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg RBE T1 T2 $covar $lga if year == 1 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "profit_b.doc", ///
		title (Table 3b: Treatment effects on profit) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg RBE T1 T2 RBE0n $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "profit_b.doc", ///
		title (Table 3b: Treatment effects on profit) ctitle (ANCOVA) ///
		drop(_lga* RBE0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg RBE T1 T2 RBE0n $covar $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "profit_b.doc", ///
		title (Table 3b: Treatment effects on profit) ctitle (ANCOVA) ///
		drop(_lga* RBE0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum RBE if ntreatment == 1 & year == 1


/********************************************************************************
*			Table A.11c: Treatment effects on rice profit for 2017				*
********************************************************************************/

****OLS and OLS with covariates
	reg RBE T1 T2 $lga if year == 2 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "profit_c.doc", ///
		title (Table 3c: Treatment effects on profit) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg RBE T1 T2 $covar $lga if year == 2 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "profit_c.doc", ///
		title (Table 3c: Treatment effects on profit) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg RBE T1 T2 RBE0n $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "profit_c.doc", ///
		title (Table 3c: Treatment effects on profit) ctitle (ANCOVA) ///
		drop(_lga* RBE0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg RBE T1 T2 RBE0n $covar $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "profit_c.doc", ///
		title (Table 3c: Treatment effects on profit) ctitle (ANCOVA) ///
		drop(_lga* RBE0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum RBE if ntreatment == 1 & year == 2
	

/********************************************************************************
*	Table A.12a: Treatment effects on quantity of fertilizer for all years		*
********************************************************************************/

****OLS and OLS with covariates
	reg Qfert T1 T2 $lga if year != 0 [pw=1/pweight], cluster(village)  // OLS
		outreg2 using "fert_a.doc", ///
		title (Table 4a: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qfert T1 T2 $covar $lga if year!=0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "fert_a.doc", ///
		title (Table 4a: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qfert T1 T2 Qfert0n i.year $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "fert_a.doc", ///
		title (Table 4a: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qfert T1 T2 Qfert0n i.year $covar $lga if year!=0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "fert_a.doc", ///
		title (Table 4a: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qfert if ntreatment == 1 & year != 0


/********************************************************************************
*		Table A.12b: Treatment effects on quantity of fertilizer for 2016		*
********************************************************************************/

****OLS and OLS with covariates
	reg Qfert T1 T2 $lga if year == 1 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "fert_b.doc", ///
		title (Table 4b: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qfert T1 T2 $covar $lga if year == 1 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "fert_b.doc", ///
		title (Table 4b: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qfert T1 T2 Qfert0n $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "fert_b.doc", ///
		title (Table 4b: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qfert T1 T2 Qfert0n $covar $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "fert_b.doc", ///
		title (Table 4b: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qfert if ntreatment == 1 & year == 1


/********************************************************************************
*		Table A.12c: Treatment effects on quantity of fertilizer for 2017		*
********************************************************************************/

****OLS and OLS with covariates
	reg Qfert T1 T2 $lga if year == 2 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "fert_c.doc", ///
		title (Table 4c: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qfert T1 T2 $covar $lga if year == 2 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "fert_c.doc", ///
		title (Table 4c: Treatment effects on fertilizer) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qfert T1 T2 Qfert0n $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "fert_c.doc", ///
		title (Table 4c: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qfert T1 T2 Qfert0n $covar $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "fert_c.doc", ///
		title (Table 4c: Treatment effects on fertilizer) ctitle (ANCOVA) ///
		drop(_lga* Qfert0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qfert if ntreatment == 1 & year == 2
	

/********************************************************************************
*	Table A.13a: Treatment effects on quantity of NPK fertilizer for all years	*
********************************************************************************/

****OLS and OLS with covariates
	reg Qnpk_T T1 T2 $lga if year != 0 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "npk_a.doc", ///
		title (Table 5a: Treatment effects on NPK) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qnpk_T T1 T2 $covar $lga if year != 0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "npk_a.doc", ///
		title (Table 5a: Treatment effects on NPK) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qnpk_T T1 T2 Qnpk_T0n i.year $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "npk_a.doc", ///
		title (Table 5a: Treatment effects on NPK) ctitle (ANCOVA) ///
		drop(_lga* Qnpk_T0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qnpk_T T1 T2 Qnpk_T0n i.year $covar $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "npk_a.doc", ///
		title (Table 5a: Treatment effects on NPK) ctitle (ANCOVA) ///
		drop(_lga* Qnpk_T0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qnpk_T if ntreatment == 1 & year != 0

	
/********************************************************************************
*		Table A.13b: Treatment effects on quantity of NPK fertilizer for 2016	*
********************************************************************************/

****OLS and OLS with covariates
	reg Qnpk_T T1 T2 $lga if year == 1 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "npk_b.doc", ///
		title (Table 5b: Treatment effects on NPK) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qnpk_T T1 T2 $covar $lga if year == 1 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "npk_b.doc", ///
		title (Table 5b: Treatment effects on NPK) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qnpk_T T1 T2 Qnpk_T0n $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "npk_b.doc", ///
		title (Table 5b: Treatment effects on NPK) ctitle (ANCOVA) ///
		drop(_lga* Qnpk_T0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qnpk_T T1 T2 Qnpk_T0n $covar $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "npk_b.doc", ///
		title (Table 5b: Treatment effects on NPK) ctitle (ANCOVA) ///
		drop(_lga* Qnpk_T0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qnpk_T if ntreatment == 1 & year == 1


/********************************************************************************
*		Table A.13c: Treatment effects on quantity of NPK fertilizer for 2017	*
********************************************************************************/

****OLS and OLS with covariates
	reg Qnpk_T T1 T2 $lga if year == 2 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "npk_c.doc", ///
		title (Table 5c: Treatment effects on NPK) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qnpk_T T1 T2 $covar $lga if year == 2 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "npk_c.doc", ///
		title (Table 5c: Treatment effects on NPK) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qnpk_T T1 T2 Qnpk_T0n $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "npk_c.doc", ///
		title (Table 5c: Treatment effects on NPK) ctitle (ANCOVA) ///
		drop(_lga* Qnpk_T0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qnpk_T T1 T2 Qnpk_T0n $covar $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "npk_c.doc", ///
		title (Table 5c: Treatment effects on NPK) ctitle (ANCOVA) ///
		drop(_lga* Qnpk_T0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qnpk_T if ntreatment == 1 & year == 2
	

/********************************************************************************
*	Table A.14: Treatment effects on quantity of urea fertilizer for all years	*
********************************************************************************/

****OLS and OLS with covariates
	reg Qurea_T T1 T2 $lga if year != 0 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "urea_a.doc", ///
		title (Table 6a: Treatment effects on urea) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qurea_T T1 T2 $covar $lga if year != 0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "urea_a.doc", ///
		title (Table 6a: Treatment effects on urea) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qurea_T T1 T2 Qurea_T0n i.year $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "urea_a.doc", ///
		title (Table 6a: Treatment effects on urea) ctitle (ANCOVA) ///
		drop(_lga* Qurea_T0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qurea_T T1 T2 Qurea_T0n i.year $covar $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "urea_a.doc", ///
		title (Table 6a: Treatment effects on urea) ctitle (ANCOVA) ///
		drop(_lga* Qurea_T0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qurea_T if ntreatment == 1 & year != 0

	
/********************************************************************************
*		Table A.14b: Treatment effects on quantity of urea fertilizer for 2016	*
********************************************************************************/

****OLS and OLS with covariates
	reg Qurea_T T1 T2 $lga if year == 1 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "urea_b.doc", ///
		title (Table 6b: Treatment effects on urea) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qurea_T T1 T2 $covar $lga if year == 1 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "urea_b.doc", ///
		title (Table 6b: Treatment effects on urea) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qurea_T T1 T2 Qurea_T0n $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "urea_b.doc", ///
		title (Table 6b: Treatment effects on urea) ctitle (ANCOVA) ///
		drop(_lga* Qurea_T0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qurea_T T1 T2 Qurea_T0n $covar $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "urea_b.doc", ///
		title (Table 6b: Treatment effects on urea) ctitle (ANCOVA) ///
		drop(_lga* Qurea_T0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qurea_T if ntreatment == 1 & year == 1


/********************************************************************************
*		Table A.14c: Treatment effects on quantity of urea fertilizer for 2017	*
********************************************************************************/

****OLS and OLS with covariates
	reg Qurea_T T1 T2 $lga if year == 2 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "urea_c.doc", ///
		title (Table 6c: Treatment effects on urea) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qurea_T T1 T2 $covar $lga if year == 2 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "urea_c.doc", ///
		title (Table 6c: Treatment effects on urea) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg Qurea_T T1 T2 Qurea_T0n $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "urea_c.doc", ///
		title (Table 6c: Treatment effects on urea) ctitle (ANCOVA) ///
		drop(_lga* Qurea_T0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg Qurea_T T1 T2 Qurea_T0n $covar $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "urea_c.doc", ///
		title (Table 6c: Treatment effects on urea) ctitle (ANCOVA) ///
		drop(_lga* Qurea_T0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum Qurea_T if ntreatment == 1 & year == 2


/********************************************************************************
* Table A.15a: Treatment effects on timing of first NPK application for all years*
********************************************************************************/

****OLS and OLS with covariates
	reg period1_npk T1 T2 $lga if year != 0 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "NPKt_a.doc", ///
		title (Table 7a: Treatment effects on NPK timing) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_npk T1 T2 $covar $lga if year != 0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "NPKt_a.doc", ///
		title (Table 7a: Treatment effects on NPK timing) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg period1_npk T1 T2 period1_npk0n i.year $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "NPKt_a.doc", ///
		title (Table 7a: Treatment effects on NPK timing) ctitle (ANCOVA) ///
		drop(_lga* period1_npk0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_npk T1 T2 period1_npk0n i.year $covar $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "NPKt_a.doc", ///
		title (Table 7a: Treatment effects on NPK timing) ctitle (ANCOVA) ///
		drop(_lga* period1_npk0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum period1_npk if ntreatment == 1 & year != 0

	
/********************************************************************************
*	Table A.15b: Treatment effects on timing of first NPK application for 2016	*
********************************************************************************/

****OLS and OLS with covariates
	reg period1_npk T1 T2 $lga if year == 1 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "NPKt_b.doc", ///
		title (Table 7b: Treatment effects on NPK timing) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_npk T1 T2 $covar $lga if year == 1 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "NPKt_b.doc", ///
		title (Table 7b: Treatment effects on NPK timing) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg period1_npk T1 T2 period1_npk0n $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "NPKt_b.doc", ///
		title (Table 7b: Treatment effects on NPK timing) ctitle (ANCOVA) ///
		drop(_lga* period1_npk0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_npk T1 T2 period1_npk0n $covar $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "NPKt_b.doc", ///
		title (Table 7b: Treatment effects on NPK timing) ctitle (ANCOVA) ///
		drop(_lga* period1_npk0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum period1_npk if ntreatment == 1 & year == 1


/********************************************************************************
*	Table A.15c: Treatment effects on timing of first NPK application for 2017	*
********************************************************************************/

****OLS and OLS with covariates
	reg period1_npk T1 T2 $lga if year == 2 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "NPKt_c.doc", ///
		title (Table 7c: Treatment effects on NPK timing) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_npk T1 T2 $covar $lga if year == 2 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "NPKt_c.doc", ///
		title (Table 7c: Treatment effects on NPK timing) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg period1_npk T1 T2 period1_npk0n $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "NPKt_c.doc", ///
		title (Table 7c: Treatment effects on NPK timing) ctitle (ANCOVA) ///
		drop(_lga* period1_npk0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_npk T1 T2 period1_npk0n $covar $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "NPKt_c.doc", ///
		title (Table 7c: Treatment effects on NPK timing) ctitle (ANCOVA) ///
		drop(_lga* period1_npk0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum period1_npk if ntreatment == 1 & year == 2


/********************************************************************************
* Table A.16a: Treatment effects on timing of first urea application for all years*
********************************************************************************/

****OLS and OLS with covariates
	reg period1_urea T1 T2 $lga if year != 0 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "ureat_a.doc", ///
		title (Table 8a: Treatment effects on urea timing) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_urea T1 T2 $covar $lga if year != 0 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "ureat_a.doc", ///
		title (Table 8a: Treatment effects on urea timing) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg period1_urea T1 T2 period1_urea0n i.year $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "ureat_a.doc", ///
		title (Table 8a: Treatment effects on urea timing) ctitle (ANCOVA) ///
		drop(_lga* period1_urea0n 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_urea T1 T2 period1_urea0n i.year $covar $lga if year != 0 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "ureat_a.doc", ///
		title (Table 8a: Treatment effects on urea timing) ctitle (ANCOVA) ///
		drop(_lga* period1_urea0n age tailmen educ2 agric njour_agri_form credit_riz 2.year) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum period1_urea if ntreatment == 1 & year != 0
	
	
/********************************************************************************
*	Table A.16b: Treatment effects on timing of first urea application for 2016	*
********************************************************************************/

****OLS and OLS with covariates
	reg period1_urea T1 T2 $lga if year == 1 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "ureat_b.doc", ///
		title (Table 8b: Treatment effects on urea timing) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_urea T1 T2 $covar $lga if year == 1 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "ureat_b.doc", ///
		title (Table 8b: Treatment effects on urea timing) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg period1_urea T1 T2 period1_urea0n $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "ureat_b.doc", ///
		title (Table 8b: Treatment effects on urea timing) ctitle (ANCOVA) ///
		drop(_lga* period1_urea0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_urea T1 T2 period1_urea0n $covar $lga if year == 1 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "ureat_b.doc", ///
		title (Table 8b: Treatment effects on urea timing) ctitle (ANCOVA) ///
		drop(_lga* period1_urea0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum period1_urea if ntreatment == 1 & year == 1


/********************************************************************************
*	Table A.16c: Treatment effects on timing of first urea application for 2017	*
********************************************************************************/

****OLS and OLS with covariates
	reg period1_urea T1 T2 $lga if year == 2 [pw=1/pweight], vce(cl village)  // OLS
		outreg2 using "ureat_c.doc", ///
		title (Table 8c: Treatment effects on urea timing) ctitle (OLS) ///
		drop(_lga*) se dec(3) label replace nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_urea T1 T2 $covar $lga if year == 2 [pw=1/pweight], cluster (village) // OLS with covariates
		outreg2 using "ureat_c.doc", ///
		title (Table 8c: Treatment effects on urea timing) ctitle (OLS) ///
		drop(_lga* age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
****ANCOVA and ANCOVA with covariates
	reg period1_urea T1 T2 period1_urea0n $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA
		outreg2 using "ureat_c.doc", ///
		title (Table 8c: Treatment effects on urea timing) ctitle (ANCOVA) ///
		drop(_lga* period1_urea0n) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, No)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2
	
	reg period1_urea T1 T2 period1_urea0n $covar $lga if year == 2 [pw=1/pweight], cluster (village) // ANCOVA with covariates
		outreg2 using "ureat_c.doc", ///
		title (Table 8c: Treatment effects on urea timing) ctitle (ANCOVA) ///
		drop(_lga* period1_urea0n age tailmen educ2 agric njour_agri_form credit_riz) se dec(3) label append nocons ///
		addtext(LGA FE, Yes, Household Covariates, Yes)
	
	lincom T1 + T2 // Test T = C
	lincom T2 - T1 // Test T1 = T2

****Mean dependent variable in control
	sum period1_urea if ntreatment == 1 & year == 2

	
/* END */
