function [data, auxData, metaData, txtData, weights] = mydata_Bithynia_tentaculata
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Littorinimorpha'; 
metaData.family     = 'Bithyniidae';
metaData.species    = 'Bithynia_tentaculata'; 
metaData.species_en = 'Faucet snail'; 

metaData.ecoCode.climate = {'Cfb','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 22]; 

%% set data
% zero-variate data

data.am = 4*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'bioweb';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.12; units.Lb  = 'cm';  label.Lb  = 'shell height at birth';             bibkey.Lb  = 'Bren1995';
data.Lj  = 0.121; units.Lj  = 'cm';  label.Lj  = 'shell height at settlement';        bibkey.Lj  = 'Bren1995';
data.Lp  = 0.7; units.Lp  = 'cm';  label.Lp  = 'shell height at puberty for female'; bibkey.Lp  = 'Bren1995';
data.Li  = 1.1; units.Li  = 'cm';  label.Li  = 'ultimate shell length';              bibkey.Li  = 'Wiki';

data.Wdi  = 5.25e-3; units.Wdi  = 'g';  label.Wdi  = 'flesh dry weight at 6 mm';  bibkey.Wdi  = 'Bren1995';
 comment.Wdi = '21 mg including shell, 21/4 mg excluding';

data.Ri  = 23/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'bioweb';   
  temp.Ri = C2K(18);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), shell heigth (cm)
7.817	0.138
37.086	0.214
69.063	0.242
99.836	0.264
130.887	0.354
161.967	0.438
192.720	0.464
223.519	0.481
252.302	0.530
283.126	0.541
311.525	0.543
342.916	0.565
371.917	0.570
402.149	0.576
434.213	0.587
463.731	0.612
492.074	0.626
526.660	0.626];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bren1995';
comment.tL = 'Fed with Chlamydomonas, 10,000 cells/ml + lettuce';
%
data.tL0 = [ ... % time since birth (d), shell height (cm)
8.450	0.135
39.162	0.169
70.011	0.175
100.790	0.196
130.399	0.203
161.733	0.236
192.318	0.295
221.938	0.301
251.384	0.341
282.234	0.347
313.517	0.390
342.954	0.432
373.778	0.444
402.774	0.450
434.798	0.468
464.229	0.512
497.523	0.523
526.489	0.535];
units.tL0   = {'d', 'cm'};  label.tL0 = {'time since birth', 'shell height'};  
temp.tL0    = C2K(18);  units.temp.tL0 = 'K'; label.temp.tL0 = 'temperature';
bibkey.tL0 = 'Bren1995';
comment.tL0= 'fed with Chlamydomonas, 2,000 cells/ml;';
    
%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.tL = 10 * weights.tL;
weights.tL0 = 10 * weights.tL0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL0'}; subtitle1 = {'Fed with algae + lettuce, algae only'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'Temperature in C for tL data is assumed to vary for t in d as T(t) = 10 + 10*cos(2*pi*(t-250)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'This snail can filter-feed as well as take solid food';
metaData.bibkey.F1 = 'Bren1995';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'LXJH'; % Cat of Life
metaData.links.id_ITIS = '70794'; % ITIS
metaData.links.id_EoL = '492793'; % Ency of Life
metaData.links.id_Wiki = 'Bithynia_tentaculata'; % Wikipedia
metaData.links.id_ADW = 'Bithynia_tentaculata'; % ADW
metaData.links.id_Taxo = '35263'; % Taxonomicon
metaData.links.id_WoRMS = '182699'; % WoRMS not present
metaData.links.id_molluscabase = '182699'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Bithynia_tentaculata}}';
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
bibkey = 'Bren1995'; type = 'Article'; bib = [ ... 
'author = {Heinz Brendelberger}, ' ... 
'year = {1995}, ' ...
'title = {GROWTH OF JUVENILE \emph{Bithynia tentaculata} ({P}ROSOBRANCHIA, {B}ITHYNIIDAE) UNDER DIFFERENT FOOD REGIMES: A LONG-TERM LABORATORY STUDY}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {61}, ' ...
'pages = {89-95}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'bioweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://bioweb.uwlax.edu/bio203/2010/schmidt_ama3/reproduction.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
