i2pd:
  i2pd_conf:
    main:
      bandwidth: 'O'
      share: '90'
    http:
      address: '192.168.1.110'
      port: '7070'
      auth: 'false'

    httpproxy:
      address: '192.168.1.110'
      port: '4444'

    socksproxy:
      address: '192.168.1.110'
      port: '4447'

  tunnels:
    'MyCustomTunnel':
      type: 'client'
      address: '127.0.0.1'
      port: '6668'
      destination: 'my.i2p'
      destinationport: '6667'
      keys: 'irc-keys.dat'
