function [data, auxData, metaData, txtData, weights] = mydata_Spermophilus_xanthoprymnus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Spermophilus_xanthoprymnus'; 
metaData.species_en = 'Asia Minor ground squirrel';

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg','0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 06 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 22]; 

%% set data
% zero-variate data

data.tg = 25.4;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'GurGur2010';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 47;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'GurGur2010';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '45-50 d';
data.tp = 1.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'GurGur2010';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'GurGur2010';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'males live shorter';
    
data.Wwb = 5.7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'GurGur2010';
data.Wwi = 328.8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'GurGur2010';

data.Ri  = 5.8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'GurGur2010';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 litter per yr, 5.8 pups per litter';

% uni-variate data

% time-weight data
data.tWw_f = [ ... % time in 1 Feb (d), weight (g)
24.964	54.691
32.730	71.051
41.051	89.334
46.044	116.231
54.920	127.801
63.796	144.168
70.453	179.711
77.664	198.947
92.642	223.029
100.964	241.311
116.496	223.179
144+172.526	169.801
144+181.401	170.817
144+188.058	180.454
144+196.380	201.615
144+201.927	219.880
144+210.248	240.082
144+226.336	311.186];
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f  = C2K(37.5);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'GurGur2005';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since in Feb (d), weight (g)
24.964	53.731
32.730	77.768
40.496	96.047
48.263	122.002
56.029	140.281
63.796	158.561
71.007	177.796
78.774	195.116
92.642	216.312
102.073	248.035
144+188.058	191.968
144+195.825	216.963
144+210.248	229.528
144+225.781	264.167];
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m  = C2K(37.5);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'GurGur2005';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;
weights.Wwi = 2 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'Males are assumed not to differ from females';
D2 = 'Food is assumed to vary';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4YKBM'; % Cat of Life
metaData.links.id_ITIS = '632458 '; % ITIS
metaData.links.id_EoL = '313012'; % Ency of Life
metaData.links.id_Wiki = 'Spermophilus_xanthoprymnus'; % Wikipedia
metaData.links.id_ADW = 'Spermophilus_xanthoprymnus'; % ADW
metaData.links.id_Taxo = '88385'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12401130'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spermophilus_xanthoprymnus}}';
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
bibkey = 'GurGur2005'; type = 'Article'; bib = [ ... 
'author = {Hakan G\"{u}r and Mutlu Kart G\"{u}r}, ' ... 
'year = {2005}, ' ...
'title = {Annual Cycle of Activity, Reproduction, and Body Mass of {A}natolian Ground Squirrels \emph{Spermophilus xanthoprymnus}) in {T}urkey}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {86(1)}, ' ...
'pages = {7-14}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GurGur2010'; type = 'Article'; bib = [ ... 
'author = {Mutlu Kart G\"{u}r and Hakan G\"{u}r}, ' ... 
'year = {2010}, ' ...
'title = {\emph{Spermophilus xanthoprymnus} ({R}odentia: {S}ciuridae)}, ' ...
'journal = {Mammalian Species}, ' ...
'volume = {42(864)}, ' ...
'pages = {183-194}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

