//for M_ATCK = 100


//Pr [<= M_ATCK] (<> ctrl.Cooling_on && c_time >= M_ATCK )
Pr [<= 100] (<> ctrl.Cooling_on && c_time >= 100 )

//Pr([][0,M_ATCK+3]  (not deadlocks))	
Pr([][0,103]  (not deadlocks))	

//Pr([][0,M_ATCK+3] (safe))
Pr([][0,103] (safe))

//Pr([][0,M_ATCK+4] (not alarm))
Pr([][0,104] (not alarm))

//Pr [<= M_ATCK+4] (<> not safe)
Pr [<= 104] (<> not safe)

//Pr [<= M_ATCK+5] (<> not alarm)
Pr [<= 105] (<> not alarm)


Pr [<= 1000] (<> deadlocks)		
