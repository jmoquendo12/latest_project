class InvitesController < ApplicationController
  before_action :authenticate_user!
  before_action :create_qr_code
  before_action :invite_url

  require "rqrcode"

  def index; end

  def invite_url
    @qrcode = "#{request.base_url}/users/sign_up?promoter=#{current_user.email}"
  end

  def create_qr_code
    qrcode = RQRCode::QRCode.new(invite_url)
    @svg = qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true
    )
  end
end
