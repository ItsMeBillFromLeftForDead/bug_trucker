from sqlalchemy import func
from sqlalchemy.orm import relationship

from models.shared_db import db, ma


class Comment(db.Model):
    comment_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    bug_id = db.Column(db.Integer, db.ForeignKey('bug.bug_id'), nullable=False)
    date = db.Column(db.DateTime(timezone=True), server_default=func.now())
    description = db.Column(db.String(255))
    reporter = db.Column(db.String(100))
    image = db.Column(db.String(100))

    def __init__(self, bug_id, date, reporter, image, description):
        self.bug_id = bug_id
        self.date = date
        self.reporter = reporter
        self.image = image
        self.description = description

    def __repr__(self):
        return '<Bug(name={self.title!r})>'.format(self=self)


class CommentSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = Comment