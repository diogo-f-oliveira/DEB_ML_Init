function [data, auxData, metaData, txtData, weights] = mydata_Nitokra_spinipes

%% set metaData
metaData.phylum     = 'Arthropoda';
metaData.class      = 'Hexanauplia';
metaData.order      = 'Harpacticoida';
metaData.family     = 'Ameiridae';
metaData.species    = 'Nitokra_spinipes';
metaData.species_en = 'Copepod';

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ah'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lj'; 'Lp'; 'Li'; 'Wdi'; 'JOi'; 'Ri'};
metaData.data_1     = {'t-L'; 'X-aj'; 'X-ap'; 'X-Ri'; 'T-ah'; 'T-aj'; 'T-ap'};

metaData.COMPLETE   = 2.7; % using criteria of LikaKear2011

metaData.author     = {'Josef Koch'};
metaData.date_subm  = [2017 05 18];
metaData.email      = {'josef.koch@ugent.be'};
metaData.address    = {'Ghent University'};

metaData.author_mod_1  = {'Josef Koch'};
metaData.date_mod_1    = [2017 09 18];
metaData.email_mod_1   = {'josef.koch@ugent.be'};
metaData.address_mod_1 = {'Ghent University'};

metaData.author_mod_2  = {'Josef Koch'};
metaData.date_mod_2    = [2017 10 11];
metaData.email_mod_2   = {'josef.koch@ugent.be'};
metaData.address_mod_2 = {'Ghent University'};

metaData.author_mod_3  = {'Bas Kooijman'};
metaData.date_mod_3    = [2024 07 15];
metaData.email_mod_3   = {'bas.kooijman@vu.nl'};
metaData.address_mod_3 = {'VU University Adam'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'};
metaData.date_acc    = [2024 07 15];

%% set data
% zero-variate data

data.am = 91/ 14 * 16.75;  units.am = 'd';  label.am = 'life span';  bibkey.am = {'Uye1988', 'KochBui2017'};
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.ah = 'life span/ develop time of Calanus sinicus (Uye1988) * develop time of N. spinipes (KochBui2017) at 22 degC';

data.ah = 3.17;  units.ah = 'd';  label.ah = 'age at hatch';  bibkey.ah = 'KochBui2017';   
  temp.ah = C2K(22);  units.temp.ah = 'K';  label.temp.ah = 'temperature';
  comment.ah = 'estimated as inter-brood time; mean of multiple control datasets';

data.tj = 7.75;  units.tj = 'd';  label.tj = 'time since hatch at metam';  bibkey.tj = 'KochBui2017';   
  temp.tj = C2K(22);  units.temp.tj = 'K';  label.temp.tj = 'temperature';
  comment.tj = 'mean of multiple control datasets';
  
data.tp = 9.00;  units.tp = 'd';  label.tp = 'time since metam at puberty';  bibkey.tp = 'KochBui2017';   
  temp.tp = C2K(22);  units.temp.tp = 'K';  label.temp.tp = 'temperature';
  comment.tp = 'mean of multiple control datasets';
  
data.Lh = 0.0078;  units.Lh = 'cm';  label.Lh = 'isometric length at hatch';  bibkey.Lh = 'Koch2017';   
data.Lj = 0.0150;  units.Lj = 'cm';  label.Lj = 'isometric length at metam';  bibkey.Lj = 'Koch2017';   
data.Lp = 0.0283;  units.Lp = 'cm';  label.Lp = 'isometric length at puberty';  bibkey.Lp = 'Koch2017';   
data.Li = 0.0283;  units.Li = 'cm';  label.Li = 'ultimate isometric length';  bibkey.Li = 'Koch2017';
  comment.Li = 'same as length at puberty';

data.Wdi = 14.01 * 0.637 - 5.69;  units.Wdi = 'mug';  label.Wdi = 'ultimate dry weight';  bibkey.Wdi = 'Good1980';   
  comment.Wdi = 'linear regression of dry weight (mug) and total body length (mm) for adult harpacticoida';
  
data.JOi = mean([10.05 11.75 10.50 8.97]);  units.JOi = 'nL/h/mug';  label.JOi = 'ultimate specific O2 consumption';
  bibkey.JOi = 'HermHeip1983';  temp.JOi = C2K(20);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  comment.JOi = 'specific O2 consumption of four brackish water harpacticoida at ultimate length';

data.Ri = 24/ 3.17;   units.Ri = '#/d';   label.Ri = 'maximum reprod rate'; bibkey.Ri = 'KochBui2017';
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'brood size/ inter-brood time; mean of multiple control datasets'; 
  
% uni-variate data

% time-length
data.tL = [  ... % time since hatch (d), total length (mum), top view surface area (mum^2)
    0.0    76.9   6.14E+03
    0.9    81.5   6.55E+03
    1.7    93.7   8.13E+03
    2.7   113.3   1.15E+04
    3.8   129.6   1.37E+04
    4.9   156.5   1.83E+04
    5.7   272.6   2.25E+04
    6.7   319.8   2.73E+04
    7.7   364.3   3.33E+04
    8.7   379.8   3.48E+04
    9.7   415.6   4.06E+04
   12.8   500.3   5.30E+04
   13.7   586.7   6.80E+04
   14.7   599.6   7.31E+04
   15.7   614.3   7.61E+04
   16.7   636.7   7.95E+04
   21.7   621.7   7.69E+04
   27.7   636.5   8.00E+04];
  data.tL = [data.tL(:,1), data.tL(:,3) .^(1/2) /10000]; % 'isometric' length (cm) = top view surface area^(1/2)
  units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'isometric length'};  
  temp.tL = C2K(22);  units.temp.tL = 'K';  label.temp.tL = 'temperature';
  bibkey.tL = 'Koch2017';
  comment.tL = 'length is square root of top view surface';
  
