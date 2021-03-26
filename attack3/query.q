//for M_ATCK in [1,8]
Pr([][0,1000]  (safe))
Pr([][0,1000]  (not alarm))
Pr([][0,1000]  (not deadlocks))	


//for M_ATCK = 9
Pr([][0,1000]  (not deadlocks))	

Pr([][0,13]  (safe))	

Pr([][0,13]  (not alarm))	

Pr([][16,1000]  (safe))	

Pr([][16,1000]  (not alarm))	

Pr [<= 14] (<> (not safe && c_time >= 14) )
Pr [<= 15] (<> (not safe && c_time >= 15) )

//for M_ATCK >= 10
// eg M_ATKC = 100

Pr([][0,1000]  (not deadlocks))	

Pr([][0,13]  (safe))	

//Pr([][M_ATCK+12,1000]  (safe))
Pr([][112,1000]  (safe))	

//Pr([][0,M_ATCK]  (safe))
Pr([][0,100]  (not alarm))	

//Pr([][M_ATCK+12,1000]  (safe))
Pr([][112,1000]  (not alarm))	

Pr [<= 14] (<> (nt safe && c_time >= 14) )

//Pr [<= M_ATCK+11] (<> (no safe && c_time >= M_ATCK+1) )
Pr [<= 111] (<> (not safe && c_time >= 101) )

//Pr [<= M_ATCK+11] (<> alarm )
Pr [<= 111] (<> alarm)
