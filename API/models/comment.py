import datetime as dt

from marshmallow import Schema, fields


class Comment(object):
    def __init__(self, commentID, bugID, date, description, reporter, image):
        self.commentID = commentID
        self.bugID = bugID
        self.description = description
        self.reporter = reporter
        self.image = image
        self.date = date

    def __repr__(self):
        return '<Comment(name={self.commentID!r})>'.format(self=self)


class CommentSchema(Schema):
    commentID = fields.Number()
    bugID = fields.Number()
    description = fields.Str()
    reporter = fields.Str()
    image = fields.Str()
    date = fields.Date()
