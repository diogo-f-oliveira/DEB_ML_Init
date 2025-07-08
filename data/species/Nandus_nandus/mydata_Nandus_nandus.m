function [data, auxData, metaData, txtData, weights] = mydata_Nandus_nandus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anabantiformes'; 
metaData.family     = 'Nandidae';
metaData.species    = 'Nandus_nandus'; 
metaData.species_en = 'Gangetic leaffish'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fc', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 25];

%% set data
% zero-variate data

data.ab = 3; units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 3 * 365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'AhamAkte2024';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9.1;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 20;   units.Li  = 'cm';   label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.65e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at puberty';     bibkey.Wwb = 'RahmMall2023';
  comment.Wwb = 'based on egg diameter of 0.68 mm: pi/6*0.068^3';
data.Wwp = 9.5; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01175*Lp^3.03, see F1';
data.Wwi = 102.8; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^3.03, see F1';
 
% uni-variate data
% time-length
data.tL = [ ... % time  (d), total length (cm)
250.466	5.643
311.509	6.981
365+5.704	8.360
365+33.818	8.820
365+63.040	9.239
365+92.269	9.991
365+124.816	10.203
365+185.479	11.000
365+219.149	11.960
365+279.836	14.004
365+313.117	13.925
365+341.241	14.926
730+6.178	14.015
730+95.323	15.147
730+124.922	15.941
730+311.679	16.170];
data.tL(:,1) = data.tL(:,1) - 30; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AhamAkte2024'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
5.009	1.970
5.233	2.526
5.334	2.666
5.536	2.668
5.626	2.669
5.739	3.086
5.795	2.948
5.997	3.504
6.120	3.644
6.233	3.506
6.423	4.201
6.480	4.479
6.614	4.480
6.704	4.619
6.884	4.898
7.030	5.454
7.086	5.870
7.232	5.733
7.299	6.150
7.490	6.151
7.602	6.845
7.692	7.123
7.816	7.263
7.905	7.680
8.006	8.374
8.119	8.098
8.197	8.930
8.332	9.070
8.489	9.903
8.601	10.597
8.725	10.459
8.837	11.015
8.905	11.570
9.051	11.571
9.107	11.710
9.163	12.126
9.320	12.682
9.387	12.960
9.500	13.931
9.578	14.486
9.690	14.487
9.769	15.042
9.904	15.737
10.027	16.292
10.095	16.708
10.218	17.541
10.387	18.236
10.634	19.485
10.723	20.179
10.802	20.595
10.869	21.289
11.038	22.122
11.217	22.955
11.318	24.065
11.543	25.314
11.588	25.869
11.835	27.118
12.138	29.200
12.273	29.894
12.374	30.726
12.508	32.252
12.666	33.223
12.845	34.749
12.924	35.305
13.103	37.246
13.429	40.298
13.541	41.269
13.631	41.686
13.856	44.182
13.923	45.153
14.103	46.817
14.316	48.898];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'HossHoss2017'; 

% length-fecundity
data.LN = [ ... % log10 length (cm), log10 fecundity (#)
1.075	4.066
1.077	4.070
1.079	4.030
1.081	4.055
1.082	4.053
1.086	4.043
1.087	4.028
1.088	4.020
1.090	4.043
1.091	4.094
1.093	4.067
1.094	4.064
1.095	4.078
1.096	4.070
1.097	4.101
1.099	4.095
1.100	4.063
1.102	4.025
1.103	4.070
1.105	4.062
1.105	4.096
1.108	4.070
1.109	4.056
1.110	4.087
1.112	4.098
1.114	4.086
1.114	4.101
1.118	4.096
1.119	4.103
1.121	4.119
1.121	4.094
1.123	4.123
1.126	4.104
1.129	4.136
1.130	4.135
1.132	4.101
1.135	4.137
1.137	4.164
1.140	4.164
1.140	4.203
1.142	4.175
1.144	4.215
1.147	4.185
1.149	4.222
1.153	4.203
1.154	4.219
1.159	4.215
1.163	4.183
1.183	4.237
1.186	4.232
1.194	4.279
1.207	4.293
1.211	4.290
1.213	4.300
1.218	4.302];
data.LN = 10.^data.LN; % remove log transform
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(28);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'RahmMall2023'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Wwi and Wwp ignored due to inconsistency with tL and tW data';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '45LSM'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46581253'; % Ency of Life
metaData.links.id_Wiki = 'Nandus_nandus'; % Wikipedia
metaData.links.id_ADW = 'Nandus_nandus'; % ADW
metaData.links.id_Taxo = '45440'; % Taxonomicon
metaData.links.id_WoRMS = '281633'; % WoRMS
metaData.links.id_fishbase = 'Nandus-nandus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nandus_nandus}}';
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
bibkey = 'AhamAkte2024'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.heliyon.2024.e38167}, ' ...
'author = {Ferdous Ahamed and Tanjila Akter and Md Mahidi Hasan Shajib and Mehedi Hasan Shamim and Mst Kaniz Fatema and Uttam Chakma and Zoarder Faruque Ahmed}, ' ... 
'year = {2024}, ' ...
'title = {Estimation of life history parameters of the {G}angetic leaffish, \emph{Nandus nandus} from southern coastal waters of {B}angladesh: {I}mplications for sustainable management}, ' ...
'journal = {Heliyon}, ' ...
'volume = {10}, ' ...
'pages = {e38167}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HossHoss2017'; type = 'Article'; bib = [ ... 
'author = {Md. Yeamin Hossain and Md. Alomgir Hossen and Dalia Khatun and Fairuz Nawer and Most. Farida Parvin and  Obaidur Rahman and Md. Akhtar Hossain}, ' ... 
'year = {2017}, ' ...
'title = {Growth, Condition, Maturity and Mortality of the {G}angetic Leaffish \emph{Nandus nandus} ({H}amilton, 1822) in the {G}anges {R}iver ({N}orthwestern {B}angladesh)}, ' ...
'journal = {Jordan Journal of Biological Sciences}, ' ...
'volume = {10(1)}, ' ...
'pages = {57-267}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RahmMall2023'; type = 'Article'; bib = [ ... 
'doi = {10.9734/AJOB/2023/v17i3324}, ' ...
'author = {Mohammad Lutfar Rahman and Md. Khaled Monsur Mallik and Anukul Chandra Sinha and Ibrahim Rashid  and Mohammad Abdus Salam}, ' ... 
'year = {2023}, ' ...
'title = {Observations of Reproductive Biology and the Gonadal Cycle of Endangered \emph{Nandus nandus} ({H}amilton, 1822)}, ' ...
'journal = {Asian Journal of Biology}, ' ...
'volume = {17(3)}, ' ...
'pages = {17-28}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Nandus-nandus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

