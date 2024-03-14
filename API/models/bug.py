import datetime as dt

from sqlalchemy import func
from sqlalchemy.orm import relationship

from models.shared_db import db, ma


class Bug(db.Model):
    bug_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(100))
    description = db.Column(db.String(255))
    reporter = db.Column(db.String(100))
    image = db.Column(db.String(100))
    date = db.Column(db.DateTime(timezone=True), server_default=func.now())
    status = db.Column(db.String(100))

    def __init__(self, title, date, status, reporter, image, description):
        self.title = title
        self.description = description
        self.reporter = reporter
        self.image = image
        self.date = date
        self.status = status

    def __repr__(self):
        return '<Bug(name={self.title!r})>'.format(self=self)


class BugSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = Bug
