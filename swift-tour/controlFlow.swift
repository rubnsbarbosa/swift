let individualScores = [75, 42, 102, 86, 12]
var teamScore = 0

for score in individualScores {
	if score > 50 {
		teamScore += 3	
	} else {
		teamScore += 1
	}
}

print(teamScore)