% food-time at metam  (time since hatch at metam at 6 different constant food concentrations)
data.Xtj = [ ... % food concentration Rhodomonas salina (cells/mL), time since hatch at metam (d)
   500000    6.71
   250000    7.66
   125000    8.51
    50000   11.74
    25000   12.86
    12500   16.10];
  data.Xtj(:,1) = data.Xtj(:,1) * 23e-6; % convert to mug C/mL with 23pg C/cell (source: http://nordicmicroalgae.org/taxon/Rhodomonas%20salina)
  units.Xtj = {'mug C/mL', 'd'};  label.Xtj = {'food concentration', 'time since hatch at metam'};
  temp.Xtj = C2K(22);  units.temp.Xtj = 'K';  label.temp.Xtj = 'temperature';
  bibkey.Xtj = 'KochBui2017';

% food-time at puberty (time since metam at puberty at 6 different constant food concentrations)
data.Xtp = [ ... % food concentration Rhodomonas salina (cells/mL), time since metam at puberty (d)
   500000   11.21
   250000   11.50
   125000   12.55
    50000   13.32
    25000   17.52
    12500   20.50];
  data.Xtp(:,1) = data.Xtp(:,1) * 23e-6; % convert cells/mL to mug C/mL with 23pg C/cell (source: http://nordicmicroalgae.org/taxon/Rhodomonas%20salina)
  units.Xtp = {'mug C/mL', 'd'};  label.Xtp = {'food concentration', 'time since metam at puberty'};
  temp.Xtp = C2K(22);  units.temp.Xtp = 'K';  label.temp.Xtp = 'temperature';
  bibkey.Xtp = 'KochBui2017';

% food-reprod rate (reprod rate at 5 different constant food concentrations)
data.XR = [ ... % food concentration Rhodomonas salina (cells/mL), reprod rate (#/d)
   500000   35.35/ 3.17
   250000   30.50/ 3.17
   125000   25.88/ 3.17
    50000   20.50/ 3.17
    25000   12.00/ 3.17];
  data.XR(:,1) = data.XR(:,1) * 23e-6; % convert to mug C/mL with 23pg C/cell (source: http://nordicmicroalgae.org/taxon/Rhodomonas%20salina)
  units.XR = {'mug C/mL', '#/d'};  label.XR = {'food concentration', 'reprod rate'};
  temp.XR = C2K(22);  units.temp.XR = 'K';  label.temp.XR = 'temperature';
  bibkey.XR = 'KochBui2017';  comment.XR = 'brood size/ inter-brood time';  

% temperature-age at hatch
data.Tah = [ ... % temperature (C), age at hatch (d)
   14.86   4.08
   19.34   3.39
   24.90   3.18];
  units.Tah = {'C', 'd'};  label.Tah = {'temperature', 'age at hatch'};  
  bibkey.Tah = 'KochBui2017';  comment.Tah = 'estimated as inter-brood time';

% temperature-age at metam
data.Ttj = [ ... % temperature (C), time since hatch at metam (d)
   14.86   9.52
   19.34   6.44
   24.90   5.57];
  units.Ttj = {'C', 'd'};  label.Ttj = {'temperature', 'time since hatch at metam'};  
  bibkey.Ttj = 'KochBui2017';

% temperature-age at puberty
data.Ttp = [ ... % temperature (C), time since metam at puberty (d)
   14.86   12.31
   19.34   10.12
   24.90    8.86];
  units.Ttp = {'C', 'd'};  label.Ttp = {'temperature', 'time since metam at puberty'};  
  bibkey.Ttp = 'KochBui2017';

% temperature-reprod rate (not used)
% % extra temperature stress module may be needed to explain observed reproduction data
% data.TRi = [ ... % temperature (C), reprod rate (#/d)
%    14.86   27.65/ 4.08
%    19.34   23.76/ 3.39
%    24.90   10.95/ 3.18];
%   units.TRi = {'C', '#/d'};  label.TRi = {'temperature', 'maximum reprod rate'};  
%   bibkey.TRi = 'KochBui2017';  comment.TRi = 'brood size/ inter-brood time';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.XR = 3 * weights.XR;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp    = temp;
txtData.units   = units;
txtData.label   = label;
txtData.bibkey  = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Acceleration starts at birth and continues till puberty, beyond metam; growth ceases at puberty';
D2 = 'Data for females';
D3 = 'mod_3: half saturation coeff coupled to spec feeding rate';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Sexual reproduction in adult stage; 12 molts: 6 naupliar stages, 5 copepodite stages, 1 adult stage';
metaData.bibkey.F1 = 'KochBui2017';
metaData.facts = struct('F1', F1);

%% Links
metaData.links.id_CoL = '7XG88'; % Cat of Life
metaData.links.id_ITIS = '572747'; % ITIS
metaData.links.id_EoL = '1020994'; % Ency of Life
metaData.links.id_Wiki = 'Nitokra'; % Wikipedia
metaData.links.id_ADW = 'Nitokra_spinipes_spinipes'; % ADW
metaData.links.id_Taxo = '486443'; % Taxonomicon
metaData.links.id_WoRMS = '745852'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Uye1988'; type = 'Article'; bib = [ ...
'author = {Uye, Shin-ichi}, ' ...
'year = {1988}, ' ...
'title = {Temperature-dependent development and growth of \emph{Calanus sinicus} ({C}opepoda: {C}alanoida) in the laboratory}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {167}, ' ...
'number = {1}, ' ...
'pages = {285--293}, ' ...
'doi = {10.1007/BF00026316}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KochBui2017'; type = 'Article'; bib = [ ...
'author = {Koch, J. and Bui, T. T. and Belleza, E. L. and Brinkmann, M. and Hollert, H. and Breitholtz, M.}, ' ...
'year = {2017}, ' ...
'title = {Temperature and food quantity effects on the harpacticoid copepod \emph{Nitocra spinipes}: Combining in vivo bioassays with population modeling}, ' ...
'publisher = {Public Library of Science}, ' ...
'journal = {PLOS ONE}, ' ...
'volume = {12}, ' ...
'number = {3}, ' ...
'pages = {e0174384}, ' ...
'doi = {10.1371/journal.pone.0174384}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Good1980'; type = 'Article'; bib = [ ...
'author = {Goodman, Keith S.}, ' ...
'year = {1980}, ' ...
'title  = {The estimation of individual dry weight and standing crop of harpacticoid copepods}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {72}, ' ...
'number = {3}, ' ...
'pages = {253--259}, ' ...
'doi = {10.1007/BF00005629}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HermHeip1983'; type = 'Article'; bib = [ ...
'author = {Herman, P.M.J. and Heip, C.}, ' ...
'year = {1983}, ' ...
'title  = {The respiration of five brackish-water harpacticoid copepod species}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {71}, ' ...
'number = {3}, ' ...
'pages = {249--256}, ' ...
'doi = {10.1016/0022-0981(83)90118-1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Koch2017'; type = 'Misc'; bib = [ ...
'author = {Koch, J.}, ' ... 
'year = {2017}, ' ...
'howpublished = {Data measured by Josef Koch}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

