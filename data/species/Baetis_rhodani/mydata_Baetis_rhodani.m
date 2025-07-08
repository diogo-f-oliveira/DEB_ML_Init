function [data, auxData, metaData, txtData, weights] = mydata_Baetis_rhodani 

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Ephemeroptera'; 
metaData.family     = 'Baetidae';
metaData.species    = 'Baetis_rhodani'; 
metaData.species_en = 'Large Dark Olive'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0eFl', '0eFp', '0eFm', 'eiTg'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'beH', 'beD', 'beS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj' ;'am'; 'Lb'; 'Lj'; 'Li'; 'Wwj'; 'Ni'};  
metaData.data_1     = {'T-ab'; 't-L'; 'L-Wd'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Andre Gergs'};                            
metaData.date_subm = [2017 05 25];                              
metaData.email    = {'gergs@gaiac.rwth-aachen.de'};            
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 07 19]; 


%% set data
% zero-variate data;
data.ab = 10.31;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'ElliHump1980';   
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 99;     units.tj = 'd';    label.tj = 'time since birth at emergence';     bibkey.tj = 'Hump1979';   
  temp.tj = C2K(14.3);  units.temp.tj = 'K'; label.temp.tj = 'temperature';   
data.am = 4;     units.am = 'd';    label.am = 'life span as (sub)imago';     bibkey.am = 'guess';
  temp.am = C2K(14.3);  units.temp.am = 'K'; label.temp.am = 'temeperature';   
   comment.Li = 'based on non-feeding (sub)imago'; 
    
data.Lb  = 0.053;   units.Lb  = 'cm';   label.Lb  = 'ultimate length nymph';  bibkey.Lb  = 'ElliHump1980'; 
data.Lj  = 1.06;   units.Lj  = 'cm';   label.Lj  = 'ultimate length nymph';  bibkey.Lj  = 'BaueSold2012'; 
data.Li  = 1.3;   units.Li  = 'cm';   label.Li  = 'ultimate length';    bibkey.Li  = 'BaueSold2012';

data.Wwj = 0.0206;   units.Wwj = 'g';    label.Wwj = 'maximum wet weight of nymph';             bibkey.Wwj = 'Zeli1984';
    comment.Wwj = 'estimated from length-weight regression';
    
data.Ni = 2463.7;   units.Ni = '#';    label.Ni = 'total number of eggs';             bibkey.Ni = 'ElliHump1980';   
  temp.Ni = C2K(15);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';

% uni-variate data 
% T-ab data
data.Tab = [ ... % temperature (C), age at birth
3.157	137.8
4.083	85.74
5.380	62.13
7.000	45.58
8.435	31.47
10.01	23.60
14.08	14.38
17.00	10.31
19.921	8.140
22.05	7.868
];
 data.Tab(:,2);
 units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'}; 
 bibkey.Tab = 'ElliHump1980';
 
% t-L data
% data from AGE UNKNOWN
data.tL = [ ...
    24.28	49.79	66.08	78.07	92.82	103.9	119.6	137.7; % d, experimental time 
    0.3691	0.4285	0.4834	0.5352	0.5809	0.6205	0.6555	0.7454]'; % cm, length t at f and T             
units.tL  = {'d', 'cm'};  label.tL = {'time since start of experiment', 'length'}; 
temp.tL  = C2K(8.1);  
units.temp.tL= 'K'; label.temp.tL= 'temperature';
units.temp.tL = 'K'; label.temp.tL = 'temperature'; bibkey.tL = 'Hump1979'; 

% body length - dry weight   
data.LW = [ ... % body length (cm), dry weights (g)
   0.359	0.35	0.326	0.27	0.317	0.283	0.367	0.311	0.322	0.337	0.28	0.285	0.348	0.47	0.239	0.363	0.302	0.309	0.363	0.591	0.583	0.613	0.589	0.559	0.593	0.589	0.622	0.7	0.583	0.563	0.493	0.65	0.535	0.589	0.548	0.652	0.461	0.576	0.543	0.302;
   0.00015	0.00017	0.00008	0.00004	0.00012	0.00008	0.00014	0.00008	0.00009	0.00009	0.00009	0.00007	0.00009	0.00026	0.00004	0.00014	0.00007	0.00007	0.00012	0.00048	0.00051	0.00051	0.00059	0.00049	0.00058	0.00042	0.0007	0.00107	0.00046	0.00046	0.00032	0.00064	0.00043	0.0005	0.00043	0.00072	0.00036	0.00061	0.00045	0.0001]';   
