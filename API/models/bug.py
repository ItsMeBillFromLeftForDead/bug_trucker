import datetime as dt

from marshmallow import Schema, fields


class Bug(object):
    def __init__(self, bugID, title, date, description, reporter, image, status):
        self.bugID = bugID
        self.title = title
        self.description = description
        self.reporter = reporter
        self.image = image
        self.date = date
        self.status = status

    def __repr__(self):
        return '<Bug(name={self.title!r})>'.format(self=self)


class BugSchema(Schema):
    bugID = fields.Number()
    title = fields.Str()
    description = fields.Str()
    reporter = fields.Str()
    image = fields.Str()
    date = fields.Date()
    Status = fields.Str()
