class UserMailer < ApplicationMailer

def end_day(recipient, game_session)

  @user = recipient
  @game_session = game_session

  mail(
    to: @user.email,
    subject: "Avis sur votre session de jeu #{@game_session.title}"
  )

end

def players_to_gamemaster(sender, game_session, recipient, opinion)

  @player = sender
  @session = game_session
  @game_master = recipient
  @opinion = opinion

  mail(
    to: @game_master.email,
    subject: "#{@session.title} : Avis de #{@player.pseudo}"
  )

end

def gamemaster_to_players(sender, game_session, recipient, opinion)

  @game_master = sender
  @session = game_session
  @player = recipient
  @opinion = opinion

  mail(
    to: @player.email,
    subject: "#{@session.title} : Avis de votre Maitre du Jeu #{@game_master.pseudo}"
  )

end

end
