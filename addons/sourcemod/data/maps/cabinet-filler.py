import sys
import math
from pathlib import Path

cos = math.cos
sin = math.sin
rad = math.radians

a = [
		(-95, 0, 0), (-105, 0, 0), (-90, -2, 15), (-95, 3, 5), 
		(-90, 0, 5), (-105, -3, 0), (-100, 0, 0), (-35, 161, 95), 
		(-10, 122, -15), (0, -19, 5), (39, 98, 0), (90, 0, 0), 
		(90, 0, 0), (90, 0, 0), (90, 0, 0), (0, -92, -90), 
		(0, -92, -90), (0, 0, -90), (0, 0, -90), (0, 100, 85), 
		(0, 100, 85), (0, 100, 85), (0, 100, 85), (0, 100, 85), 
		(0, 100, 85), (0, 100, 85), (0, 100, 85)
	]

p = [
		(2, -15, 16), (6, -12, 13), (0, -7, 13), (0, -4, 15), 
		(-2, 0, 14), (5, 3, 5), (2, 7, 13), (15, 14, 1), 
		(3, 5, 67), (2, 11, 67), (2, 18, 67), (-9, -16, 61), 
		(-9, -1, 61), (-9, -16, 52), (-9, -1, 52), (-9, 14, 51), 
		(-9, 14, 37), (2, -17, 68), (2, -7, 68), (11, -18, 2), 
		(11, -18, 2), (11, -18, 2), (11, -18, 2), (11, -18, 2), 
		(11, -18, 2), (11, -18, 2), (11, -18, 2)
	]

m = [ 20, 2, 0, 14, 1, 16, 11, 23, 7, 24, 6, 8, 8, 8,
           8, 26, 27, 25, 25, 28, 28, 28, 28, 28, 28, 28, 28 ]

print(Path.exists(Path(sys.argv[1])));
with open(sys.argv[1], "r") as fh:
	for line in fh:
		if ("origin" in line):
			pos_string = line[11:-2]
			pos = ( int(pos_string[0:pos_string.find(' ')]),
					int(pos_string[pos_string.find(' ')+1:pos_string.find(' ',pos_string.find(' ')+1)]),
					int(pos_string[pos_string.find(' ',pos_string.find(' ')+1)+1:])
				)
			
		
		if ("angles" in line):
			ang_string = line[11:-2]
			ang = ( int(ang_string[0:ang_string.find(' ')]),
					int(ang_string[ang_string.find(' ')+1:ang_string.find(' ',ang_string.find(' ')+1)]) -2,
					int(ang_string[ang_string.find(' ',ang_string.find(' ')+1)+1:])
				)
			
#		if ('"mod"' in line):
#			print("Already done! Aborting!")
#			sys.exit()
		
	

with open(sys.argv[1], "a") as fh:
	fh.write('\n\t"' + sys.argv[1][0:-4] + 
			 '"\n\t{\n\t\t"num"\t\t"27"\n')
	for i in range(27):
		fh.write('\t\t"' + str(i+1) + '"\n\t\t{\n')
		# add ry angle
		new_ang = str(a[i][0]) + " " + str(a[i][1]+ang[1]) + " " + str(a[i][2])
		fh.write('\t\t\t"ang"\t\t"' + new_ang + 
					'"\n'
				)
		#add positions
		# Apparently the ry-axis is reversed from standard
		# xn = x * cos(ry) - y * sin(ry)
		# yn = x * sin(ry) + y * cos(ry)
		# Python does radians, Source uses degrees.
		x = round(p[i][0] * cos(rad(ang[1])) - p[i][1] * sin(rad(ang[1])), 0)
		y = round(p[i][0] * sin(rad(ang[1])) + p[i][1] * cos(rad(ang[1])), 0)
		z = p[i][2]
		new_pos = str(x + pos[0]) + " " + str(y + pos[1]) + " " + str(z + pos[2])
		fh.write('\t\t\t"pos"\t\t"' + new_pos + '"\n')
		
		fh.write('\t\t\t"mod"\t\t"' + str(m[i]) + '"\n')
		fh.write('\t\t}\n')
	
	fh.write('\t}\n')

