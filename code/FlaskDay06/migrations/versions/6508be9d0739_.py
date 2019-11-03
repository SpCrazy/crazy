"""empty message

Revision ID: 6508be9d0739
Revises: cccf2ed71ad6
Create Date: 2019-07-12 19:35:50.972562

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '6508be9d0739'
down_revision = 'cccf2ed71ad6'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_unique_constraint(None, 'users', ['name'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'users', type_='unique')
    # ### end Alembic commands ###
