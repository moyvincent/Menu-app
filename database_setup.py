from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import create_engine

Base = declarative_base()


class Restaurant(Base):
    # Table information
    __tablename__ = 'restaurant'

   # Mappers
    id = Column(Integer, primary_key=True)
    name = Column(String(250), nullable=False)
    image_data = Column(String(400), nullable=True)


class MenuItem(Base):
    # Table information
    __tablename__ = 'menu_item'

    # Mappers
    name = Column(String(80), nullable=False)
    id = Column(Integer, primary_key=True)
    description = Column(String(250))
    price = Column(String(8))
    course = Column(String(250))
    restaurant_id = Column(Integer, ForeignKey('restaurant.id'))
    restaurant = relationship(Restaurant)

engine = create_engine('sqlite:///restaurantmenu.db')
Base.metadata.create_all(bind=engine)