units.LW = {'cm', 'g'};     label.LW = {'body length', 'dry weights'};  
temp.LW  = C2K(5.8);  units.temp.LW = 'K'; label.temp.LW = 'temperature'; bibkey.LW = 'Beck2011'; 
[Y,I]=sort(data.LW(:,1)); data.LW=data.LW(I,:); % sort rows

% L-N data
data.LN = [ ... % length (cm), number of eggs (#)
0.65	663.10
0.64	616.50
0.66	624.30
0.64	589.30
0.65	616.50
0.66	593.20
0.65	573.80
0.65	597.10
0.70	787.40
0.70	764.10
0.70	736.90
0.70	709.70
0.69	748.50
0.71	771.80
0.71	748.50
0.75	1001.00
0.75	977.70
0.75	946.60
0.75	919.40
0.75	888.30
0.75	834.00
0.75	872.80
0.76	931.10
0.80	1211.00
0.80	1183.00
0.80	1160.00
0.80	1110.00
0.81	1090.00
0.80	1067.00
0.80	1036.00
0.80	1005.00
0.90	1750.00
0.90	1723.00
0.90	1743.00
0.90	1653.00
0.91	1622.00
0.89	1587.00
0.90	1552.00
0.90	1510.00
0.91	1490.00
0.95	2073.00
0.96	2026.00
0.96	1980.00
0.94	1925.00
0.96	1914.00
0.95	1890.00
0.96	1817.00
0.95	1793.00
1.00	2306.00
1.00	2271.00
1.01	2220.00
1.00	2205.00
1.02	2197.00
1.00	2158.00
1.01	2158.00
1.01	2034.00
1.01	2007.00
1.05	2527.00
1.04	2484.00
1.06	2504.00
1.06	2477.00
1.06	2519.00
1.06	2461.00
1.05	2434.00
1.06	2399.00
1.06	2368.00];
[Y,I] = sort(data.LN(:,1)); data.LN = data.LN(I,:); % sort rows  data.LN(:,2);
units.LN   = {'cm', '#'};  label.LN = {'length', 'egg number'}; 
bibkey.LN = 'ElliHump1980'; comment.LN = 'data from summer generation only';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Acknowledgment
metaData.acknowledgment = 'This entry was financially supported by the CEFIC Long-range Research Initiative (project number ECO28)';

%% Links
metaData.links.id_CoL = 'KD2J'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3683090'; % Ency of Life
metaData.links.id_Wiki = 'Baetis_rhodani'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '17370'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS


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
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Baetis}},'...
'note = {Accessed : 2017-03-31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hump1979'; type = 'Article'; bib = [ ... 
'author = {Humpesch, U.H.}, ' ... 
'year = {1979}, ' ...
'title = {Life cycles and growth rates of \emph{Baetis spp.}({E}phemeroptera: {B}aetidae) in the laboratory and in two stony streams in {A}ustria}, ' ...
'journal = {Freshwater Biology}, ' ...
'volume = {9}, ' ...
'pages = {467--479}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Zeli1984'; type = 'Article'; bib = [ ... 
'author = {Zelinka, M.}, ' ... 
'year = {1984}, ' ...
'title = {Production of several species of mayfly larvae}, ' ...
'journal = {Limnologica}, ' ...
'volume = {15}, ' ...
'number = {1}, '...
'pages = {21--41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'ElliHump1980'; type = 'Article'; bib = [ ...
'author = {Elliott, J. M. and Humpesch, U. H.}, ' ... 
'year = {1980}, ' ...
'title = {Eggs of Empemeroptra}, ' ...
'journal = {Annual Report Freshwater Biological Association}, ' ...
'volume = {48}, ' ...
'pages = {41--52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
 bibkey = 'Beck2011'; type = 'PhDthesis'; bib = [ ... 
'author = {Becker, D.}, ' ...
'year = {2011}, ' ...
'title  = {Sensitivity distinctions of lotic insect larvae exposed to imidacloprid}, ' ...
'school = {RWTH Aachen University}, ' ...
'pages = {Table 9-30 (page 122)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
 bibkey = 'BaueSold2012'; type = 'Book'; bib = [ ...  
'author = {Bauernfeind, E. and Sold\''{a}n, T.}, ' ...
'year = {2012}, ' ...
'title  = {The Mayflies of Europe (Ephemeroptera)}, ' ...
'publisher = {Apollo Books}, ' ...
'pages = {170--171}, ' ...
'howpublished = {ISBN13:9788788757453}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

