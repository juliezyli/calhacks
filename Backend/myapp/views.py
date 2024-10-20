from django.http import JsonResponse
from myapp.chroma_manager import ChromaManage
from myapp.models import UserPreference
from apis.serializers import UserPreferenceSerializer
from rest_framework.decorators import api_view
from sentence_transformers import SentenceTransformer
import numpy as np
# store/retrieve user preferences using embeddings 

def generate_embedding(preferences):
    model = SentenceTransformer('all-MiniLM-L6-v2')
    return model.encode(preferences)

# cosine function used to compare vectors (special to Chroma)
def cosine_similarity(vec1, vec2):
    dot_product = np.dot(vec1, vec2)
    norm_vec1 = np.linalg.norm(vec1)
    norm_vec2 = np.linalg.norm(vec2)
    return dot_product/(norm_vec1 * norm_vec2)

# adding user inputs into the database
def add_user_preferences_view(request):
    if request.method == 'GET':
        chroma_manager = ChromaManage()

        user_id = request.GET.get('user_id')
        preferences = request.GET.get('preferences')
        if not user_id or not preferences:
            return JsonResponse({'error': 'Missing user_id or preferences in the request'}, status = 400)
        embedding = generate_embedding(preferences)
        chroma_manager.add_user_preferences(user_id, preferences, embedding)
        return JsonResponse({'message': 'User preferences added successfully'}, statue = 200)
    return JsonResponse({'error': 'Method not allowed. Use GET request.'}, status = 405)

# calculating and returning similarity_score 
def calculate_similarity(embedding1, embedding2):
    return cosine_similarity([embedding1], [embedding2])[0][0]

# determining which user to return as most similar 
def explore_similar_users_view(request):
    chroma_manager = ChromaManage()
    user_id = request.GET.get('user_id')
    current_user_embedding = chroma_manager.get_user.embedding(user_id)

    if current_user_embedding is None:
        return JsonResponse({'error': 'User embedding not found'}, status = 404)
    
    all_users = UserPreference.objects.exclude(user_id = user_id)

    most_similar_user = None
    highest_similarity = -1 

    for user in all_users:
        other_user_embedding = chroma_manager.get_user_embedding(user.user_id)
        if other_user_embedding is not None:
            similarity = calculate_similarity(current_user_embedding, other_user_embedding)
            if similarity > highest_similarity:
                highest_similarity = similarity 
                most_similar_user = user
    if most_similar_user is None:
        return JsonResponse({'error': 'No similar users found'}, status = 404)
    
    serializer = UserPreferenceSerializer(most_similar_user)
    return JsonResponse({
        'most_similar_use': serializer.data,
        'similarity_score': highest_similarity
    }, status = 200)