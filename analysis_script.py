########################################################
# ANALYSIS SCRIPT
# THE SCRITP RUNS ANALYSIS ON A CPS_SMC.xml model
# YOU MUST SPECIFY
# - "query" variable
# - path variables "verifyta_path", "model_path" "query_path"
########################################################


from os import write
import time
import sys
import subprocess as sp
import pickle
import shutil
import pathlib as path

def parse_out(out):
    out = str(out, 'utf-8')
    lines = out.split("\n")
    index = 0
    for i, s in enumerate(lines):
        if ("Pr(<> ...)" in s or "Pr(MITL ) in" in s):
            index = i
            break
    #index = [i for i, s in enumerate(lines) if ("Pr(<> ...)" in s or "Pr(MITL ) in" in s)]
    #index = index[0]
    #print(lines)
    value = lines[index].split(" ")[-1]
    return value


def main():
    ######################
    # CHANGE PATH HERE
    verifyta_path = ("/home/chidiagbo/uppaal64-4.1.24/bin-Linux/")  # "PATH OF MAIN FOLDER OF UPPAAL" + "uppaal64-4.1.19/bin-Linux/"
    model_path = ("/home/chidiagbo/Desktop/Uppaal_Research_Project/top_c/")  #PATH OF THE FOLDER OF cps_smc.xml
    query_path =("/home/chidiagbo/Desktop/Uppaal_Research_Project/top_c/")  # "PATH OF THE FOLDER OF query.q"
    ######################

    model_name = "top_c.xml"
    query_name = "query.q"

    uppaal_folder = verifyta_path
    uppaal_file_name = model_path + model_name
    query_file_name = query_path + query_name

    engine_name = "verifyta"

    ######################
    # CHANGE PRECISION HERE
    alpha = 0.01 # Probability of false negatives
    error = 0.01 # Probalistic uncertainty
    ######################

   #################################################################################################################################
    # TO AVOID BUGS THE ANALYSIS ARE EXECUTED ON COPIES OF THE MODEL AND THE QUERY FILE
    # Make copy of uppaal file
    shutil.copy(uppaal_file_name, model_path + "copy_" + model_name)

    uppaal_file_name = model_path + "copy_" + model_name

    # make a copy of the query fie
    shutil.copy(query_file_name, query_path + "copy_" + query_name)

    query_file_name = query_path + "copy_" + query_name

    launch_cmd = uppaal_folder + engine_name + " " + uppaal_file_name + " " + query_file_name + " -a " + str(
        alpha) + " -E " + str(error)
    #################################################################################################################################

    for n in range(1, 301):

        # CHANGE M IN UPPAAL FILE
        content_to_modify = "const int M_ATCK"
        content = []
        with open(uppaal_file_name, "r") as uppaal_file:
            content = uppaal_file.readlines()
            #print ([i for i, s in enumerate(content) if content_to_modify in s][0])
            attack_index = [i for i, s in enumerate(content) if content_to_modify in s][0]
            content[attack_index] = "const int M_ATCK = " + str(n) + ";\n"

        open(uppaal_file_name, 'w').close()


        with open(uppaal_file_name, "r+") as uppaal_file:
            for i in content:
                uppaal_file.write("%s" % i)

        ######################################################################
        # MODIFY QUERY HERE
        #query = "Pr([][1,{0}] (safe))".format(n+3) 
        #query = "Pr(<>[0, {0}] (!safe))".format(n+4)
        #query = "Pr([][1,{0}] (!alarm))".format(n+4) 
        #query = "Pr(<>[0, {0}] (alarm))".format(n+5)
        #query = "Pr [<=1000] (<> deadlocks )"
        #query = "Pr (<>[0, {0}] (deadlocks))".format(n + 3)
        #query =  "Pr (<>[0, {0}] (ctrl.Cooling_on && c_time >={1}))".format(n, n)
        #query =  "Pr (<>[0, {0}] (ctrl.Cooling_on && c_time >={1}))".format(n+3, n)
        ######################################################################
        
        #Attack 2 querries
        #Remember to restrict the attack time m within 9..300 interval before running the querries.
        #query = "Pr(<>[1,{0}] (safe))".format(n+4)
        #query = "Pr([][{}, 1000] (deadlocks))".format(n+1)
        #query = "Pr([][1,{0}] (!deadlock))".format(n+4)
        #query = "Pr([][1,{0}] (!alarm))".format(n+4)
        #query = "Pr(<>[1,{0}] (!safe))".format(n+5)
       
        #query = "Pr([][0, 1000] (!alarm))" #Stealthy Property
        #query = "Pr(<>[0,{0}] (!safe && {1} <= c_time && c_time <= {0}))".format(n+11, n+1)
        #query = "Pr(<>[0, n+11] (!safe && n+1 <= c_time <= n+11"
        #query = "Pr([][{0}, 1000] (deadlocks))".format(n+80) 
       
       #top c attack queries
        #query = "Pr(<>[0, {}] (deadlocks && c_time >= {}))".format(n+3, n+1)
        #query =  "Pr (<>[0, {0}] (ctrl.Cooling_on && c_time >={1}))".format(n, n)
        #query =  "Pr (<>[0, {0}] (ctrl.Cooling_on && c_time >={1}))".format(n+3, n)
        query =  "Pr (<>[0, 1000] (deadlocks && c_time >={}))".format(n+3)
        ######################################################################


        print("RUN NUMBER: " + str(n))
        print(query)

        # EXECUTE QUERY
        open(query_file_name, 'w+').close()

        with open(query_file_name, "r+") as query_file:
            query_file.write("%s" % query)

        proc = sp.Popen(launch_cmd, shell=True, stdout=sp.PIPE)
        out, err = proc.communicate()
        result = out

        # PRINT ANALYSIS RESULT
        #print(out)
        output = "" + "outputFile.txt"
        with open(output, 'a') as f:
            f.writelines(str(n) + ", " + parse_out(out) + "\n")
        #print(parse_out(out) + "\n")


if __name__ == '__main__':
    main()