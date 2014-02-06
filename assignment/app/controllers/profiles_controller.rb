class ProfilesController < ApplicationController



def show
    @profile=User.find(current_user.id)
  end

def edit
    @m=User.find(current_user.id)
  end

   

def update


@m=User.find(current_user.id)
    @m.name=params[:name]

@m.City=params[:city]
@m.photo=params[:photo]


@m.save
redirect_to profile_path(current_user.id)

    end
  end






