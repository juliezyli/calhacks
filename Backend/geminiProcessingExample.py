import google.generativeai as genai
import os
import numpy as np
import matplotlib.pyplot as plt
import time 
genai.configure(api_key="AIzaSyDuNu-risK3DWG_-0T1h-pRbxLWQ51pUaw")
model = genai.GenerativeModel("gemini-1.5-flash")
numbers = []
for _ in range(30):
    response = model.generate_content("""Given the two following samples, assign them a score from 0-100 for how similar they are. Output only one number. Be precise to the nearest ones digit. 
                                  1.) Hello! I love to play chess and go to the beach. I am a big fan of Sharetea, and I love to chat while studying! 

                                  2.) Hello. I like to take long walks at the beach and pet puppies. I'll be LOCKING IN during our study sesh. 
                                  """)
    numbers.append(int(str(response)))
    time.sleep(10)

print(numbers)
plt.hist(numbers)
plt.xlabel('score')
plt.ylabel('# of responses')
plt.show()

    