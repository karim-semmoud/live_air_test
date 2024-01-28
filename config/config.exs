# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :live_air,
  ecto_repos: [LiveAir.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :live_air, LiveAirWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [html: LiveAirWeb.ErrorHTML, json: LiveAirWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: LiveAir.PubSub,
  live_view: [signing_salt: "H9lVlVxM"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :live_air, LiveAir.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.3.2",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# config :tails, colors_file: Path.expand(__ENV__.file <> "/../../assets/colors.json")
# config :tails, colors_file: Path.expand("../deps/moon/config/surface.exs")

# config :surface, :components, [
#   {Surface.Components.Form.ErrorTag,
#    default_translator: {MoonWeb.ErrorHelpers, :translate_error}},
#   # lib part
#   {Moon.Components.Field, propagate_context_to_slots: true},
#   {Moon.Components.Form, propagate_context_to_slots: true},
#   {Moon.Components.Select.Dropdown, propagate_context_to_slots: true},
#   {Moon.Components.TextInput, propagate_context_to_slots: true},
#   {Moon.Design.Accordion, propagate_context_to_slots: true},
#   {Moon.Design.Accordion.Item, propagate_context_to_slots: true},
#   {Moon.Design.Avatar, propagate_context_to_slots: true},
#   {Moon.Design.BottomSheet, propagate_context_to_slots: true},
#   {Moon.Design.Breadcrumb, propagate_context_to_slots: true},
#   {Moon.Design.Breadcrumb.Collapsed, propagate_context_to_slots: true},
#   {Moon.Design.Breadcrumb.CollapsedItems, propagate_context_to_slots: true},
#   {Moon.Design.Breadcrumb.Extended, propagate_context_to_slots: true},
#   {Moon.Design.Breadcrumb.Item, propagate_context_to_slots: true},
#   {Moon.Design.Carousel, propagate_context_to_slots: true},
#   {Moon.Design.Carousel.Reel, propagate_context_to_slots: true},
#   {Moon.Design.Drawer, propagate_context_to_slots: true},
#   {Moon.Design.Dropdown, propagate_context_to_slots: true},
#   {Moon.Design.Dropdown.BottomOptions, propagate_context_to_slots: true},
#   {Moon.Design.Dropdown.Options, propagate_context_to_slots: true},
#   {Moon.Design.Form, propagate_context_to_slots: true},
#   {Moon.Design.Form.AuthCode, propagate_context_to_slots: true},
#   {Moon.Design.Form.Combobox, propagate_context_to_slots: true},
#   {Moon.Design.Form.Dropdown, propagate_context_to_slots: true},
#   {Moon.Design.Form.Field, propagate_context_to_slots: true},
#   {Moon.Design.Form.Field.Field, propagate_context_to_slots: true},
#   {Moon.Design.Form.Group, propagate_context_to_slots: true},
#   {Moon.Design.Form.InsetField, propagate_context_to_slots: true},
#   {Moon.Design.Form.Radio, propagate_context_to_slots: true},
#   {Moon.Design.Form.Radio.Button, propagate_context_to_slots: true},
#   {Moon.Design.MenuItem, propagate_context_to_slots: true},
#   {Moon.Design.Modal, propagate_context_to_slots: true},
#   {Moon.Design.Modal.Panel, propagate_context_to_slots: true},
#   {Moon.Design.Pagination, propagate_context_to_slots: true},
#   {Moon.Design.Progress, propagate_context_to_slots: true},
#   {Moon.Design.Search, propagate_context_to_slots: true},
#   {Moon.Design.Snackbar, propagate_context_to_slots: true},
#   {Moon.Design.Snackbar.Close, propagate_context_to_slots: true},
#   {Moon.Design.Tabs, propagate_context_to_slots: true},
#   {Moon.Design.Tabs.List, propagate_context_to_slots: true},
#   {Moon.Design.Tooltip.Content, propagate_context_to_slots: true},
#   # parts part
#   {Moon.Parts.Avatar, propagate_context_to_slots: true},
#   {Moon.Parts.Chart.Field, propagate_context_to_slots: true},
#   {Moon.Parts.Header, propagate_context_to_slots: true},
#   {Moon.Parts.Modal, propagate_context_to_slots: true},
#   {Moon.Parts.Wizard, propagate_context_to_slots: true},
#   {Moon.Parts.Sidebar, propagate_context_to_slots: true},
#   {Moon.Parts.Sidebar.Accordion, propagate_context_to_slots: true},
#   {Moon.Parts.Sidebar.MenuLink, propagate_context_to_slots: true},
#   {Moon.Parts.Sidebar.Slim, propagate_context_to_slots: true},
#   {Moon.Parts.Sidebar.SlimMenuLink, propagate_context_to_slots: true},
#   {Moon.Parts.Sidebar.Wide, propagate_context_to_slots: true},
#   # app part
#   {MoonWeb.Components.ExampleAndCode, propagate_context_to_slots: true},
#   {MoonWeb.Components.SidebarLink, propagate_context_to_slots: false}
# ]

# config :tails, colors_file: Path.expand(__ENV__.file <> "/../../assets/colors.json")

# config :tails,
#   variants:
#     ~w(moon-checked moon-selected moon-active moon-disabled moon-not-checked moon-not-selected moon-not-active moon-not-disabled moon-open moon-error not-last not-first empty)


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
