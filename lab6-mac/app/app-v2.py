from flask import Flask
from redis import Redis
import os
app = Flask(__name_
redis = Redis(host='redis', port=6379)

@app.route('/')
def hello():
  redis.incr('hits')
  return 'Hello from host %s. Site accessed %s times.\n' % (os.environ.get('HOSTNAME'),redis.get('hits'))

if __name__ == "__main__":
  app.run(host="0.0.0.0", debug=True)
