function matlab_example_simple()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletSolidStateRelay;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change to your UID

    ipcon = IPConnection(); % Create IP connection
    ssr = BrickletSolidStateRelay(UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Turn relay on/off 10 times with 1 second delay
    for i = 0:4
        pause(1);
        ssr.setState(true);
        pause(1);
        ssr.setState(false);
    end
    input('Press key to exit\n', 's');
    ipcon.disconnect();
end
