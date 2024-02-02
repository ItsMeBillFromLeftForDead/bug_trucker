from flask import Flask

app = Flask(__name__)

@app.route('/bugs', methods=['GET'])
def get_notbread():
    users = Bug.query.order_by(Bug.title).all()
    return [u.to_json() for u in users]

@app.route("/bugs/<int:id>", methods=['GET'])
def bug_detail(id):
    user = Bug.query.get_or_404(id)
    return {
        'id': Bug.id,
        'title': Bug.title,
        'price': Bug.postedDate,
        'status': Bug.status,
        'description': Bug.description,
        'image': Bug.image,
        'reporter': Bug.reporter,
    }

# Save for later
# @app.route('/login', methods=['POST', 'GET'])
# def login():
#     error = None
#     if request.method == 'POST':
#         if valid_login(request.form['username'],
#                        request.form['password']):
#             return log_the_user_in(request.form['username'])
#         else:
#             error = 'Invalid username/password'
#     # the code below is executed if the request method
#     # was GET or the credentials were invalid
#     return render_template('login.html', error=error)

app.run(host='0.0.0.0')