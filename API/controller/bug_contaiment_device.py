from datetime import datetime

from flask import Flask, jsonify, request
import os

from models.demo_data import demoBugs, demoComments
from models.shared_db import db, ma

from models.bug import BugSchema, Bug
from models.comment import CommentSchema, Comment


app = Flask(__name__)
BUG_BASE_URL = '/bug/'
COMMENT_BASE_URL = f'{BUG_BASE_URL}<int:bug_id>/comment'
basedir = os.path.abspath(os.path.dirname(__file__))
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + \
    os.path.join(basedir, 'db.sqlite3')
db.init_app(app)
ma.init_app(app)


with app.app_context():
    db.drop_all()
    db.create_all()
    db.session.add_all(demoBugs)
    db.session.add_all(demoComments)
    db.session.commit()

bug_schema = BugSchema()
bugs_schema = BugSchema(many=True)
comment_schema = CommentSchema()
comments_schema = CommentSchema(many=True)

@app.route('/')
def default():
    return 'here is the default page'


@app.route(BUG_BASE_URL, methods=['GET'])
def get_all_bugs():
    limit = request.args.get('limit')
    offset = request.args.get('offset')
    bugs = Bug.query.offset(offset if offset else 0).limit(limit if limit and int(limit) <= 250 else 25)
    return jsonify(bugs_schema.dump(bugs))


@app.route(f'{BUG_BASE_URL}<int:bug_id>', methods=['GET'])
def bug_detail(bug_id):
    bug = Bug.query.get(bug_id)
    return bug_schema.jsonify(bug)


@app.route(BUG_BASE_URL, methods=['POST'])
def create_bug():
    title = request.json.get('title', '')
    description = request.json.get('description', '')
    reporter = request.json.get('reporter', '')
    image = request.json.get('image', '')
    date = datetime.strptime(request.json.get('date', ''), '%m/%d/%y %H:%M:%S')
    status = request.json.get('status', '')

    bug = Bug(title=title, date=date, description=description, reporter=reporter, image=image, status=status)
    db.session.add(bug)
    db.session.commit()
    return bug_schema.jsonify(bug)


@app.route(f'{BUG_BASE_URL}<int:bug_id>/', methods=['PATCH'])
def update_bug(bug_id):
    title = request.json.get('title', '')
    description = request.json.get('description', '')
    reporter = request.json.get('reporter', '')
    image = request.json.get('image', '')
    date = datetime.strptime(request.json.get('date', ''), '%m/%d/%y %H:%M:%S')
    status = request.json.get('status', '')

    bug = Bug.query.get(bug_id)
    bug.title = title
    bug.description = description
    bug.reporter = reporter
    bug.image = image
    bug.date = date
    bug.status = status
    db.session.add(bug)
    db.session.commit()
    return bug_schema.jsonify(bug)


@app.route(f'{BUG_BASE_URL}<int:bug_id>/', methods=['DELETE'])
def delete_bug(bug_id):
    bug = Bug.query.get(bug_id)
    db.session.delete(bug)
    db.session.commit()
    return bug_schema.jsonify(bug)


@app.route(COMMENT_BASE_URL, methods=['GET'])
def get_all_comments_by_bug(bug_id):
    limit = request.args.get('limit')
    offset = request.args.get('offset')
    comments = Comment.query.filter(Comment.bug_id == bug_id).offset(offset if offset else 0).limit(limit if limit and int(limit) <= 250 else 25)
    return jsonify(comments_schema.dump(comments))


@app.route(f'{COMMENT_BASE_URL}<int:comment_id>', methods=['GET'])
def comment_detail(comment_id):
    comment = Comment.query.get(comment_id)
    return comment_schema.jsonify(comment)


@app.route(COMMENT_BASE_URL, methods=['POST'])
def create_comment():
    description = request.json.get('content', '')
    comment = Comment(description=description)
    db.session.add(comment)
    db.session.commit()
    return comment.jsonify(comment)


@app.route(f'{COMMENT_BASE_URL}<int:comment_id>', methods=['PATCH'])
def update_comment(comment_id):
    title = request.json.get('title', '')
    content = request.json.get('content', '')
    note = Bug.query.get(comment_id)
    note.title = title
    note.content = content
    db.session.add(note)
    db.session.commit()
    return comment_schema.jsonify(note)


@app.route(f'{COMMENT_BASE_URL}<int:comment_id>', methods=['DELETE'])
def delete_comment(comment_id):
    comment = Bug.query.get(comment_id)
    db.session.delete(comment)
    db.session.commit()
    return comment_schema.jsonify(comment)


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
