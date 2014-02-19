class ProfilesController < ApplicationController



def show
    @profile=User.find(params[:id])
  end

def edit
    @m=User.find(current_user.id)
  end

   

def update


@m=User.find(current_user.id)
    @m.name=params[:name]

@m.City=params[:City]
@m.photo=params[:photo]

@m.dob=params[:dob]

@m.save
redirect_to profile_path(current_user.id)

    end

    
  end






