function [data, auxData, metaData, txtData, weights] = mydata_Ceriodaphnia_silvestrii
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Ceriodaphnia_silvestrii'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN','TP','TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'}; 
metaData.data_1     = {'t-L'; 't-R'; 'L-Wd'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 11]; 

%% set data
% zero-variate data

data.ab = 1.62;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'SantMelao2006';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 2.63;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'SantMelao2006';   
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 36.5;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'SantMelao2006';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0350; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'SantMelao2006';
data.Lp  = 0.0720; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SantMelao2006';
data.Li  = 0.102;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SantMelao2006';
  
% uni-variate data
% time-length
data.tLR = [ ... % instar (#), length (mm), cum offspring (#)
 1	0.372   0
 2	0.457   0
 3	0.619   3.406
 4	0.780   8.352
 5	0.841  16.415
 6	0.871  33.578
 7	0.900  43.979
 8	0.928  43.979
 9	0.952  53.080
10	0.970  60.104
11	0.976  67.906
12	0.991  74.411
13	0.991  80.654
14	0.991  85.860
15	0.994  92.104
16	0.998  99.128
17	1.004 103.813
18	1.008 109.278
19	1.019 115.002
20	1.019 116.832
21	1.037 117.621
22	1.042 117.372];
data.tLR(:,1) = data.tLR(:,1) - 1; % start counting from 0
data.tLR(:,1) = data.tLR(:,1)*1.66; % convert instar # to d
data.tLR(:,2) = data.tLR(:,2)/10; % convert mm to cm
units.tLR   = {'d', 'cm','#'};  label.tLR = {'time since birth', 'length','cumulative offspring'};  
temp.tLR    = C2K(25);  units.temp.tLR = 'K'; label.temp.tLR = 'temperature';
bibkey.tLR = 'SantMelao2006'; treat.tLR = {1, {'length','cum reprod'}};
comment.tLR = 'autoclaved filtered natural water with Scenedesmus bijugus';

% length-dry weight
data.LWd = [ ... length (cm), dry weight (mug)
0.033	1.173
0.034	1.362
0.034	1.515
0.054	2.190
0.056	1.967
0.057	2.273
0.071	5.461
0.072	4.623
0.074	5.992
0.075	5.119
0.075	5.591];
units.LWd   = {'cm', 'mug'};  label.LWd = {'length','dry weight'};  
bibkey.LWd = 'SantMelao2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tLR = 3 * weights.tLR; weights.tLR(end-6:end,2) = 0;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = 'SY79'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46946504'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5306895'; % Taxonomicon
metaData.links.id_WoRMS = '1302391'; % WoRMS

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
bibkey = 'SantMelao2006'; type = 'Article'; bib = [ ... 
'author = {M. A. P. F. dos Santos and Mel\~{a}o, M. G. G. and Lombardi, A. T.}, ' ... 
'year = {2006}, ' ...
'title = {Life history characteristics and production of \emph{Ceriodaphnia silvestrii} {D}aday ({C}rustacea, {C}ladocera) under different experimental conditions}, ' ...
'journal = {Acta Limnol. Bras.}, ' ...
'volume = {18(2)}, ' ...
'pages = {199-212}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
