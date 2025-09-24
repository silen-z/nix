{ config, ... }:
{
  staticConfigOptions = {
    api.dashboard = true;
    #api.insecure = true;

    entryPoints = {
      web = {
        address = ":80";
        asDefault = true;
      };

      websecure = {
        address = ":443";
        asDefault = true;
        http.redirections.entrypoint = {
          to = "web";
          scheme = "http";
        };
        http.tls = { };
      };
    };

    log = {
      level = "INFO";
      filePath = "${config.services.traefik.dataDir}/traefik.log";
      format = "json";
    };

    # accessLog = {
    #    filePath = "${config.services.traefik.dataDir}/access.log";
    #    format = "json"; # or "common"
    #    bufferingSize = 100; # optional, helps performance
    #  };
  };

  dynamicConfigOptions = {
    http.routers.dashboardApi = {
      rule = "Host(`traefik.localhost`) && PathPrefix(`/api`)";
      service = "api@internal";

    };

    http.routers.dashboardUi = {
      rule = "Host(`traefik.localhost`)";
      service = "dashboard@internal";

    };

    http.routers.moderntv = {
      rule = "Host(`moderntv.localhost`)";
      service = "moderntv";
    };

    http.services.moderntv = {
      loadBalancer.servers = [ { url = "http://localhost:8080"; } ];
    };

    http.routers.mui = {
      rule = "Host(`mui.localhost`)";
      service = "mui";
    };

    http.services.mui = {
      loadBalancer.servers = [ { url = "http://localhost:8090"; } ];
    };
  };
}
