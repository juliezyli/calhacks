from rest_framework import serializers
from myapp.models import UserPreference
from myapp.chroma_manager import ChromaManage

class UserPreferenceSerializer(serializers.ModelSerializer):
    embedding = serializers.SerializerMethodField()

    class Meta:
        model = UserPreference 
        fields = ['user_id', 'preferences', 'embedding']
    
    def get_embedding(self, obj):
        chroma_manager = ChromaManage()
        embedding = chroma_manager.get_user_embedding(obj.user_id)
        if embedding is None:
            return None
        return embedding 