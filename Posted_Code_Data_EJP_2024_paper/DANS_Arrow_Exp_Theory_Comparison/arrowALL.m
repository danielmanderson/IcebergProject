arrow
%%[denvec,thetavec] = makethetaplot(xvalues,yvalues);  % runs with default settings for NumR and Numtheta

[denvec,thetavec] = makethetaplot(xvalues,yvalues,1000,200);  % changes NumR,Numtheta

figure(99); hold on;

plot(denvec,(mod(thetavec+180,360)-180)/180*pi,'.')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% for 'final' plots run first with 
%      which_R_switch = 2;
%      [denvec,thetavec] = makethetaplot ...
%      plot(denvec, ...)                        NOT COMMENTED OUT
% ... this case plots theta vs. Robserved
%
%
% then run with
%      which_R_switch = 3;
%      %%[denvec,thetavec] = makethetaplot ...
%      %%plot(denvec, ...)                      BOTH COMMENTED OUT
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for new versions of final plots
%
%     ** run first with which_R_switch = 12; (gives theta vs. R observed) open symbols
%                    plot_rho_vs_rho = 10;
%      [denvec,thetavec] = makethetaplot(xvalues,yvalues,1000,200);  % changes NumR,Numtheta
%
%      plot(denvec,(mod(thetavec+180,360)-180)/180*pi,'.')    NOT COMMENTED OUT
%
%     ** then run with which_R_switch = 13; (gives theta vs. R theory) open symbols
%                      plot_rho_vs_rho = 0;  
%      [denvec,thetavec] = makethetaplot(xvalues,yvalues,1000,200);  % changes NumR,Numtheta
%
%      plot(denvec,(mod(thetavec+180,360)-180)/180*pi,'.')    NOT COMMENTED OUT
%
% (DMA, 9-15-2023, 9-16-2023, 9-30-2023, 11-4-2023)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Above is code that generates and plots the theoretical prediction for the
% stable orientations versus theta in [-pi,pi] for density ratio R.
%
% Below are measurements of the angles (and in some cases observed
% 'effective' density ratios from experiments in various single and
% two-fluid systems.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% For each date listed (corresponding to a day we did experiments) the
% following section has:
%
% - Angle measurements from various 'grabit' calculations (on -pi to pi)
%
% - Theoretical density ratios ((i.e. from measurements and/or
% literature values for liquid densities)
%
% - Effective (observed) density ratios as determined by the ratio of
% observed submerged area to observed total area.  These areas are obtained
% by image analysis of grabit data using Matlab's polyarea to compute
% areas.
%
% Some theoretical density values not currently in use are:
%   DR64s = 0.659338846; 
%   DR65s = 0.551162853;
%   DR68s = 0.563913636; 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Set up some plotting options
%
%  - First note that
%
% type (in plotdots) or type1 (in plotdots2, plotdots3)
%
%water = 1        ... o [new o]
%oil = 2          ... + [new s]
%syrup = 3        ... * [new d]
%oil-water = 4    ... x [new ^]
%water-syrup = 5  ... v [new v]
%oil-syrup = 6    ... s [new h]
%oil-water = 7    ... p [new p] (fill oil last measurements, "FOL" stuff)
%
% type2 (in plotdots2, plotdots3)
%
%red = 1         ... r (Arrow 63)
%green = 2       ... g (Arrow 64)
%blue = 3        ... b (Arrow 65)
%magenta = 4     ... m (Arrow 68)
%cyan    = 5     ... c (Big Arrow A)
%black   = 6     ... k (Big Arrow B)
%
% which_R_switch  = 0   % plot both R_theory and R_measured
%                 = 1   % plot R_theory only
%                 = 2   % plot R_measured (observed) only (same symbols as 3 below)
%                 = 3   % plot R_theory only (modified symbol format)
%                 = 4   % example case with R_theory and R_measured for 
%                 = 12  % plot R_observed (new, open symbols) ... updated 2
%                 = 13  % plot R_theory (new, closed symbols) ... updated 3
%
% plot_rho_vs_rho = 0  % no rho(observed vs. rho plot
%                 = 1  % plot rho(observed) vs. rho
%                      % this option needs which_R_switch == 0 or 2 or 12
%                 = 10 % plot rho(observed) vs. rho (new, open symbols)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
which_R_switch = 13;
plot_rho_vs_rho = 0;  % must be 0 unless which_R_switch = 0,2, or 12
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
%JANUARY 12 2023
angle63os = [ 1.6633530e-02  2.0648212e+00  -1.9719633e+00];                                 % Evelyn's grabit numbers
angle63os_dan = [2.9437323570277618e-02  2.1547298749564483e+00  -1.9917097729862734e+00];   % Dan's grabit numbers
angle63os_ave = (angle63os + angle63os_dan)/2;                                               % Average
%angle63ow = [ -5.0289536e-01   1.4050183e-01   1.9635871e+00  -1.9752217e+00];   % not plotting this one ... we've revisited this case several times below 
angle63s = [9.5530644e-01    2.4717994e+00 -2.4845549e+00 -9.7833311e-01];                                         % Evelyn's grabit numbers
angle63s_dan = [9.5305642698550797e-01  2.4498736938618126e+00  -2.4897668036298626e+00 -9.7073226271806412e-01];  % Dan's grabit numbers
angle63s_ave = (angle63s + angle63s_dan)/2;                                                                        % Average
angle63w = [1.0578685e+00   3.1289606e+00   -1.0902100e+00];                               % Evelyn's grabit numbers
angle63w_dan = [1.0676472737668641e+00  3.1097193899427031e+00  -1.0779636290293180e+00];  % Dan's grabit numbers
angle63w_ave = (angle63w + angle63w_dan)/2;                                                % Average
%
% theoretical density ratios
%
DR63os = 0.198476263;
DR63ow = 0.680114364;
DR63s = 0.689090672;
DR63w = 0.945514403;
%%%%%%%%%%%
%%%%%%%%%%% plotting
%%%%%%%%%%%
%
if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
   plotdots(DR63os,angle63os_ave,6);
   %plotdots(DR63ow,angle63ow,4);  % not plotting this one ... we've revisited this case several times below
   plotdots(DR63s,angle63s,3);
   plotdots(DR63w,angle63w_ave,1);
end
%
if which_R_switch == 3          % plotting R from theory (modified symbols)
   plotdots2(DR63os,angle63os_ave,6,1);
   %plotdots(DR63ow,angle63ow,4);  % not plotting this one ... we've revisited this case several times below
   plotdots2(DR63s,angle63s,3,1);
   plotdots2(DR63w,angle63w_ave,1,1);
end
%
if which_R_switch == 13          % plotting R from theory (modified symbols)
   plotdots3(DR63os,angle63os_ave,6,1);
   %plotdots(DR63ow,angle63ow,4);  % not plotting this one ... we've revisited this case several times below
   plotdots3(DR63s,angle63s,3,1);
   plotdots3(DR63w,angle63w_ave,1,1);
end
%
if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
   DRvec63_os_eff = [9.3280418543533111e-02   1.3310711084360505e-01   1.2811615207095325e-01];
   plot(DRvec63_os_eff,angle63os_ave,'rs','MarkerSize',10,'LineWidth',3)
   %
   DRvec63_s_eff = [6.7165003126078160e-01   7.1204283573107530e-01   6.9013409655441693e-01   6.7588927671503818e-01];
   plot(DRvec63_s_eff,angle63s_ave,'r*','MarkerSize',10,'LineWidth',3)
   %
   DRvec63_w_eff = [9.5842145542579937e-01  9.6710016514414865e-01  9.6452821435984060e-01];
   plot(DRvec63_w_eff,angle63w_ave,'ro','MarkerSize',10,'LineWidth',3)
end
%
if which_R_switch == 12  % plotting (observed, effective, density obtained from grabit images)
   DRvec63_os_eff = [9.3280418543533111e-02   1.3310711084360505e-01   1.2811615207095325e-01];
   plot(DRvec63_os_eff,angle63os_ave,'rh','MarkerSize',10,'LineWidth',3)
   %
   DRvec63_s_eff = [6.7165003126078160e-01   7.1204283573107530e-01   6.9013409655441693e-01   6.7588927671503818e-01];
   plot(DRvec63_s_eff,angle63s_ave,'rd','MarkerSize',10,'LineWidth',3)
   %
   DRvec63_w_eff = [9.5842145542579937e-01  9.6710016514414865e-01  9.6452821435984060e-01];
   plot(DRvec63_w_eff,angle63w_ave,'ro','MarkerSize',10,'LineWidth',3)
end
%%%%%%%%%%%
%%%%%%%%%%%
%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
%MARCH 24 2023
angle63wb = [-1.0958828e+00   1.0718242e+00   3.0657187e+00];                                % Evelyn's grabit numbers
angle63wc = [-1.0821154827606652e+00,   1.0656874824448097e+00,   3.0813968630004123e+00];   % Dan's grabit numbers
angle63w_bc_ave = (angle63wb+angle63wc)/2;                                                   % averaged version
angle64w = [-1.0709480288288988e+00,   1.0596464621503090e+00,  -3.1356862301686972e+00];
angle65w = [-9.9494522938081253e-01,   9.9742491977808823e-01,  2.7105403586736392e+00,  -2.7514898190925896e+00,   3.1371980895772049e+00,   2.6838193608250318e+00,  -2.6702787457324275e+00];
angle68w = [-9.9544461779119153e-01,   1.0026809055380981e+00,  2.7260948871050981e+00,  -2.9942323541884917e+00,  2.7144902157805428e+00,   3.0998178680597546e+00,  -2.9213608665894268e+00];
% comment on angle65w,angle68w ... these have more observed stable
% orientations (7) than predicted theoretically (4)
%
% theoretical density ratios (note some already defined)
%
DR64w = 0.909054821;
DR65w = 0.759908584;
DR68w = 0.777488559;
%%%%%%%%%%%
%%%%%%%%%%% plotting
%%%%%%%%%%%
%
if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
   %%plotdots(DR63w,angle63wb,1);      % Evelyn's grabit numbers
   %%plotdots(DR63w,angle63wc,1);       % Dan's grabit numbers
   plotdots(DR63w,angle63w_bc_ave,1);   % plotting averaged values
   plotdots(DR64w,angle64w,1);
   plotdots(DR65w,angle65w,1);
   plotdots(DR68w,angle68w,1);
end
%
if which_R_switch == 3    % plotting R from theory (modified symbols)
   %%plotdots(DR63w,angle63wb,1);      % Evelyn's grabit numbers
   %%plotdots(DR63w,angle63wc,1);       % Dan's grabit numbers
   plotdots2(DR63w,angle63w_bc_ave,1,1);   % plotting averaged values
   plotdots2(DR64w,angle64w,1,2);
   plotdots2(DR65w,angle65w,1,3);
   plotdots2(DR68w,angle68w,1,4);
end
%
if which_R_switch == 13    % plotting R from theory (modified symbols)
   %%plotdots(DR63w,angle63wb,1);      % Evelyn's grabit numbers
   %%plotdots(DR63w,angle63wc,1);       % Dan's grabit numbers
   plotdots3(DR63w,angle63w_bc_ave,1,1);   % plotting averaged values
   plotdots3(DR64w,angle64w,1,2);
   plotdots3(DR65w,angle65w,1,3);
   plotdots3(DR68w,angle68w,1,4);
end
%
if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
   DRvec63_w_bc_eff = [9.6206889934116102e-01 9.2350853083881956e-01 9.4233405269522130e-01];
   plot(DRvec63_w_bc_eff,angle63w_bc_ave,'ro','MarkerSize',10,'LineWidth',3)
   %
   DRvec64_w_eff = [8.8830677838320315e-01  9.0826344051492280e-01 9.2019237078265492e-01];
   plot(DRvec64_w_eff,angle64w,'go','MarkerSize',10,'LineWidth',3)
   %
   DRvec65_w_eff = [7.8040406598126544e-01  7.7719161746524967e-01   7.5660254331592092e-01  7.5094490795041646e-01  7.6862872878602473e-01  7.6624706655486430e-01  7.6080786891370000e-01];
   plot(DRvec65_w_eff,angle65w,'bo','MarkerSize',10,'LineWidth',3)
   %
   DRvec68_w_eff = [7.5049995599090702e-01   7.9783344108471710e-01   7.7360604471392203e-01   7.8791898565553742e-01   7.8399317441496963e-01   7.8400701199529532e-01   8.1937745090213965e-01];
   plot(DRvec68_w_eff,angle68w,'mo','MarkerSize',10,'LineWidth',3)
   %
end
%
if which_R_switch == 12  % plotting (observed, effective, density obtained from grabit images)
   DRvec63_w_bc_eff = [9.6206889934116102e-01 9.2350853083881956e-01 9.4233405269522130e-01];
   plot(DRvec63_w_bc_eff,angle63w_bc_ave,'ro','MarkerSize',10,'LineWidth',3)
   %
   DRvec64_w_eff = [8.8830677838320315e-01  9.0826344051492280e-01 9.2019237078265492e-01];
   plot(DRvec64_w_eff,angle64w,'go','MarkerSize',10,'LineWidth',3)
   %
   DRvec65_w_eff = [7.8040406598126544e-01  7.7719161746524967e-01   7.5660254331592092e-01  7.5094490795041646e-01  7.6862872878602473e-01  7.6624706655486430e-01  7.6080786891370000e-01];
   plot(DRvec65_w_eff,angle65w,'bo','MarkerSize',10,'LineWidth',3)
   %
   DRvec68_w_eff = [7.5049995599090702e-01   7.9783344108471710e-01   7.7360604471392203e-01   7.8791898565553742e-01   7.8399317441496963e-01   7.8400701199529532e-01   8.1937745090213965e-01];
   plot(DRvec68_w_eff,angle68w,'mo','MarkerSize',10,'LineWidth',3)
   %
end
%%%%%%%%%%%
%%%%%%%%%%%
%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
%MARCH 30 2023
angle63owb =   [1.9074605e+00   4.7753009e-01  -4.6571170e-01];  % This one we forgot an orientation
angle64owa =  [2.7681664e-01            1.9446636e+00  			-1.9509973e+00  		 -3.8841122e-01];          % Evelyn's grabit numbers
angle64owb =  [2.8556065572288580e-01   1.9294757248109022e+00  -1.9542594352986891e+00  -4.0681899930524423e-01]; % Dan's grabit numbers
angle64ow_ab_ave = (angle64owa + angle64owb)/2;                                                                    % Averaged 
angle68oa =  [9.9813749e-01  -3.0508749e+00  -1.0460165e+00];                            % Evelyn's grabit numbers
angle68ob = [1.0018861928999057e+00  -3.0464551993859166e+00  -1.0563265797056012e+00];  % Dan's grabit numbers
angle68o_ab_ave = (angle68oa + angle68ob)/2;                                             % Averaged
%
% theoretical density ratios (note some already defined)
%
DR64ow = 0.417287575;
DR68o = 0.921273727;
%%%%%%%%%%%
%%%%%%%%%%% plotting
%%%%%%%%%%%
%
if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
   %plotdots(DR63ow,angle63owb,4);       % Forgot to photograph one orientation ... repeat this experiment (see May 31, 2023)
   %plotdots(DR64ow,angle64owa,4);       % Evelyn's grabit numbers
   %plotdots(DR64ow,angle64owb,4);       % Dan's grabit numbers
   plotdots(DR64ow,angle64ow_ab_ave,4);  % averaged numbers
   %plotdots(DR68o,angle68oa,2);         % Evelyn's grabit numbers
   %plotdots(DR68o,angle68ob,2);         % Dan's grabit numbers
   plotdots(DR68o,angle68o_ab_ave,2);    % averaged numbers
end
%
if which_R_switch == 3    % plotting R from theory (modified symbols)
   %plotdots(DR63ow,angle63owb,4);       % Forgot to photograph one orientation ... repeat this experiment (see May 31, 2023)
   %plotdots(DR64ow,angle64owa,4);       % Evelyn's grabit numbers
   %plotdots(DR64ow,angle64owb,4);       % Dan's grabit numbers
   plotdots2(DR64ow,angle64ow_ab_ave,4,2);  % averaged numbers
   %plotdots(DR68o,angle68oa,2);         % Evelyn's grabit numbers
   %plotdots(DR68o,angle68ob,2);         % Dan's grabit numbers
   plotdots2(DR68o,angle68o_ab_ave,2,4);    % averaged numbers
end
%
if which_R_switch == 13    % plotting R from theory (modified symbols)
   %plotdots(DR63ow,angle63owb,4);       % Forgot to photograph one orientation ... repeat this experiment (see May 31, 2023)
   %plotdots(DR64ow,angle64owa,4);       % Evelyn's grabit numbers
   %plotdots(DR64ow,angle64owb,4);       % Dan's grabit numbers
   plotdots3(DR64ow,angle64ow_ab_ave,4,2);  % averaged numbers
   %plotdots(DR68o,angle68oa,2);         % Evelyn's grabit numbers
   %plotdots(DR68o,angle68ob,2);         % Dan's grabit numbers
   plotdots3(DR68o,angle68o_ab_ave,2,4);    % averaged numbers
end
%
if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
   DRvec64_ow_eff = [1.7108628396485970e-01  7.8128363798062983e-02  7.4373233830490618e-02  1.5503355077703945e-01];
   plot(DRvec64_ow_eff,angle64ow_ab_ave,'gx','MarkerSize',10,'LineWidth',3)
   %
   DRvec68_o_eff = [9.6739780787516449e-01  9.7054865997453965e-01  9.8412385606876818e-01];
   plot(DRvec68_o_eff,angle68o_ab_ave,'m+','MarkerSize',10,'LineWidth',3)
end
%
if which_R_switch == 12  % plotting (observed, effective, density obtained from grabit images)
   DRvec64_ow_eff = [1.7108628396485970e-01  7.8128363798062983e-02  7.4373233830490618e-02  1.5503355077703945e-01];
   plot(DRvec64_ow_eff,angle64ow_ab_ave,'g^','MarkerSize',10,'LineWidth',3)
   %
   DRvec68_o_eff = [9.6739780787516449e-01  9.7054865997453965e-01  9.8412385606876818e-01];
   plot(DRvec68_o_eff,angle68o_ab_ave,'ms','MarkerSize',10,'LineWidth',3)
end
%%%%%%%%%%%
%%%%%%%%%%%
%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
%MAY 31 2023
angle63owc = [5.3321171396680356e-01  1.9361671876007938e+00  -1.9490776603894595e+00  -5.3445834501277911e-01];
angle64owc = [1.0917575112784839e-01   1.9689785737902736e+00  -1.9766715106872486e+00  -3.4764479630522604e-01];
angle65o = [   1.0252854329271803e+00   3.1142962716078655e+00  -1.0463469733030930e+00];
%
% theoretical density ratios (note some already defined)
%
DR65o = 0.900442592; 
%%%%%%%%%%%
%%%%%%%%%%% plotting
%%%%%%%%%%%
%
if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
   plotdots(DR63ow,angle63owc,4);
   plotdots(DR64ow,angle64owc,4);
   plotdots(DR65o,angle65o,2);
end
%
if which_R_switch == 3    % plotting R from theory (modified symbols)
   plotdots2(DR63ow,angle63owc,4,1);
   plotdots2(DR64ow,angle64owc,4,2);
   plotdots2(DR65o,angle65o,2,3);
end
%
if which_R_switch == 13    % plotting R from theory (modified symbols)
   plotdots3(DR63ow,angle63owc,4,1);
   plotdots3(DR64ow,angle64owc,4,2);
   plotdots3(DR65o,angle65o,2,3);
end
%
if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
   DRvec63_ow_eff = [   2.9551372875975684e-01;1.9104339698222564e-01;1.8344074725222320e-01;3.3619555699821452e-01];
   plot(DRvec63_ow_eff,angle63owc,'rx','MarkerSize',10,'LineWidth',3) 
   %
   DRvec64_owc_eff = [   1.5626959672416382e-01 4.5855787391256043e-02  6.9460099373685816e-02  1.4404115445336876e-01];
   plot(DRvec64_ow_eff,angle64owc,'gx','MarkerSize',10,'LineWidth',3)
   %
   DRvec65_o_eff = [9.7966995791769629e-01   9.7445765496452663e-01  9.9642901707114662e-01];
   plot(DRvec65_o_eff,angle65o,'b+','MarkerSize',10,'LineWidth',3)
end 
%
if which_R_switch == 12  % plotting (observed, effective, density obtained from grabit images)
   DRvec63_ow_eff = [   2.9551372875975684e-01;1.9104339698222564e-01;1.8344074725222320e-01;3.3619555699821452e-01];
   plot(DRvec63_ow_eff,angle63owc,'r^','MarkerSize',10,'LineWidth',3) 
   %
   DRvec64_owc_eff = [   1.5626959672416382e-01 4.5855787391256043e-02  6.9460099373685816e-02  1.4404115445336876e-01];
   plot(DRvec64_ow_eff,angle64owc,'g^','MarkerSize',10,'LineWidth',3)
   %
   DRvec65_o_eff = [9.7966995791769629e-01   9.7445765496452663e-01  9.9642901707114662e-01];
   plot(DRvec65_o_eff,angle65o,'bs','MarkerSize',10,'LineWidth',3)
end 
%
if which_R_switch == 4  % special case
   plotdots2(DR63ow,angle63owc,4,1);
   DRvec63_ow_eff = [   2.9551372875975684e-01;1.9104339698222564e-01;1.8344074725222320e-01;3.3619555699821452e-01];
   plot(DRvec63_ow_eff,angle63owc,'r<','MarkerSize',10,'LineWidth',3) 
   plot([DRvec63_ow_eff(1) DR63ow],[angle63owc(1) angle63owc(1)],'r:','LineWidth',2)
   plot([DRvec63_ow_eff(2) DR63ow],[angle63owc(2) angle63owc(2)],'r:','LineWidth',2)
   plot([DRvec63_ow_eff(3) DR63ow],[angle63owc(3) angle63owc(3)],'r:','LineWidth',2)
   plot([DRvec63_ow_eff(4) DR63ow],[angle63owc(4) angle63owc(4)],'r:','LineWidth',2)
   %
%    plotdots2(DR64ow,angle64owc,4,4);
%    DRvec64_ow_eff = [   1.5626959672416382e-01 4.5855787391256043e-02  6.9460099373685816e-02  1.4404115445336876e-01];
%    plot(DRvec64_ow_eff,angle64owc,'mx','MarkerSize',10,'LineWidth',3)
%    plot([DRvec64_ow_eff(1) DR64ow],[angle64owc(1) angle64owc(1)],'k:','LineWidth',2)
%    plot([DRvec64_ow_eff(2) DR64ow],[angle64owc(2) angle64owc(2)],'k:','LineWidth',2)
%    plot([DRvec64_ow_eff(3) DR64ow],[angle64owc(3) angle64owc(3)],'k:','LineWidth',2)
%    plot([DRvec64_ow_eff(4) DR64ow],[angle64owc(4) angle64owc(4)],'k:','LineWidth',2)
end 
%%%%%%%%%%%
%%%%%%%%%%%
%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
%AUG 4 2023
angleBIG_ARROW_Aw = [   1.0816083769434370e+00  3.0575728840542546e+00  -1.1028763918804843e+00];
angleBIG_ARROW_Bw = [   1.0686363572895967e+00  3.0460861032367963e+00  -1.1046689813124333e+00];
%
% theoretical density ratios 
%
DR_BIG_Aw = 0.901;
DR_BIG_Bw = 0.895;
%%%%%%%%%%%
%%%%%%%%%%% plotting
%%%%%%%%%%%
%
if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
   plotdots(DR_BIG_Aw,angleBIG_ARROW_Aw,1);
   plotdots(DR_BIG_Bw,angleBIG_ARROW_Bw,1);
end
%
if which_R_switch == 3    % plotting R from theory (modified symbols)
   plotdots2(DR_BIG_Aw,angleBIG_ARROW_Aw,1,5);
   plotdots2(DR_BIG_Bw,angleBIG_ARROW_Bw,1,5);
end
%
if which_R_switch == 13    % plotting R from theory (modified symbols)
   plotdots3(DR_BIG_Aw,angleBIG_ARROW_Aw,1,5);
   plotdots3(DR_BIG_Bw,angleBIG_ARROW_Bw,1,6);
end
%
if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
   DRvec_BigA_w_eff  = [8.4699011883207376e-01  8.7436280190674209e-01 8.5560302452261461e-01];
   plot(DRvec_BigA_w_eff,angleBIG_ARROW_Aw,'co','MarkerSize',10,'LineWidth',3)
   %
   DRvec_BigB_w_eff = [8.2355047982964746e-01  8.7068766352278670e-01  8.5125427889796301e-01];
   plot(DRvec_BigB_w_eff,angleBIG_ARROW_Bw,'ko','MarkerSize',10,'LineWidth',3)
end
%
if which_R_switch == 12  % plotting (observed, effective, density obtained from grabit images)
   DRvec_BigA_w_eff  = [8.4699011883207376e-01  8.7436280190674209e-01 8.5560302452261461e-01];
   plot(DRvec_BigA_w_eff,angleBIG_ARROW_Aw,'co','MarkerSize',10,'LineWidth',3)
   %
   DRvec_BigB_w_eff = [8.2355047982964746e-01  8.7068766352278670e-01  8.5125427889796301e-01];
   plot(DRvec_BigB_w_eff,angleBIG_ARROW_Bw,'ko','MarkerSize',10,'LineWidth',3)
end
%%%%%%%%%%%
%%%%%%%%%%%
%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
%SEPT 1 2023
angleBIG_ARROW_Aow_1 = [1.3375140728720147e-01  2.0401628741552518e+00  -2.0508589794314176e+00];
angleBIG_ARROW_Bow_1 = [1.7369308737647793e-01  1.9943463887828914e+00  -2.0482201197724130e+00];
%
% theoretical density ratios 
%
DR_BIG_Aow = 0.375;
DR_BIG_Bow = 0.375;
%%%%%%%%%%%
%%%%%%%%%%% plotting
%%%%%%%%%%%
%
if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
   plotdots(DR_BIG_Aow,angleBIG_ARROW_Aow_1,4);
   plotdots(DR_BIG_Bow,angleBIG_ARROW_Bow_1,4);
end
%
if which_R_switch == 3    % plotting R from theory (modified points)
   plotdots2(DR_BIG_Aow,angleBIG_ARROW_Aow_1,4,5);
   plotdots2(DR_BIG_Bow,angleBIG_ARROW_Bow_1,4,6);
end
%
if which_R_switch == 13    % plotting R from theory (modified points)
   plotdots3(DR_BIG_Aow,angleBIG_ARROW_Aow_1,4,5);
   plotdots3(DR_BIG_Bow,angleBIG_ARROW_Bow_1,4,6);
end
%
if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
   DRvec_BigA_ow_eff = [2.1563961527538941e-01  1.5537169180711244e-01  1.9038637032472538e-01];
   plot(DRvec_BigA_ow_eff,angleBIG_ARROW_Aow_1,'cx','MarkerSize',10,'LineWidth',3)
   %
   DRvec_BigB_ow_eff = [1.8242586959550225e-01  1.3976840856337963e-01  1.6894379804785833e-01];
   plot(DRvec_BigB_ow_eff,angleBIG_ARROW_Bow_1,'kx','MarkerSize',10,'LineWidth',3)
end
%
if which_R_switch == 12  % plotting (observed, effective, density obtained from grabit images)
   DRvec_BigA_ow_eff = [2.1563961527538941e-01  1.5537169180711244e-01  1.9038637032472538e-01];
   plot(DRvec_BigA_ow_eff,angleBIG_ARROW_Aow_1,'c^','MarkerSize',10,'LineWidth',3)
   %
   DRvec_BigB_ow_eff = [1.8242586959550225e-01  1.3976840856337963e-01  1.6894379804785833e-01];
   plot(DRvec_BigB_ow_eff,angleBIG_ARROW_Bow_1,'k^','MarkerSize',10,'LineWidth',3)
end
%
if which_R_switch == 4  % special case
   plotdots2(DR_BIG_Aow,angleBIG_ARROW_Aow_1,4,5);
   DRvec_BigA_ow_eff = [2.1563961527538941e-01  1.5537169180711244e-01  1.9038637032472538e-01];
   plot(DRvec_BigA_ow_eff,angleBIG_ARROW_Aow_1,'c<','MarkerSize',10,'LineWidth',3)
   plot([DRvec_BigA_ow_eff(1) DR_BIG_Aow],[angleBIG_ARROW_Aow_1(1) angleBIG_ARROW_Aow_1(1)],'c:','LineWidth',2)
   plot([DRvec_BigA_ow_eff(2) DR_BIG_Aow],[angleBIG_ARROW_Aow_1(2) angleBIG_ARROW_Aow_1(2)],'c:','LineWidth',2)
   plot([DRvec_BigA_ow_eff(3) DR_BIG_Aow],[angleBIG_ARROW_Aow_1(3) angleBIG_ARROW_Aow_1(3)],'c:','LineWidth',2)
end 
%%%%%%%%%%%
%%%%%%%%%%%
%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
%SEPT 29 2023
angle63ow_fol = [   6.9052044860508499e-01;7.0162288645432991e-01;7.0956481351655754e-01];
%
% theoretical density ratios (already defined)
%
%%%%%%%%%%%
%%%%%%%%%%% plotting
%%%%%%%%%%%
%
if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
   plotdots(DR63ow,angle63ow_fol,7);
end
%
if which_R_switch == 3    % plotting R from theory (modified symbols)
   plotdots2(DR63ow,angle63ow_fol,7,1);
end
%
if which_R_switch == 13    % plotting R from theory (modified symbols)
   plotdots3(DR63ow,angle63ow_fol,7,1);
end
%
if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
   DRvec63_ow_eff_fol = [3.9281533255888346e-01;4.0705668553471236e-01;4.2824599678655861e-01];
   plot(DRvec63_ow_eff_fol,angle63ow_fol,'rp','MarkerSize',10,'LineWidth',3) 
   %
end 
%
if which_R_switch == 12  % plotting (observed, effective, density obtained from grabit images)
   DRvec63_ow_eff_fol = [3.9281533255888346e-01;4.0705668553471236e-01;4.2824599678655861e-01];
   plot(DRvec63_ow_eff_fol,angle63ow_fol,'rp','MarkerSize',10,'LineWidth',3) 
   %
end 
%
if which_R_switch == 4  % special case
   plotdots2(DR63ow,angle63ow_fol,7,1);
   DRvec63_ow_eff_fol = [3.9281533255888346e-01;4.0705668553471236e-01;4.2824599678655861e-01];
   plot(DRvec63_ow_eff_fol,angle63ow_fol,'rp','MarkerSize',10,'LineWidth',3) 
   plot([DRvec63_ow_eff_fol(1) DR63ow],[angle63ow_fol(1) angle63ow_fol(1)],'r:','LineWidth',2)
   plot([DRvec63_ow_eff_fol(2) DR63ow],[angle63ow_fol(2) angle63ow_fol(2)],'r:','LineWidth',2)
   plot([DRvec63_ow_eff_fol(3) DR63ow],[angle63ow_fol(3) angle63ow_fol(3)],'r:','LineWidth',2)
end 
%%%%%%%%%%%
%%%%%%%%%%%
%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axis([0 1 -pi pi])
if which_R_switch == 0 || which_R_switch == 4
   ax = gca;
   ax.FontSize = 18;
   xlabel('R (theory and observed)','FontSize',24)
   ylabel('\theta','FontSize',24)
elseif which_R_switch == 1 || which_R_switch == 3
   ax = gca;
   ax.FontSize = 18;
%   xlabel('R (theory)','FontSize',24)
   xlabel('R','FontSize',24)
   ylabel('\theta','FontSize',24)
elseif which_R_switch == 2
   ax = gca;
   ax.FontSize = 18;
%   xlabel('R (observed)','FontSize',24)
   xlabel('R','FontSize',24)
   ylabel('\theta','FontSize',24)
elseif which_R_switch == 12
   ax = gca;
   ax.FontSize = 18;
   xlabel('R (observed)','FontSize',24)
   ylabel('\theta','FontSize',24)
elseif which_R_switch == 13
   ax = gca;
   ax.FontSize = 18;
   xlabel('R','FontSize',24)
   ylabel('\theta','FontSize',24)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% plot rho_eff vs. rho
%
if plot_rho_vs_rho == 1
   figure(88);
   % JAN 12, 2023
   plot(DR63os*ones(size(DRvec63_os_eff)),DRvec63_os_eff,'rs','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR63s*ones(size(DRvec63_s_eff)),DRvec63_s_eff,'r*','MarkerSize',10,'LineWidth',2);
   plot(DR63w*ones(size(DRvec63_w_eff)),DRvec63_w_eff,'ro','MarkerSize',10,'LineWidth',2);
   % MARCH 24, 2023
   plot(DR63w*ones(size(DRvec63_w_bc_eff)),DRvec63_w_bc_eff,'ro','MarkerSize',10,'LineWidth',3);hold on;
   plot(DR64w*ones(size(DRvec64_w_eff)),DRvec64_w_eff,'go','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR65w*ones(size(DRvec65_w_eff)),DRvec65_w_eff,'bo','MarkerSize',10,'LineWidth',2);
   plot(DR68w*ones(size(DRvec68_w_eff)),DRvec68_w_eff,'mo','MarkerSize',10,'LineWidth',2);
   % MARCH 30, 2023
   plot(DR64ow*ones(size(DRvec64_ow_eff)),DRvec64_ow_eff,'gx','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR68o*ones(size(DRvec68_o_eff)),DRvec68_o_eff,'m+','MarkerSize',10,'LineWidth',2);hold on;
   % MAY 31, 2023
   plot(DR63ow*ones(size(DRvec63_ow_eff)),DRvec63_ow_eff,'rx','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR64ow*ones(size(DRvec64_owc_eff)),DRvec64_owc_eff,'gx','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR65o*ones(size(DRvec65_o_eff)),DRvec65_o_eff,'b+','MarkerSize',10,'LineWidth',2);hold on;
   % AUG 4, 2023
   plot(DR_BIG_Aw*ones(size(DRvec_BigA_w_eff)),DRvec_BigA_w_eff,'co','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR_BIG_Bw*ones(size(DRvec_BigB_w_eff)),DRvec_BigB_w_eff,'ko','MarkerSize',10,'LineWidth',2);hold on;
   % SEPT 1, 2023
   plot(DR_BIG_Aow*ones(size(DRvec_BigA_ow_eff)),DRvec_BigA_ow_eff,'cx','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR_BIG_Bow*ones(size(DRvec_BigB_ow_eff)),DRvec_BigB_ow_eff,'kx','MarkerSize',10,'LineWidth',2);hold on;
   % SEPT 30, 2023
   plot(DR63ow*ones(size(DRvec63_ow_eff_fol)),DRvec63_ow_eff_fol,'rp','MarkerSize',10,'LineWidth',2);hold on;
   % plot specs
   plot([0 1],[0 1],'k--','LineWidth',2);hold on;
   ax = gca;
   ax.FontSize = 18;
   xlabel('R','FontSize',24)
   ylabel('R (observed)','FontSize',24)
   axis equal
axis([0 1 0 1])
end
%
if plot_rho_vs_rho == 10
   figure(88);
   % JAN 12, 2023
   plot(DR63os*ones(size(DRvec63_os_eff)),DRvec63_os_eff,'rh','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR63s*ones(size(DRvec63_s_eff)),DRvec63_s_eff,'rd','MarkerSize',10,'LineWidth',2);
   plot(DR63w*ones(size(DRvec63_w_eff)),DRvec63_w_eff,'ro','MarkerSize',10,'LineWidth',2);
   % MARCH 24, 2023
   plot(DR63w*ones(size(DRvec63_w_bc_eff)),DRvec63_w_bc_eff,'ro','MarkerSize',10,'LineWidth',3);hold on;
   plot(DR64w*ones(size(DRvec64_w_eff)),DRvec64_w_eff,'go','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR65w*ones(size(DRvec65_w_eff)),DRvec65_w_eff,'bo','MarkerSize',10,'LineWidth',2);
   plot(DR68w*ones(size(DRvec68_w_eff)),DRvec68_w_eff,'mo','MarkerSize',10,'LineWidth',2);
   % MARCH 30, 2023
   plot(DR64ow*ones(size(DRvec64_ow_eff)),DRvec64_ow_eff,'g^','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR68o*ones(size(DRvec68_o_eff)),DRvec68_o_eff,'ms','MarkerSize',10,'LineWidth',2);hold on;
   % MAY 31, 2023
   plot(DR63ow*ones(size(DRvec63_ow_eff)),DRvec63_ow_eff,'r^','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR64ow*ones(size(DRvec64_owc_eff)),DRvec64_owc_eff,'g^','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR65o*ones(size(DRvec65_o_eff)),DRvec65_o_eff,'bs','MarkerSize',10,'LineWidth',2);hold on;
   % AUG 4, 2023
   plot(DR_BIG_Aw*ones(size(DRvec_BigA_w_eff)),DRvec_BigA_w_eff,'co','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR_BIG_Bw*ones(size(DRvec_BigB_w_eff)),DRvec_BigB_w_eff,'ko','MarkerSize',10,'LineWidth',2);hold on;
   % SEPT 1, 2023
   plot(DR_BIG_Aow*ones(size(DRvec_BigA_ow_eff)),DRvec_BigA_ow_eff,'c^','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR_BIG_Bow*ones(size(DRvec_BigB_ow_eff)),DRvec_BigB_ow_eff,'k^','MarkerSize',10,'LineWidth',2);hold on;
   % SEPT 30, 2023
   plot(DR63ow*ones(size(DRvec63_ow_eff_fol)),DRvec63_ow_eff_fol,'rp','MarkerSize',10,'LineWidth',2);hold on;
   % plot specs
   plot([0 1],[0 1],'k--','LineWidth',2);hold on;
   ax = gca;
   ax.FontSize = 18;
   xlabel('R','FontSize',24)
   ylabel('R (observed)','FontSize',24)
   axis equal
axis([0 1 0 1])
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plotdots(DR,angle,type)
	symbol = 'o+*xv.p';
	plot(DR*ones(size(angle)),angle,symbol(type),'MarkerSize',10,'LineWidth',3)
end

function plotdots2(DR,angle,type1,type2)
    symbol1 = 'o+*xvsp';
    symbol2 = 'rgbmck';
	%plot(DR*ones(size(angle)),angle,symbol1(type1),'Color',symbol2(type2),'MarkerSize',10,'LineWidth',3);hold on;
    scatter(DR*ones(size(angle)),angle,450,'filled', ...
       'MarkerFaceAlpha',3/8,'MarkerFaceColor',symbol2(type2));
end

function plotdots3(DR,angle,type1,type2)
%%	symbol1 = 'o+*xvsp';
	symbol1 = 'osd^vhp';
    symbol2 = 'rgbmck';
	plot(DR*ones(size(angle)),angle,symbol1(type1),...
         'Color',symbol2(type2),...
         'MarkerSize',10,...
         'LineWidth',3);hold on;
%         'MarkerFaceColor',symbol2(type2));hold on;
end

