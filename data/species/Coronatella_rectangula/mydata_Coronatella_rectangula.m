function [data, auxData, metaData, txtData, weights] = mydata_Coronatella_rectangula
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Chydoridae';
metaData.species    = 'Coronatella_rectangula'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN','TP','TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(23.6); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 10]; 

%% set data
% zero-variate data

data.ab = 1.68;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'VitiOrlan2013';   
  temp.ab = C2K(23.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 2.48;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'VitiOrlan2013';   
  temp.tp = C2K(23.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 46;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'VitiOrlan2013';   
  temp.am = C2K(23.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0204; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'VitiOrlan2013';
data.Lp  = 0.0340; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'VitiOrlan2013';
data.Li  = 0.0468;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'VitiOrlan2013';

data.Wwi  = 1.1e-5;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on length 0.047 cm, height 0.03 cm, width 0.0100 cm ; pi/4*0.047*0.03*0.01'; 

data.Ri  = 1.98/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'VitiOrlan2013';   
  temp.Ri = C2K(23.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.98 eggs per brood, brood interval 2 d';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (mm)
0.000	0.203
1.033	0.265
2.002	0.301
2.863	0.335
4.023	0.335
4.924	0.356
5.971	0.373
7.021	0.382
7.889	0.390
8.978	0.389
9.883	0.395
10.968	0.407
11.947	0.409
12.962	0.409
13.973	0.426
14.914	0.433
15.966	0.433
16.909	0.435
17.960	0.437
18.939	0.438
19.990	0.444
21.004	0.450
21.983	0.449
22.924	0.457
23.902	0.462
24.953	0.464
25.969	0.464
26.985	0.464
27.964	0.464
28.907	0.467
29.959	0.467];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(23.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VitiOrlan2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = 'YGZZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '40202590'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5328139'; % Taxonomicon
metaData.links.id_WoRMS = '1303005'; % WoRMS

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
bibkey = 'VitiOrlan2013'; type = 'Article'; bib = [ ... 
'author = {Thais Viti and C\''{e}lio Wisniewskiand Tereza Cristina Orlando and Maria Jos\''{e} dos Santos-Wisniewski}, ' ... 
'year = {2013}, ' ...
'title = {Life history, biomass and production of \emph{Coronatella rectangula} ({B}ranchiopoda, {A}nomopoda, {C}hydoridae) from {M}inas {G}erais}, ' ...
'journal = {Iheringia, S\''{e}rie Zoologia, Porto Alegre}, ' ...
'volume = {103(2)}, ' ...
'pages = {110-117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
