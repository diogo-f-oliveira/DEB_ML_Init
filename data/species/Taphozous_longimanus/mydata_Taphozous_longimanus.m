function [data, auxData, metaData, txtData, weights] = mydata_Taphozous_longimanus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Emballonuridae';
metaData.species    = 'Taphozous_longimanus'; 
metaData.species_en = 'Long-winged tomb bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Wwe'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 27]; 

%% set data
% zero-variate data

data.tg = 86;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'KrisDomi1982';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 37;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'guess';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 278;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'value for Taphozous georgianus; males: 609 d';
data.am = 4*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Taphozous georgianus';

data.Wwb = 5.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'EoL';
data.Wwx = 12; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';  bibkey.Wwx = 'EoL';
data.Wwi = 25.11;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'EoL';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'KrisDomi1982';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 2 litters per yr';

% uni-variate data
% time-weight
data.tWe_1 = [ ... % foetal age (d), weight (g)
    14 0.0116
    42 0.2622
    70 1.5863
    87 2.9588
   105 5.1874];
units.tWe_1   = {'d', 'g'};  label.tWe_1 = {'age', 'foetal wet weight','1st pregnancy'};  
temp.tWe_1    = [ ... % time since jan 1 (d), mean daily temp (F)
0.000	60.966
16.081	60.690
37.849	66.759
56.894	72.828
76.846	78.897
96.792	86.621
117.655	91.862
138.983	94.345
163.049	92.966
189.396	88.552
212.105	86.069
235.714	85.517
257.959	85.517
282.939	82.483
306.112	77.241
324.751	70.345
342.022	65.103
363.841	57.931];
temp.tWe_1(:,2) = C2K(F2C(temp.tWe_1(:,2))); % convert F to K
units.temp.tWe_1 = 'K'; label.temp.tWe_1 = 'temperature';
start.tWe_1 = 25; units.start.tWe_1 = 'd'; label.start.tWe_1 = 'time since 1 jan to strat development';
bibkey.tWe_1 = {'KrisDomi1982','weatherspark'};
comment.tWe_1 = 'pregnancy starts mid-Jan to early-Feb, Varanasi, nrth India, 25 N';
%
data.tWe_2 = [ ... % foetal age (d), weight (g)
    10 0.0129
    46 1.4442
    73 4.1350];
units.tWe_2   = {'d', 'g'};  label.tWe_2 = {'age', 'foetal wet weight','2nd pregnancy'};  
temp.tWe_2    = temp.tWe_1;  units.temp.tWe_2 = 'K'; label.temp.tWe_2 = 'temperature';
start.tWe_2 = 189; units.start.tWe_2 = 'd'; label.start.tWe_2 = 'time since 1 jan to strat development';
bibkey.tWe_2 = {'KrisDomi1982','weatherspark'};
comment.tWe_2 = 'pregnancy starts early-Jun, Varanasi, nrth India, 25 N';

%% set weights for all real data
weights = setweights(data, []);
weights.tWe_1 = 3 * weights.tWe_1;
weights.tWe_2 = 5 * weights.tWe_2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.start = start;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWe_2','tWe_1'}; subtitle1 = {'Data for 2nd, 1st pragnancy'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
D3 = 'This species breeds throughout the yr in central India, 21 N; foetal development is assumed to be linked to local temperature (partial ectothermy at rest)';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '7WZCP'; % Cat of Life
metaData.links.id_ITIS = '631733'; % ITIS
metaData.links.id_EoL = '328809'; % Ency of Life
metaData.links.id_Wiki = 'Taphozous_longimanus'; % Wikipedia
metaData.links.id_ADW = 'Taphozous_longimanus'; % ADW
metaData.links.id_Taxo = '170048'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800938'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Taphozous_longimanus}}';
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
bibkey = 'KrisDomi1982'; type = 'Article'; bib = [ ... 
'doi = {10.1095/biolreprod27.2.351}, ' ...
'author = {Krishna, A. and Dominic, C. J.}, ' ... 
'year = {1982}, ' ...
'title = {Differential Rates of Fetal Growth in Two Successive Pregnancies in the Emballonurid Bat, \emph{Taphozous longimanus} {H}ardwicke}, ' ...
'journal = {Biology of Reproduction}, ' ...
'volume = {27(2)}, ' ...
'pages = {351–353}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/328809}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Taphozous_georgianus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'weatherspark'; type = 'Misc'; bib = ...
'howpublished = {\url{https://weatherspark.com/y/110718/Average-Weather-in-Varanasi-India-Year-Round}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


