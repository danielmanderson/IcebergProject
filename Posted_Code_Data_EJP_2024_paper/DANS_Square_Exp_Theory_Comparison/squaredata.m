%Squares
%
% This code loads in angle data measurements from floating squares
% in various one and two-fluid settings (oil, water, syrup, oil over water,
% water over syrup, etc.) and plots the measured angles versus density
% ratio R 
%
%   R = rho_object/rho_fluid  ... single fluid case
%
%   R = (rho_object - rho_upper)/(rho_lower - rho_upper) 
% 
%   where 
%        rho_upper is the upper fluid density 
%        rho_lower is the lower fluid density
%
% Evelyn's code --- spring 2023
% (DMA edits 6-23-2023, 9-15-2023)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% load in points for square and generate theta vs. R plot (if desired)
% This is not needed here as we use the analytical formulas of 
% Feigel & Fuzailov 2021
%
%square
%[denvec,thetavec] = makethetaplot(xvalues,yvalues); 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% for 'final' plots run first with 
%      which_R_switch = 2;
%      plot_rho_vs_rho = 1;
%
% then run with
%      which_R_switch = 3;
%      plot_rho_vs_rho = 0;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for new versions of final plots
%
%     ** run first with which_R_switch = 12; (gives theta vs. R observed) open symbols
%                    plot_rho_vs_rho = 10;
%
%     ** then run with which_R_switch = 13; (gives theta vs. R theory) open symbols
%                      plot_rho_vs_rho = 0;  
%
% (DMA, 9-15-2023, 9-16-2023, 11-4-2023)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(97); hold on;
%
%plot(denvec,(thetavec-180)/180*pi,'.')

