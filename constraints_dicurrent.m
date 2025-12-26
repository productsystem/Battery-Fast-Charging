function [c, ceq] = constraints_dicurrent(x)

mdl = 'SPM_TEST';
mws = get_param(mdl,'ModelWorkspace');

mws.assignin('I1', x(1));
mws.assignin('I2', x(2));

try
    simOut = sim(mdl,'FastRestart','on','StopTime','inf');
catch
    simOut = sim(mdl,'FastRestart','on','StopTime','inf');
end

V   = simOut.logsout.get('Voltage').Values.Data;
T   = simOut.logsout.get('Temperature').Values.Data;
ths = simOut.logsout.get('AnodeSurfaceStoich').Values.Data;

c_voltage = max(V - 3.4);
c_temp    = max(T - 313);
c_plate   = max(ths - 0.95);

c = [
    c_voltage
    c_temp
    c_plate
];

ceq = [];
end
