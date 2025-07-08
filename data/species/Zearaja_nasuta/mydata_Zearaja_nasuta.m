function [data, auxData, metaData, txtData, weights] = mydata_Zearaja_nasuta

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Zearaja_nasuta'; 
metaData.species_en = 'New Zealand rough skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 25];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 2*365; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(9.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'FranCaoi2001';   
  temp.am = C2K(9.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 27;   units.Lb  = 'cm';  label.Lb  = 'pelvic length at birth'; bibkey.Lb  = 'FranCaoi2001';
data.Lp  = 59;   units.Lp  = 'cm';  label.Lp  = 'pelvic length at puberty for females';   bibkey.Lp  = 'FranCaoi2001';
data.Lpm = 52;    units.Lpm  = 'cm';  label.Lpm  = 'pelvic length at puberty  for males';   bibkey.Lpm  = 'FranCaoi2001';
data.Li  = 91.3; units.Li  = 'cm';  label.Li  = 'pelvic length for females';   bibkey.Li  = 'FranCaoi2001';

data.Wwp = 4.11e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'FranCaoi2001';
  comment.Wwp = 'based on 0.021928*Lp^2.978, see F1';
data.Wwpm = 2.83e3; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for females';   bibkey.Wwpm = 'FranCaoi2001';
  comment.Wwpm = 'based on 0.021928*Lpm^2.978, see F1';
data.Wwi = 15.11e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'FranCaoi2001';
  comment.Wwi = 'based on 0.021928*Li^2.978, see F1';

data.Ri  = 2/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(9.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), pelvic length (cm)
0.018	24.247
0.893	23.166
0.921	26.100
0.976	29.189
1.962	33.050
2.907	40.309
2.908	44.324
2.935	41.853
3.948	46.023
3.949	52.046
3.961	46.641
3.962	47.413
3.962	48.031
3.962	49.112
3.962	50.193
3.962	51.274
3.963	54.054
3.963	55.290
3.977	57.297
4.921	57.606
4.921	58.378
4.923	68.263
4.935	59.305
4.948	56.680
4.949	63.012
4.961	52.355
4.962	54.981
4.962	55.598
4.962	60.077
4.963	62.085
5.893	62.085
5.893	62.857
5.893	63.629
5.893	64.710
5.894	65.792
5.894	67.954
5.894	68.880
5.894	69.653
5.906	59.768
5.906	60.849
5.908	67.027
5.919	55.290
5.920	58.069
6.918	58.842
6.919	64.556
7.932	67.799
7.959	62.239
8.945	70.270];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'pelvic length', 'female'};  
temp.tL_f = C2K(9.2); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FranCaoi2001';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), pelvic length (cm)
1.990	35.985
2.003	31.042
3.004	47.104
3.975	45.405
3.975	46.023
3.975	46.795
3.975	47.722
3.976	50.502
3.976	51.120
3.976	52.201
3.976	53.436
3.977	55.135
3.989	48.803
3.989	49.730
4.018	57.761
4.976	58.533
4.976	58.842
4.976	60.077
4.976	60.849
4.989	56.371
4.989	56.988
4.989	57.761
5.002	52.046
5.002	52.973
5.002	53.436
5.003	54.517
5.003	55.598
5.004	65.174
5.935	65.019
5.947	60.077
5.960	55.290
5.961	60.849
5.961	61.931
5.962	62.857
5.962	63.938
5.963	68.726
5.976	67.027
6.974	64.247
6.975	67.027];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'pelvic length', 'male'};  
temp.tL_m = C2K(9.2); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FranCaoi2001';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwp = 0 * weights.Wwp;
weights.Wwpm = 0 * weights.Wwpm;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} anf E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.021928*(PL in cm)^2.978';
metaData.bibkey.F1 = 'FranCaoi2001'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5CYBD'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46560638'; % Ency of Life
metaData.links.id_Wiki = 'Zearaja'; % Wikipedia
metaData.links.id_ADW = 'Zearaja_nasuta'; % ADW
metaData.links.id_Taxo = '1802401'; % Taxonomicon
metaData.links.id_WoRMS = '398319'; % WoRMS
metaData.links.id_fishbase = 'Zearaja-nasuta'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zearaja_nasuta}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FranCaoi2001'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00288330.2001.9517045}, ' ...
'author = {Malcolm P. Francis and Caoimhghin \''{O} Maolag\''{a}in and Darren Stevens}, ' ...
'year = {2001}, ' ...
'title  = {Age, growth, and sexual maturity of two {N}ew {Z}ealand endemic skates, \emph{Dipturus nasutus} and \emph{D. innominatus}}, ' ...
'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'volume = {35(4)}, ' ...
'pages = {831-842}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Zearaja-nasuta.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