%axis([0,1,-1,1])
% xlabel('R','FontSize',18)
% ylabel('\theta','FontSize',18)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Above is code that could be used to generate and plot the theoretical prediction for the
% stable orientations versus theta in [-pi,pi] for density ratio R.
% For the square we have the results of F & F below and so we use those,
% although note that we have confirmed that the numerical approach and the
% F & F formulas are in agreement.
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
%   DR50s = 0.69451918;      % square 50 in syrup
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
%red = 1         ... r (square 27)
%green = 2       ... g (square 43)
%blue = 3        ... b (square 50)
%magenta = 4     ... m (square 52)
%cyan    = 5     ... c (square 56)
%black   = 6     ... k (square 560)
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
%%% JANUARY 12, 2023 DATA
angle52sb = [3.8170319438672828e-01 9.7592286494491420e-01 2.0464517776586812e+00  2.5952269653956623e+00  -2.5750869585000089e+00 -1.9711374833218738e+00 -1.0285808928702442e+00 -5.3405549082563297e-01];
%
%
% note that this next measurement has the unprocessed `double-measurements'
% from angle extractor and we need to average in groups of two to reduce
% the 16 data points down to 8 angles for the 8 observed orientations
% % % angle52s = [1.1716784897358066e+00   3.6347031579020661e-01   9.4355722539171383e-01   5.1256868299923353e-01   1.0960454526638166e+00   3.9282723528915409e-01   9.8758707250389466e-01   5.1270422325814391e-01   1.0679776006603370e+00   4.5030227180959415e-01   9.5869369352110057e-01   5.3465735955858351e-01   9.7831649662090381e-01   4.7711015253484301e-01   9.8875349278119795e-01   5.0980987681435030e-01];
% % % for i = 1:8
% % % angle52s_DAN_makes_8(1,i) = mean([angle52s(2*i-1) pi/2 - angle52s(2*i)]);
% % % end
% % % angle52s_DAN_makes_8(1,1) = angle52s_DAN_makes_8(1,1);           % These further shifts I think are required because the order of the points 
% % % angle52s_DAN_makes_8(1,2) = pi/2 - angle52s_DAN_makes_8(1,2);    % obtained by 'grabit' impacts the two angles measured at each of the 8 orientations.
% % % angle52s_DAN_makes_8(1,3) = angle52s_DAN_makes_8(1,3);           % That is, the two parallel sets of sides of the square will either be the first and third
% % % angle52s_DAN_makes_8(1,4) = pi/2 - angle52s_DAN_makes_8(1,4);    % or the second and fourth and one of these will generate angle "alpha" and the other will
% % % angle52s_DAN_makes_8(1,5) = angle52s_DAN_makes_8(1,5);           % generate the angle "beta" where beta = pi/2 - alpha, approximately.  So, without knowing
% % % angle52s_DAN_makes_8(1,6) = pi/2 - angle52s_DAN_makes_8(1,6);    % the order in which points were grabbed by grabit, we will not know which angle is "alpha"
% % % angle52s_DAN_makes_8(1,7) = angle52s_DAN_makes_8(1,7);           % and which angle is "pi/2 - alpha" other than plotting the angles and switching them.
% % % angle52s_DAN_makes_8(1,8) = pi/2 - angle52s_DAN_makes_8(1,8);    % I propose we the consistent set of measurements based on my grabit results for the squares
% % % %                                                                % (DMA, 6-22-2023)
% % % DAN_shift = [-pi -pi -pi/2 -pi/2 0 0 pi/2 pi/2];
% % % angle52s_DAN_makes_8_mpi_to_ppi = angle52s_DAN_makes_8 + DAN_shift;
%
% theoretical density ratios
%
DR52s = 0.751608495;     % square 52 in syrup
%%%%%%%%%%%
%%%%%%%%%%% plotting
%%%%%%%%%%%
%
if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
   plotdots(DR52s,angle52sb,3)
end
%
if which_R_switch == 3          % plotting R from theory (modified symbols)
   plotdots2(DR52s,angle52sb,3,1)
end
%
if which_R_switch == 13          % plotting R from theory (modified symbols)
   plotdots3(DR52s,angle52sb,3,4)
end
%
if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
   DRvec52s_eff = [7.2953092325432145e-01  7.4119519910436016e-01  7.4600527236633873e-01  7.3435127448427417e-01 7.4896610343693926e-01  7.3327428638135150e-01  7.2270586731912267e-01  6.9095860572650436e-01];
   plot(DRvec52s_eff,angle52sb,'m*','MarkerSize',10,'LineWidth',3)
end
%
if which_R_switch == 12  % plotting (observed, effective, density obtained from grabit images)
   DRvec52s_eff = [7.2953092325432145e-01  7.4119519910436016e-01  7.4600527236633873e-01  7.3435127448427417e-01 7.4896610343693926e-01  7.3327428638135150e-01  7.2270586731912267e-01  6.9095860572650436e-01];
   plot(DRvec52s_eff,angle52sb,'md','MarkerSize',10,'LineWidth',3)
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
%%% MARCH 24, 2023 DATA
angle27w = [7.6845481981185959e-01 2.3473823811109646e+00 -2.3337266801885281e+00 -7.7609242965302627e-01];
angle43w = [5.2427631164655963e-01  -4.3367440341970642e-01   1.9094447021248304e+00   9.9517518189457643e-01  -2.7411183048696159e+00   2.8509475217204447e+00  -1.0939717901369397e+00  -1.7418639820713455e+00];
angle50w = [   3.7560694159381063e-02   1.5910782025977404e+00  -3.0924616577467119e+00  -1.5153354290122865e+00];
angle56w = [   6.7686588207886136e-03   1.5899199722680435e+00  -3.1222912890983285e+00  -1.5583980788229672e+00];
%
% theoretical density ratios
%
DR27w = 0.356898297;     % square 27 in water
DR43w = 0.213059724;     % square 43 in water
DR50w = 0.957559247;     % square 50 in water
DR56w = 0.936718471;     % square 56 in water
%
%%%%%%%%%%%
%%%%%%%%%%% plotting
%%%%%%%%%%%
%
if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
   plotdots(DR27w,angle27w,1)
   plotdots(DR43w,angle43w,1)
   plotdots(DR50w,angle50w,1)
   plotdots(DR56w,angle56w,1)
end
%
if which_R_switch == 3          % plotting R from theory (modified symbols)
   plotdots2(DR27w,angle27w,1,1)
   plotdots2(DR43w,angle43w,1,2)
   plotdots2(DR50w,angle50w,1,3)
   plotdots2(DR56w,angle56w,1,5)
end
%
if which_R_switch == 13          % plotting R from theory (modified symbols)
   plotdots3(DR27w,angle27w,1,1)
   plotdots3(DR43w,angle43w,1,2)
   plotdots3(DR50w,angle50w,1,3)
   plotdots3(DR56w,angle56w,1,5)
end
%
if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
   DRvec43w_eff = [2.6941096958120259e-01   2.6514656027370997e-01   2.5879244195022122e-01   2.7458779331952127e-01   2.5113244031617693e-01   2.4310283326729937e-01   2.4688320550801438e-01   2.5905821131034135e-01];
   DRvec27w_eff = [4.0136832484303109e-01   4.0299522944049210e-01   4.2473455242859109e-01   4.1313452136229406e-01];
   DRvec50w_eff = [9.9967475932284722e-01   9.6533061469982762e-01   9.8597552377143494e-01   9.8323009918170412e-01];
   DRvec56w_eff = [9.5733144181938823e-01   9.8326590221931864e-01   9.6721694837666894e-01   9.7582039019340872e-01];
% 
   plot(DRvec27w_eff,angle27w,'ro','MarkerSize',10,'LineWidth',3)
   plot(DRvec43w_eff,angle43w,'go','MarkerSize',10,'LineWidth',3)
   plot(DRvec50w_eff,angle50w,'bo','MarkerSize',10,'LineWidth',3)
   plot(DRvec56w_eff,angle56w,'co','MarkerSize',10,'LineWidth',3)
end
%
if which_R_switch == 12  % plotting (observed, effective, density obtained from grabit images)
   DRvec43w_eff = [2.6941096958120259e-01   2.6514656027370997e-01   2.5879244195022122e-01   2.7458779331952127e-01   2.5113244031617693e-01   2.4310283326729937e-01   2.4688320550801438e-01   2.5905821131034135e-01];
   DRvec27w_eff = [4.0136832484303109e-01   4.0299522944049210e-01   4.2473455242859109e-01   4.1313452136229406e-01];
   DRvec50w_eff = [9.9967475932284722e-01   9.6533061469982762e-01   9.8597552377143494e-01   9.8323009918170412e-01];
   DRvec56w_eff = [9.5733144181938823e-01   9.8326590221931864e-01   9.6721694837666894e-01   9.7582039019340872e-01];
% 
   plot(DRvec27w_eff,angle27w,'ro','MarkerSize',10,'LineWidth',3)
   plot(DRvec43w_eff,angle43w,'go','MarkerSize',10,'LineWidth',3)
   plot(DRvec50w_eff,angle50w,'bo','MarkerSize',10,'LineWidth',3)
   plot(DRvec56w_eff,angle56w,'co','MarkerSize',10,'LineWidth',3)
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
%%% MARCH 30, 2034 DATA
angle56ow = [8.0830714426148631e-01   2.3229600783578679e+00  -2.4170616186281548e+00  -7.9442826099218777e-01];
angle560ow = [7.1842289874609078e-01  2.2868230284642612e+00  -2.3193481238683038e+00  -7.5146712140421901e-01];
%
% theoretical density ratios
%
DR56ow = 0.594536689;    % square 56 at oil/water interface
DR560ow = 0.663687689285959;  % (50.92/54 - 0.839877)/(0.9952-0.839877);   % 560 square mass = 50.92g (DMA, 6-21-2023) oil/water interface
%
%%%%%%%%%%%
%%%%%%%%%%% plotting
%%%%%%%%%%%
%
if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
   plotdots(DR56ow,angle56ow,4)
   plotdots(DR560ow,angle560ow,4)
end
%
if which_R_switch == 3          % plotting R from theory (modified symbols)
   plotdots2(DR56ow,angle56ow,4,5)
   plotdots2(DR560ow,angle560ow,4,6)
end
%
if which_R_switch == 13          % plotting R from theory (modified symbols)
   plotdots3(DR56ow,angle56ow,4,5)
   plotdots3(DR560ow,angle560ow,4,6)
end
%
if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
   DRvec56ow_eff =[5.1487000206788602e-01   5.0580143332996053e-01   4.9117864357899160e-01   4.9796824244946652e-01];
   DRvec560ow_eff =[5.2894007291010237e-01   5.7620883892866037e-01   5.6917765383204333e-01   5.4916550025323019e-01];
%
   plot(DRvec56ow_eff,angle56ow,'cx','MarkerSize',10,'LineWidth',3)
   plot(DRvec560ow_eff,angle560ow,'kx','MarkerSize',10,'LineWidth',3)
end
%
if which_R_switch == 12  % plotting (observed, effective, density obtained from grabit images)
   DRvec56ow_eff =[5.1487000206788602e-01   5.0580143332996053e-01   4.9117864357899160e-01   4.9796824244946652e-01];
   DRvec560ow_eff =[5.2894007291010237e-01   5.7620883892866037e-01   5.6917765383204333e-01   5.4916550025323019e-01];
%
   plot(DRvec56ow_eff,angle56ow,'c^','MarkerSize',10,'LineWidth',3)
   plot(DRvec560ow_eff,angle560ow,'k^','MarkerSize',10,'LineWidth',3)
end
%%%%%%%%%%%
%%%%%%%%%%%
%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% previously loaded files ...
%
% These repeat those above with the following notes:
%
% (DMA, 6-21-2023 ... I have a comment in my notes that square 50 in syrup
% - January 12, 2023 has missing orientations not photographed and that we
% should skip plotting this one)
%
% (DMA, 6-21-2023 ... angle52s below is one of the '16' angle cases where
% the measurements are [alpha beta alpha beta alpha beta alpha beta alpha
% beta alpha beta alpha beta alpha beta]
%
% where alpha is the angle and pi/2 - beta is another estimate of the same
% angle.  We should be able to compare this to angle52sb above by averaging
% alpha and pi/2 - beta to get 8 angle measurements
%
%
%%%%angle27w =[   7.5163096672826346e-01   7.8920851247551116e-01   7.5015571627714184e-01   7.9066161639823085e-01   7.5982368560437097e-01   7.7829205588108663e-01   7.7066036633498070e-01   7.9175912984225316e-01];
%%%%angle43w = [  1.0031959384433713e+00   5.6234674523109462e-01   1.1717092993186737e+00   4.1744488970317062e-01   1.0838836978526900e+00   4.6602733414224917e-01   5.3048559351069602e-01   1.0655279401315290e+00   1.3059365429678080e+00   2.3013449516938184e-01   5.2919060354734493e-01   1.0283181659610858e+00  1.0830850898092361e+00   4.8282005471167494e-01    1.3176170357176360e+00   2.6801822471627917e-01];
%%%%angle50s = [  5.4751238759998888e-01   9.4126329539474085e-01   9.4730089179199117e-01   5.8443286519799909e-01   7.9137885682484921e-01   7.2612667588822655e-01   8.3570274353898344e-01   6.8838599838781511e-01];
%%%%angle50w = [   1.5273681511235999e+00   3.9266784562759921e-02   1.5330173807803409e+00   3.3494507732475934e-02   1.4683497772226752e+00   8.4743629489976213e-02   1.5092068655468278e+00   5.8385591854690180e-02];
%%%%angle52s = [   1.1716784897358066e+00   3.6347031579020661e-01   9.4355722539171383e-01   5.1256868299923353e-01   1.0960454526638166e+00   3.9282723528915409e-01   9.8758707250389466e-01   5.1270422325814391e-01   1.0679776006603370e+00   4.5030227180959415e-01   9.5869369352110057e-01   5.3465735955858351e-01   9.7831649662090381e-01   4.7711015253484301e-01   9.8875349278119795e-01   5.0980987681435030e-01];
%%%%angle56ow = [ 7.9036223676394490e-01   7.6616687721063526e-01   7.5561136004840657e-01   7.6701443095328936e-01   7.8508622549588170e-01   7.4215857461196855e-01   8.9406142123938759e-01   6.4407948078017530e-01];
%%%%angle56w = [   1.4825173404755789e+00   5.8988570765472127e-02   1.5619686719668811e+00   8.0598035714076269e-03   1.5595749486460979e+00   3.5013832661974949e-03   1.5358815163832653e+00   3.2740317204496799e-02];
%%%%angle52sb  = [   3.8170319438672828e-01   9.7592286494491420e-01   2.0464517776586812e+00   2.5952269653956623e+00  -2.5750869585000089e+00  -1.9711374833218738e+00  -1.0285808928702442e+00  -5.3405549082563297e-01]; 
%
%angle_shift_vector = [0 0 -pi/2 -pi/2 pi pi pi/2 pi/2];
%angle52sb_collapsed  = angle52sb + angle_shift_vector;
%
% plotdots(DR27w,angle27w,1)
% plotdots(DR43w,angle43w,1)
% %plotdots(DR20s,angle50s,3)
% plotdots(DR50w,angle50w,1)
% plotdots(DR52s,angle52s,3)
% plotdots(DR52s,angle52sb,3)
% plot(DR52s,angle52sb_collapsed,'r*','MarkerSize',20)
% 
% plotdots(DR56ow,angle56ow,4)
% plotdots(DR56w,angle56w,1)
%
% % % plotdots(DR52s,angle52s_DAN_makes_8_mpi_to_ppi,3)
%
%plotdots(DR20s,angle50s,3)
%plotdots(DR52s,angle52s,3)
%plot(DR52s,angle52sb_collapsed,'r*','MarkerSize',20)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Plot the Feigel & Fuzailov 2021 angle formulas for the square
% 
q1 = (1 - 1/sqrt(3))/2;
q2 = 9/32;
num_II = 100;
num_III = 100;
qvec_I = linspace(0,q1,2);
qvec_II = linspace(q1,0.25,num_II);
qvec_III = linspace(0.25,q2,num_III);
qvec_IV = linspace(q2,0.5,2);
%
phi_I = 0*qvec_I;
argII = sqrt(1 - 12*(1/2 - qvec_II).^2);
phi_II = atan(argII);           % FF Equation (5)
argIII = 16*qvec_III./(9 - 16*qvec_III);
phi_III = asin(argIII)/2;       % FF Equation (16)
phi_IV = (pi/4)*ones(size(qvec_IV));
%
qvec_LEFT = [qvec_I(1:end-1) qvec_II(1:end-1) qvec_III(1:end-1) qvec_IV];
phi_LEFT = [phi_I(1:end-1) phi_II(1:end-1) phi_III(1:end-1) phi_IV];
qvec_RIGHT = 1 - fliplr(qvec_LEFT);
phi_RIGHT = fliplr(phi_LEFT);
%
qvec_LEFT_short = [qvec_II(1:end-1) qvec_III(1:end-1)];
phi_LEFT_short = [phi_II(1:end-1) phi_III(1:end-1)];
qvec_RIGHT_short = 1 - fliplr(qvec_LEFT_short);
phi_RIGHT_short = fliplr(phi_LEFT_short);
%plot(qvec_LEFT,-1 +phi_LEFT/pi,'b-','LineWidth',3);hold on;
%plot(qvec_RIGHT,-1 + phi_RIGHT/pi,'b-','LineWidth',3);hold on;
%plot(qvec_LEFT,-pi +phi_LEFT,'b-','LineWidth',3);hold on;
%plot(qvec_RIGHT,-pi + phi_RIGHT,'b-','LineWidth',3);hold on;
plot(qvec_LEFT,0 +phi_LEFT,'k-','LineWidth',3);hold on;
plot(qvec_RIGHT,0 + phi_RIGHT,'k-','LineWidth',3);hold on;
%
plot(qvec_LEFT,pi/2 +phi_LEFT,'k-','LineWidth',3);hold on;
plot(qvec_RIGHT,pi/2 + phi_RIGHT,'k-','LineWidth',3);hold on;
%
plot(qvec_LEFT,-pi/2 +phi_LEFT,'k-','LineWidth',3);hold on;
plot(qvec_RIGHT,-pi/2 + phi_RIGHT,'k-','LineWidth',3);hold on;
%
plot(qvec_LEFT,-pi +phi_LEFT,'k-','LineWidth',3);hold on;
plot(qvec_RIGHT,-pi + phi_RIGHT,'k-','LineWidth',3);hold on;
%
%
plot(qvec_LEFT_short,0 -phi_LEFT_short,'k-','LineWidth',3);hold on;
plot(qvec_RIGHT_short,0 - phi_RIGHT_short,'k-','LineWidth',3);hold on;
%
plot(qvec_LEFT_short,-pi/2 -phi_LEFT_short,'k-','LineWidth',3);hold on;
plot(qvec_RIGHT_short,-pi/2 - phi_RIGHT_short,'k-','LineWidth',3);hold on;
%
plot(qvec_LEFT_short,pi/2 -phi_LEFT_short,'k-','LineWidth',3);hold on;
plot(qvec_RIGHT_short,pi/2 - phi_RIGHT_short,'k-','LineWidth',3);hold on;
%
plot(qvec_LEFT_short,pi -phi_LEFT_short,'k-','LineWidth',3);hold on;
plot(qvec_RIGHT_short,pi - phi_RIGHT_short,'k-','LineWidth',3);hold on;
%
axis([0 1 -pi pi])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
   plot(DR52s*ones(size(DRvec52s_eff)),DRvec52s_eff,'m*','MarkerSize',10,'LineWidth',2);hold on;
   % MARCH 24, 2023
   plot(DR43w*ones(size(DRvec43w_eff)),DRvec43w_eff,'go','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR27w*ones(size(DRvec27w_eff)),DRvec27w_eff,'ro','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR50w*ones(size(DRvec50w_eff)),DRvec50w_eff,'bo','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR56w*ones(size(DRvec56w_eff)),DRvec56w_eff,'co','MarkerSize',10,'LineWidth',2);
   % MARCH 30, 2023
   plot(DR56ow*ones(size(DRvec56ow_eff)),DRvec56ow_eff,'cx','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR560ow*ones(size(DRvec560ow_eff)),DRvec560ow_eff,'kx','MarkerSize',10,'LineWidth',2);hold on;
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
   plot(DR52s*ones(size(DRvec52s_eff)),DRvec52s_eff,'md','MarkerSize',10,'LineWidth',2);hold on;
   % MARCH 24, 2023
   plot(DR43w*ones(size(DRvec43w_eff)),DRvec43w_eff,'go','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR27w*ones(size(DRvec27w_eff)),DRvec27w_eff,'ro','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR50w*ones(size(DRvec50w_eff)),DRvec50w_eff,'bo','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR56w*ones(size(DRvec56w_eff)),DRvec56w_eff,'co','MarkerSize',10,'LineWidth',2);
   % MARCH 30, 2023
   plot(DR56ow*ones(size(DRvec56ow_eff)),DRvec56ow_eff,'c^','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR560ow*ones(size(DRvec560ow_eff)),DRvec560ow_eff,'k^','MarkerSize',10,'LineWidth',2);hold on;
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
	symbol = 'o+*xv.';
	plot(DR*ones(size(angle)),angle,symbol(type),'MarkerSize',10,'LineWidth',3)
end

function plotdots2(DR,angle,type1,type2)
	symbol1 = 'o+*xvs';
    symbol2 = 'rgbmck';
%	plot(DR*ones(size(angle)),angle,symbol1(type1),'Color',symbol2(type2),'MarkerSize',10,'LineWidth',3);hold on;
    scatter(DR*ones(size(angle)),angle,450,'filled', ...
       'MarkerFaceAlpha',3/8,'MarkerFaceColor',symbol2(type2));
%     scatter(DR*ones(size(angle)),angle,450,'filled', ...
%        'MarkerFaceAlpha',1/8,'MarkerFaceColor','k');
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
