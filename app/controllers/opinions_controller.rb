class OpinionsController < ApplicationController

  def new
    # Url pour l'envoi de l'opinion vers le MJ
    # /opinions?game_session=Title&MJ=false&sender=PseudoUser

    # Url pour l'envoi de l'opinion vers les joueurs
    # /opinions?game_session=Title&MJ=true&sender=PseudoUser
    if params[:game_session] && params[:sender] && params[:MJ]
      if GameSession.find_by(title: params[:game_session])
        game_session = GameSession.find_by(title: params[:game_session])
      else
        redirect_to root_path, flash: { error: "Petit Malin !" }
      end

      unless game_session.users.find_by(pseudo: params[:sender])
        if params[:MJ] != "false" || params[:MJ] != "true"
          redirect_to root_path, flash: { error: "Petit Malin !" }
        end
      end

      @opinion = Opinion.new
      @params = params

    else

      redirect_to root_path

    end
  end

  def create

    if params[:MJ] === "false"
      game_session = GameSession.find_by(title: params[:game_session])
      sender = game_session.users.find_by(pseudo: params[:sender])
      recipient = game_session.roles.find_by(game_master: "true").user
      UserMailer.player_to_gamemaster(sender, game_session, recipient, params[:opinion_text]).deliver_now!
      Opinion.new(content: params[:opinion_text], sender: sender, recipient: recipient, game_session: game_session).save
      redirect_to root_path, flash: { validates: "Votre avis a été envoyé !" }
    elsif params[:MJ] === "true"
      game_session = GameSession.find_by(title: params[:game_session])
      sender = game_session.roles.find_by(game_master: "true").user
      recipients = game_session.roles.where(game_master: "f")
      recipients.length.times do |i|
        UserMailer.gamemaster_to_players(sender, game_session, recipients[i].user, params[:opinion_text]).deliver_now!
        Opinion.new(content: params[:opinion_text], sender: sender, recipient: recipients[i].user, game_session: game_session).save
      end
      redirect_to root_path, flash: { validates: "Votre avis a été envoyé !" }
    else
      redirect_to root_path, flash: { error: "Petit Malin !" }
    end

  end

end
