########################################################
# ANALYSIS SCRIPT
# THE SCRITP RUNS ANALYSIS ON A CPS_SMC.xml model
# YOU MUST SPECIFY
# - "query" variable
# - path variables "verifyta_path", "model_path" "query_path"
########################################################


import time
import sys
import subprocess as sp
import pickle
import shutil


def parse_out(out):
	lines = out.split("\n")
	index = [i for i, s in enumerate(lines) if ("Pr(<> ...)" in s or "Pr(MITL ) in" in s)]
	index = index[0]
	value = lines[index].split(" ")[-1]
	return value


def main():

	######################
	# CHANGE PATH HERE
	verifyta_path = "PATH OF MAIN FOLDER OF UPPAAL" + "uppaal64-4.1.19/bin-Linux/"	
	model_path = "PATH OF THE FOLDER OF cps_smc.xml"
	query_path = "PATH OF THE FOLDER OF query.q"
	######################
	

	model_name = "cps_smc.xml" 
	query_name = "query.q"

	uppaal_folder = verifyta_path
	uppaal_file_name =  model_path + model_name
	query_file_name = query_path + query_name
	
	engine_name = "verifyta"
	
	######################
	# CHANGE PRECISION HERE
	alpha = 0.01
	error = 0.01
	######################

	#################################################################################################################################
	# TO AVOID BUGS THE ANALYSIS ARE EXECUTED ON COPIES OF THE MODEL AND THE QUERY FILE
	# Make copy of uppaal file
	shutil.copy(uppaal_file_name, model_path + "copy_" + model_name)

	uppaal_file_name = model_path + "copy_" + model_name

	# make a copy of the query fie
	shutil.copy(query_file_name, query_path + "copy_" + query_name)

	query_file_name = query_path + "copy_" + query_name
	
	launch_cmd = uppaal_folder+engine_name + " " + uppaal_file_name + " " + query_file_name + " -a "+str(alpha) + " -E " + str(error)
	#################################################################################################################################

	for n in range(1,301):
		
		#CHANGE M IN UPPAAL FILE
		content_to_modify = "const int M_ATCK"
		content = []
		with open(uppaal_file_name,"r") as uppaal_file:
			content = uppaal_file.readlines()
			#print [i for i, s in enumerate(content) if content_to_modify in s]
			attack_index = [i for i, s in enumerate(content) if content_to_modify in s][0]
			content[attack_index] = "const int M_ATCK = "+str(n)+";\n"

  		open(uppaal_file_name, 'w').close()

  		with open(uppaal_file_name,"r+") as uppaal_file:
  			for i in content:
  				uppaal_file.write("%s" % i)


######################################################################
  		# MODIFY QUERY HERE
  		query = "Pr([][1,{0}] (  safe  ))".format(n+4) 
		#query = "Pr [<=1000] (<> deadlocks )"" 
######################################################################


  		print "RUN NUMBER: " + str(n)
  		print query
  		
  		#EXECUTE QUERY
  		open(query_file_name, 'w').close()

  		with open(query_file_name,"r+") as query_file:
  				query_file.write("%s" % query)

		proc = sp.Popen(launch_cmd, shell=True, stdout = sp.PIPE)
		out, err = proc.communicate()
		result = out
		
		#PRINT ANALYSIS RESULT
		#print out
		print parse_out(out) + "\n"
		

if __name__ == '__main__':
	main()
