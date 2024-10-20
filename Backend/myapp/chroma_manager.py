import chromadb
# handles user preferences

class ChromaManage:
  def __init__(self):
    self.client = chromadb.Client() 
    self.collection = None

  def create_collection_preference(self):
    if not self.collection:
      self.collection = self.client.create_collection('user_preferences')
    return self.collection
  
  def add_user_preferences(self, user_id, embedding, metadata):
    collection = self.create_collection_preference()

    collection.add(
      embeddings = [embedding],
      metadatas = [metadata],
      ids = [user_id]
    )

  def explore_similar_users(self, embedding, k = 5):
    collection = self.create_collection_preference()
    return collection.query(
      query_embeddings = [embedding],
      n_results = k
    )
  
  def get_user_preferences(self, user_id):
    collection = self.create_collection_preference()
    return collection.get(ids = [user_id])

  def get_user_preferences(self, user_id):
    result = self.get_user_preferences(user_id)
    if result and 'embeddings' in result and len(result['embeddings']) > 0:
      return result['embeddings'][0]
    return None