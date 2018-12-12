class OpinionsController < ApplicationController

  def new
    # Url pour l'envoi de l'opinion vers le MJ
    # /opinions?game_session=Title&MJ=false&sender=PseudoUser

    # Url pour l'envoi de l'opinion vers les joueurs
    # /opinions?game_session=Title&MJ=true&sender=PseudoUser


    @params = params
  end

  def create

    if params[:MJ] === "false"
      game_session = GameSession.find_by(title: params[:game_session])
      sender = game_session.users.find_by(pseudo: params[:sender])
      recipient = game_session.roles.find_by(game_master: "true").user
      UserMailer.players_to_gamemaster(sender, game_session, recipient, params[:opinion_text]).deliver_now!
      OpinionsController.save(params[:opinion_text], sender, recipient, game_session)
      redirect_to root_path, flash: { validates: "Email envoyé !" }
    elsif params[:MJ] === "true"
      game_session = GameSession.find_by(title: params[:game_session])
      sender = game_session.roles.find_by(game_master: "true").user
      recipients = game_session.roles.where(game_master: "f")
      recipients.length.times do |i|
        UserMailer.players_to_gamemaster(sender, game_session, recipients[i].user, params[:opinion_text]).deliver_now!
        OpinionsController.save(params[:opinion_text], sender, recipient[i].user, game_session)
      end
      redirect_to root_path, flash: { validates: "Email envoyé !" }
    else
      redirect_to opinions_path, flash { error: "Petit Malin !" }
    end

  end

  def self.save(content, sender, recipient, game_session)
    opinion = Opinion.new
    opinion.content = content
    opinion.sender = sender
    opinion.recipient = recipient
    opinion.game_session = game_session
    opinion.save
  end

end
