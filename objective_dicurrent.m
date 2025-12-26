function obj = objective_dicurrent(x)
mdl = 'SPM_TEST';
mws = get_param(mdl,'ModelWorkspace');

mws.assignin('I1', x(1));
mws.assignin('I2', x(2));

simOut = sim(mdl,'FastRestart','on','StopTime','inf');

SOC_sig = simOut.logsout.get('SOC').Values;
SOC = SOC_sig.Data;
t   = SOC_sig.Time;

idx = find(SOC >= 0.9, 1, 'first');

if isempty(idx)
    obj = 1e6;
else
    obj = t(idx);
end
end
