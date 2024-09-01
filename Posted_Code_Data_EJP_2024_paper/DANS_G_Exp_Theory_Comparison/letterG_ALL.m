letterG;
[denvec,thetavec] = makethetaplot(xvalues,yvalues);            % runs with default settings for NumR and Numtheta

%%[denvec,thetavec] = makethetaplot(xvalues,yvalues,1000,200);  % changes NumR,Numtheta

% (DMA, 11-5-2023)
% run with noisy_switch = 1 (and which_R_switch = 12; plot_rho_vs_rho = 0;)
% to load the noisy plot plus the theta vs. Robs data (if you want theta
% vs. R use which_R_switch = 13)
%

noisy_switch = 0;
if noisy_switch == 1
   close(1)
   openfig('masonGpoteng3.fig')
   figure(1);hold on;
   plot(denvec,(mod(thetavec+180,360)-180)/180*pi,'r.')
else
   figure(98); hold on;
   plot(denvec,(mod(thetavec+180,360)-180)/180*pi,'.')
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% for 'final' plots run first with 
%      which_R_switch = 2;
%      [denvec,thetavec] = makethetaplot ...
%      plot(denvec, ...)                        NOT COMMENTED OUT
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
% (DMA, 9-15-2023, 9-16-2023, 11-4-2023)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Notes to add to text:
%
% The Robs vs. R results for the G are pretty good with the exception, 
% again, of the cases of oil over water (red triangles and green triangles)
%
% These cases can be identified in the theta vs. Robs plot.  But, as can be
% seen there, there are a number of other data points that do not
% necessarily match closely with the expected predictions of stable
% equilibria.  The next figure (with noisy G) will demonstrate that in fact
% throughout the region between the solid curves, especially for larger
% R, there are in fact very nearby solutions if one allows a very small
% perturbation of the center of gravity (which is a possibility with any of
% our 3d prints).  This can actually be expected based on the shape of the
% letter G.  In particular, the letter G bears some similarity to a 
% shape composed of concentric circles, which would have no preferred
% floating orientation.  We think that PE landscape of the G has in many
% instances (as demonstrated by the noisy set of equilibria) only weak
% departures from uniformity in theta.
%
% The two cases of large letter G correspond to the cyan circles and 
% the black circles.  The cyan circles near R=0.6 show excellent agreement
% the expected orientations while the black circles near R = 0.83 are
% in excellent agreement for the highest and lowest angles while the two
% intermediate solutions observed (when the theory formally predicts that
% they should not be observed) we expect are experimentally observed
% because they are very near other weakly stable solutions.  Surface
% tension is expected to be a small effect especially for these large
% letter G shapes but may impact experimental observations in cases such 
% as these where there appear to be nearby stable solutions.
%
% Note that in the theta vs. Robs plot the two sets of results at the 
% largest R (green circles and red circles) where we were not able to
% extract from the images an estimate of Robs (primarily due to lack of 
% shape detail near the waterline -- the object orientation was still
% accessible -- but that these cases appeared to be approximately
% consistent with the expected R.

%figure(5);hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Letter G prints
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Notes on density measurements (numbers listed in g/cm^3)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%
rho_G66 = 0.9915;
rho_G67 = 0.8953;
rho_G69 = 0.3735;
rho_BIG_GA = 0.593;
rho_BIG_GB = 0.811;
rho_BIG_GB_AUG4 = 463.58/561.4;  % this weighed 452.58g pre-floating 
                                 % and 463.4g right after experiment so we 
                                 % have a range (or at least error bars in R)
                                 % from 0.806 g/cm^3 to 0.8254 g/cm^3
%
rho_oil = 0.84;
rho_water = 1.00;
rho_syrup = 1.37;
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
%
% type2 (in plotdots2, plotdots3)
%
%red = 1         ... r  (small G 66)
%green = 2       ... g  (small G 67)
%blue = 3        ... b  (small G 69)
%magenta = 4     ... m  
%cyan    = 5     ... c  (Big G A)
%black   = 6     ... k  (Big G B)
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
which_R_switch = 12;
plot_rho_vs_rho = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
% % % % % % %MARCH 24 2023
% % % % % % angleG66w = [0 0 0];
% % % % % % angleG67w = [0 0 0];
% % % % % % angleG69w = [0 0 0];
% % % % % % %
% % % % % % % theoretical density ratios
% % % % % % %
% % % % % % DRG66w = rho_G66/rho_water;
% % % % % % DRG67w = rho_G67/rho_water;
% % % % % % DRG69w = rho_G69/rho_water;
% % % % % % %%%%%%%%%%%
% % % % % % %%%%%%%%%%% plotting
% % % % % % %%%%%%%%%%%
% % % % % % %
% % % % % % if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
% % % % % %    plotdots(DRG66w,angleG66w,1);
% % % % % %    plotdots(DRG67w,angleG67w,1);
% % % % % %    plotdots(DRG69w,angleG69w,1);
% % % % % % end
% % % % % % %
% % % % % % if which_R_switch == 3          % plotting R from theory (modified symbols)
% % % % % %    plotdots2(DRG66w,angleG66w,1,1);
% % % % % %    plotdots2(DRG67w,angleG67w,1,1);
% % % % % %    plotdots2(DRG69w,angleG69w,1,1);
% % % % % % end
% % % % % % %
% % % % % % if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
% % % % % %    DRG66w_eff = [0 0 0];
% % % % % %    plot(DRG66w_eff,angleG66w,'ro','MarkerSize',10,'LineWidth',3)
% % % % % %    %
% % % % % %    DRG67w_eff = [0 0 0];
% % % % % %    plot(DRG67w_eff,angleG67w,'ro','MarkerSize',10,'LineWidth',3)
% % % % % %    %
% % % % % %    DRG69w_eff = [0 0 0];
% % % % % %    plot(DRG69w_eff,angleG69w,'ro','MarkerSize',10,'LineWidth',3)
% % % % % % end
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
angleG66ow = [-1.4198723723217244e-01  7.9150677348319465e-01  1.3944669678304753e+00  2.4230370085056241e+00  -7.1509058658599234e-01];
angleG66wb = [2.0040756553102446e-01  1.2532184882501878e+00  1.6724617485828694e+00  2.9925035827455431e+00  -1.6732305184798222e+00];
angleG67ow = [1.8045696665689386e+00];
angleG67wb = [2.0272598079678650e+00  -1.5105099670368876e+00];
angleG69o = [9.3789482338197283e-02  2.3099125951753119e+00];
angleG69wb = [1.5165551117945297e-01  2.1810339596527415e+00];
%
% theoretical density ratios (some already defined above)
%
DRG66ow = (rho_G66 - rho_oil)/(rho_water - rho_oil);
DRG66w = rho_G66/rho_water;
DRG67ow = (rho_G67 - rho_oil)/(rho_water - rho_oil);
DRG67w = rho_G67/rho_water;
DRG69o = rho_G69/rho_oil;
DRG69w = rho_G69/rho_water;
%%%%%%%%%%%
%%%%%%%%%%% plotting
%%%%%%%%%%%
%
if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
   plotdots(DRG66ow,angleG66ow,4);
   plotdots(DRG66w,angleG66wb,1);
   plotdots(DRG67ow,angleG67ow,4);
   plotdots(DRG67w,angleG67wb,1);
   plotdots(DRG69o,angleG69o,2);
   plotdots(DRG69w,angleG69wb,1);
end
%
if which_R_switch == 3          % plotting R from theory (modified symbols)
   plotdots2(DRG66ow,angleG66ow,4,1);
   plotdots2(DRG66w,angleG66wb,1,1);
   plotdots2(DRG67ow,angleG67ow,4,2);
   plotdots2(DRG67w,angleG67wb,1,2);
   plotdots2(DRG69o,angleG69o,2,3);
   plotdots2(DRG69w,angleG69wb,1,3);
end
%
if which_R_switch == 13          % plotting R from theory (modified symbols)
   plotdots3(DRG66ow,angleG66ow,4,1);
   plotdots3(DRG66w,angleG66wb,1,1);
   plotdots3(DRG67ow,angleG67ow,4,2);
   plotdots3(DRG67w,angleG67wb,1,2);
   plotdots3(DRG69o,angleG69o,2,3);
   plotdots3(DRG69w,angleG69wb,1,3);
end
%
if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
   DRG66ow_eff = [0.6392 0.6499 0.6079 0.6602 0.6472];
   plot(DRG66ow_eff,angleG66ow,'rx','MarkerSize',10,'LineWidth',3)
   %
   DRG66wb_eff = [0.9915 0.9915 0.9915 0.9915 0.9915];   % using the theoretical number ... observation value is within measurement method resolution of 1
   plot(DRG66wb_eff,angleG66wb,'ro','MarkerSize',10,'LineWidth',3)
   %
   DRG67ow_eff = [0.2023];
   plot(DRG67ow_eff,angleG67ow,'gx','MarkerSize',10,'LineWidth',3)
   %
   DRG67wb_eff = [0.8953 0.8953];   % using the theoretical number ... observation value not accessible via images
   plot(DRG67wb_eff,angleG67wb,'go','MarkerSize',10,'LineWidth',3)
   %
   DRG69o_eff = [0.5712];
   plot(DRG69o_eff,angleG69o,'b+','MarkerSize',10,'LineWidth',3)
   %
   DRG69wb_eff = [0.4150 0.4150];
   plot(DRG69wb_eff,angleG69wb,'bo','MarkerSize',10,'LineWidth',3)
end
%
if which_R_switch == 12  % plotting (observed, effective, density obtained from grabit images)
   DRG66ow_eff = [0.6392 0.6499 0.6079 0.6602 0.6472];
   plot(DRG66ow_eff,angleG66ow,'r^','MarkerSize',10,'LineWidth',3)
   %
   DRG66wb_eff = [0.9915 0.9915 0.9915 0.9915 0.9915];   % using the theoretical number ... observation value is within measurement method resolution of 1
   plot(DRG66wb_eff,angleG66wb,'ro','MarkerSize',10,'LineWidth',3)
   %
   DRG67ow_eff = [0.2023];
   plot(DRG67ow_eff,angleG67ow,'g^','MarkerSize',10,'LineWidth',3)
   %
   DRG67wb_eff = [0.8953 0.8953];   % using the theoretical number ... observation value not accessible via images
   plot(DRG67wb_eff,angleG67wb,'go','MarkerSize',10,'LineWidth',3)
   %
   DRG69o_eff = [0.5712];
   plot(DRG69o_eff,angleG69o,'bs','MarkerSize',10,'LineWidth',3)
   %
   DRG69wb_eff = [0.4150 0.4150];
   plot(DRG69wb_eff,angleG69wb,'bo','MarkerSize',10,'LineWidth',3)
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
%APRIL 7 2023
angleG66s = [-1.0794121095360252e+00  2.0816813411914059e+00  -5.6760997718869766e-01 2.6384628844428262e+00];
angleG69s = [-2.8853443275116619e-01  2.0133698982805837e+00  1.8499477017083259e+00];
%
% theoretical density ratios
%
DRG66s = rho_G66/rho_syrup;
DRG69s = rho_G69/rho_syrup;
%%%%%%%%%%%
%%%%%%%%%%% plotting
%%%%%%%%%%%
%
if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
   plotdots(DRG66s,angleG66s,3);
   plotdots(DRG69s,angleG69s,3);
end
%
if which_R_switch == 3          % plotting R from theory (modified symbols)
   plotdots2(DRG66s,angleG66s,3,1);
   plotdots2(DRG69s,angleG69s,3,2);
end
%
if which_R_switch == 13          % plotting R from theory (modified symbols)
   plotdots3(DRG66s,angleG66s,3,1);
   plotdots3(DRG69s,angleG69s,3,2);
end
%
if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
   DRG66s_eff = [0.7349 0.7349 0.7349 0.7349];   % using the result from 9579 (similar to R from theory)
   plot(DRG66s_eff,angleG66s,'r*','MarkerSize',10,'LineWidth',3)
   %
   DRG69s_eff = [0.3075 0.3075 0.3075];
   plot(DRG69s_eff,angleG69s,'b*','MarkerSize',10,'LineWidth',3)
end
%
if which_R_switch == 12  % plotting (observed, effective, density obtained from grabit images)
   DRG66s_eff = [0.7349 0.7349 0.7349 0.7349];   % using the result from 9579 (similar to R from theory)
   plot(DRG66s_eff,angleG66s,'rd','MarkerSize',10,'LineWidth',3)
   %
   DRG69s_eff = [0.3075 0.3075 0.3075];
   plot(DRG69s_eff,angleG69s,'bd','MarkerSize',10,'LineWidth',3)
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
% % % % % %AUG 4 2023
% % % % % angle_BIG_G_Bw = [2.8031939049383428e+00  -1.4570687785967902e+00];
% % % % % %
% % % % % % theoretical density ratios
% % % % % %
% % % % % DR_BIG_G_Bw_AUG4 = rho_BIG_GB_AUG4/rho_water;
% % % % % %%%%%%%%%%%
% % % % % %%%%%%%%%%% plotting
% % % % % %%%%%%%%%%%
% % % % % %
% % % % % if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
% % % % %    plotdots(DR_BIG_G_Bw_AUG4,angle_BIG_G_Bw,1);
% % % % % end
% % % % % %
% % % % % if which_R_switch == 3          % plotting R from theory (modified symbols)
% % % % %    plotdots2(DR_BIG_G_Bw_AUG4,angle_BIG_G_Bw,1,4);
% % % % % end
% % % % % %
% % % % % if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
% % % % %    DR_BIG_G_Bw_AUG4_eff = [0 0 0];
% % % % %    plot(DR_BIG_G_Bw_AUG4_eff,angle_BIG_G_Bw,'m*','MarkerSize',10,'LineWidth',3)
% % % % % end
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
angle_BIG_G_Aw = [   7.1302061168866426e-01  2.5458240504088594e+00  -7.3165647675736489e-01];
angle_BIG_G_Bw_2 = [5.3257291476811397e-01  1.7562987449878202e+00  2.7755668211896505e+00  -1.3631711551194792e+00];
%
% theoretical density ratios
%
DR_BIG_G_Aw = rho_BIG_GA/rho_water;
DR_BIG_G_Bw = rho_BIG_GB/rho_water;
%%%%%%%%%%%
%%%%%%%%%%% plotting
%%%%%%%%%%%
%
if which_R_switch == 0 || which_R_switch == 1    % plotting R from theory
   plotdots(DR_BIG_G_Aw,angle_BIG_G_Aw,1);
   plotdots(DR_BIG_G_Bw,angle_BIG_G_Bw_2,1);
end
%
if which_R_switch == 3          % plotting R from theory (modified symbols)
   plotdots2(DR_BIG_G_Aw,angle_BIG_G_Aw,1,5);
   plotdots2(DR_BIG_G_Bw,angle_BIG_G_Bw_2,1,6);
end
%
if which_R_switch == 13          % plotting R from theory (modified symbols)
   plotdots3(DR_BIG_G_Aw,angle_BIG_G_Aw,1,5);
   plotdots3(DR_BIG_G_Bw,angle_BIG_G_Bw_2,1,6);
end
%
if which_R_switch == 0 || which_R_switch == 2  % plotting (observed, effective, density obtained from grabit images)
   DR_BIG_G_Aw_eff = [0.6041 0.6041 0.6041];   % all these numbers based on image 9798 (looks very close to theoretical R)
   plot(DR_BIG_G_Aw_eff,angle_BIG_G_Aw,'co','MarkerSize',10,'LineWidth',3)
%
   DR_BIG_G_Bw_2_eff = [0.8336 0.8336 0.8336 0.8336];  % all these numbers based on image 9809 (looks very close to theoretical R)
   plot(DR_BIG_G_Bw_2_eff,angle_BIG_G_Bw_2,'ko','MarkerSize',10,'LineWidth',3)
end
%
if which_R_switch == 12  % plotting (observed, effective, density obtained from grabit images)
   DR_BIG_G_Aw_eff = [0.6041 0.6041 0.6041];   % all these numbers based on image 9798 (looks very close to theoretical R)
   plot(DR_BIG_G_Aw_eff,angle_BIG_G_Aw,'co','MarkerSize',10,'LineWidth',3)
%
   DR_BIG_G_Bw_2_eff = [0.8336 0.8336 0.8336 0.8336];  % all these numbers based on image 9809 (looks very close to theoretical R)
   plot(DR_BIG_G_Bw_2_eff,angle_BIG_G_Bw_2,'ko','MarkerSize',10,'LineWidth',3)
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
   % MARCH 30, 2023   
   plot(DRG66ow*ones(size(DRG66ow_eff)),DRG66ow_eff,'rx','MarkerSize',10,'LineWidth',2);hold on;
   plot(DRG67ow*ones(size(DRG67ow_eff)),DRG67ow_eff,'gx','MarkerSize',10,'LineWidth',2);hold on;
   plot(DRG69o*ones(size(DRG69o_eff)),DRG69o_eff,'b+','MarkerSize',10,'LineWidth',2);
   plot(DRG69w*ones(size(DRG69wb_eff)),DRG69wb_eff,'bo','MarkerSize',10,'LineWidth',2);
   % APRIL 7, 2023
   plot(DRG66s*ones(size(DRG66s_eff)),DRG66s_eff,'r*','MarkerSize',10,'LineWidth',2);hold on;
   plot(DRG69s*ones(size(DRG69s_eff)),DRG69s_eff,'b*','MarkerSize',10,'LineWidth',2);hold on;
   % SEPT 1, 2023
   plot(DR_BIG_G_Aw*ones(size(DR_BIG_G_Aw_eff)),DR_BIG_G_Aw_eff,'co','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR_BIG_G_Bw*ones(size(DR_BIG_G_Bw_2_eff)),DR_BIG_G_Bw_2_eff,'ko','MarkerSize',10,'LineWidth',2);hold on;
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
   % MARCH 30, 2023   
   plot(DRG66ow*ones(size(DRG66ow_eff)),DRG66ow_eff,'r^','MarkerSize',10,'LineWidth',2);hold on;
   plot(DRG67ow*ones(size(DRG67ow_eff)),DRG67ow_eff,'g^','MarkerSize',10,'LineWidth',2);hold on;
   plot(DRG69o*ones(size(DRG69o_eff)),DRG69o_eff,'bs','MarkerSize',10,'LineWidth',2);
   plot(DRG69w*ones(size(DRG69wb_eff)),DRG69wb_eff,'bo','MarkerSize',10,'LineWidth',2);
   % APRIL 7, 2023
   plot(DRG66s*ones(size(DRG66s_eff)),DRG66s_eff,'rd','MarkerSize',10,'LineWidth',2);hold on;
   plot(DRG69s*ones(size(DRG69s_eff)),DRG69s_eff,'bd','MarkerSize',10,'LineWidth',2);hold on;
   % SEPT 1, 2023
   plot(DR_BIG_G_Aw*ones(size(DR_BIG_G_Aw_eff)),DR_BIG_G_Aw_eff,'co','MarkerSize',10,'LineWidth',2);hold on;
   plot(DR_BIG_G_Bw*ones(size(DR_BIG_G_Bw_2_eff)),DR_BIG_G_Bw_2_eff,'ko','MarkerSize',10,'LineWidth',2);hold on;
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
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plotdots(DR,angle,type)
	symbol = 'o+*xv.';
	plot(DR*ones(size(angle)),angle,symbol(type),'MarkerSize',10,'LineWidth',3)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plotdots2(DR,angle,type1,type2)
	symbol1 = 'o+*xvs';
    symbol2 = 'rgbmck';
	%plot(DR*ones(size(angle)),angle,symbol1(type1),'Color',symbol2(type2),'MarkerSize',10,'LineWidth',3);hold on;
    scatter(DR*ones(size(angle)),angle,450,'filled', ...
       'MarkerFaceAlpha',3/8,'MarkerFaceColor',symbol2(type2));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

