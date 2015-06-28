var conf = {};

conf.user = "nobody";
conf.group = "nogroup";

conf.log = "kiwi.log";

conf.servers = [];
conf.servers.push({
    port:   7778,
    address: "0.0.0.0"
});


conf.public_http = "client/";
conf.max_client_conns = 50;
conf.max_server_conns = 0;

conf.default_encoding = 'utf8';

conf.client_plugins = [
    // "http://server.com/kiwi/plugins/myplugin.html"
];

conf.module_dir = "../server_modules/";
conf.modules = [];

// Some IRCDs require the clients IP via the username/ident
conf.ip_as_username = [
    //"irc.network.com",
    //"127.0.0.1"
];

conf.reject_unauthorised_certificates = false;

conf.http_proxies = ["127.0.0.1/32"];
conf.http_proxy_ip_header = "x-forwarded-for";

conf.http_base_path = "/kiwi";

conf.socks_proxy = {};
conf.socks_proxy.enabled = false;
conf.socks_proxy.all = false;
conf.socks_proxy.proxy_hosts = [
    "irc.example.com"
];
conf.socks_proxy.address = '127.0.0.1';
conf.socks_proxy.port = 1080;
conf.socks_proxy.user = null;
conf.socks_proxy.pass = null;


conf.quit_message = "http://www.kiwiirc.com/ - A hand-crafted IRC client";

conf.client = {
    server: 'irc.hackint.org',
    port:    6667,
    ssl:     false,
    channel: '#ffms',
    channel_key: '',
    nick:    'ffms_?',
    settings: {
        theme: 'relaxed',
        channel_list_style: 'tabs',
        scrollback: 250,
        show_joins_parts: true,
        show_timestamps: false,
        use_24_hour_timestamps: true,
        mute_sounds: false,
        show_emoticons: true,
        count_all_activity: true
    },
    window_title: 'Freifunk Münster Chat'
};

// List of themes available for the user to choose from
conf.client_themes = [
    'relaxed',
    'mini',
    'cli',
    'basic'
];


// If set, the client may only connect to this 1 IRC server
//conf.restrict_server = "irc.hackint.org";
//conf.restrict_server_port = 9999;
//conf.restrict_server_ssl = true;
conf.restrict_server_channel = "#ffms";
//conf.restrict_server_channel_key = "";
//conf.restrict_server_password = "";
//conf.restrict_server_nick = "kiwi_";




/*
 * Do not amend the below lines unless you understand the changes!
 */
module.exports.production = conf;

