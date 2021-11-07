
# Calculate Severity Score 
# https://doi.org/10.1016/S0016-5085(76)80163-1
def getScore(dictionary):
    
    factor_dict = {'DiarrheaScore': 30, 
	               'AbdominalPainScore': 5, 
	               'WellbeingScore': 7, 
	               'SkinScore': 4, 
	               'Above100FScore': 4, 
	               'FissureScore': 4,
	               'EyeScore': 4,
	               'ArthritisScore': 4,
	               'AbdominalMassScore': 10,
	               'LiquidStoolsScore': 2, 
	               'BodyWeightScore': 1}
    
    user_score = [dictionary.get(key) for key in factor_dict]
    factor = [factor_dict.get(values) for values in factor_dict]
    Score = sum([user_score[i] * factor[i] for i in range(0, len(user_score))])
    return Score;