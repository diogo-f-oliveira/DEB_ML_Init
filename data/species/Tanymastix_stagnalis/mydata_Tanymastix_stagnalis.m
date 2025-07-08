function [data, auxData, metaData, txtData, weights] = mydata_Tanymastix_stagnalis
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Tanymastigidae';
metaData.species    = 'Tanymastix_stagnalis'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'TPa','THp'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp','biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'Lb'; 'Lp'; 'Li'; 'Wdi'}; 
metaData.data_1     = {'t-L_T'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 20]; 

%% set data
% zero-variate data

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'Mura1991';
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 20;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Mura1991';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 60;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Mura1991';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.075; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'Mura1991';
data.Lp  = 0.8;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Mura1991';
data.Li  = 1.7;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Mura1991';
  
data.Wdi  = 0.0084;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(1.7/1)^3';

% uni-variate data
% time-length
data.tL_1987 = [ ... % time since birth (d), length (cm)
 0	0.052
 7	0.526
14	0.696
21	0.727
28	1.015
35	1.144
42	1.196
49	1.294];
units.tL_1987   = {'d', 'cm'}; label.tL_1987 = {'time since birth', 'length', '1987'};  
units.temp.tL_1987 = 'C'; label.temp.tL_10f = 'temperature'; 
bibkey.tL_1987 = 'Mura1991'; comment.tL_1987 = 'Pantani di Forca Canapine in 1087';
temp.tL_1987 = [ ...
-1.235	15.816
6.270	19.922
14.773	18.371
20.737	12.276
28.232	15.488
34.358	23.091
42.550	25.188
48.572	24.006];
%
data.tL_1988 = [ ... % time since birth (d), length (cm)
0.000	0.101
12.548	0.505
22.578	1.162
33.586	1.333
60.608	1.629];
units.tL_1988   = {'d', 'cm'}; label.tL_1988 = {'time since birth', 'length', '1988'};  
units.temp.tL_1988 = 'C'; label.temp.tL_1988 = 'temperature'; 
bibkey.tL_1988 = 'Mura1991'; comment.tL_1988 = 'Pantani di Forca Canapine 1988';
temp.tL_1988 = [ ...
0.769	12.095
12.671	15.270
35.568	15.473
64.396	16.689];

% temperature-time since birth at puberty
data.LN = [ ... % length (cm), fecundity (#)
0.708	5.770
1.002	10.607
1.006	7.678
1.006	6.668
1.012	8.690
1.015	9.601
1.095	9.221
1.095	8.615
1.098	9.828
1.099	8.111
1.101	14.071
1.102	5.586
1.103	30.637
1.104	15.890
1.104	13.365
1.105	11.042
1.105	10.436
1.110	22.761
1.194	10.059
1.195	9.453
1.195	30.766
1.197	15.918
1.203	47.839
1.206	20.264
1.209	19.861
1.296	18.979
1.300	11.303
1.302	22.819
1.303	11.910
1.306	14.032
1.402	20.223
1.402	15.071
1.404	29.011
1.405	17.699
1.411	23.155
1.506	35.608
1.510	52.074
1.553	45.016
1.559	47.240
1.602	35.738
1.705	30.921];
units.LN   = {'cm', 'N'}; label.LN = {'length', 'egg per brood'};  
temp.LN = C2K(15); units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'Mura1991'; comment.LN = 'reprod period is 4 wks, 3 broods assumed';

%% set weights for all real data
weights = setweights(data, []);
weights.Wdi = weights.Wdi * 3;
weights.Li = weights.Li * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_1988','tL_1987'}; subtitle1 = {'Data for 1988, 1987'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to not differ from females'; 
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54PRZ'; % Cat of Life
metaData.links.id_ITIS = '624240'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Tanymastigidae'; % Wikipedia
metaData.links.id_ADW = 'Tanymastix_stagnalis'; % ADW
metaData.links.id_Taxo = '949970'; % Taxonomicon
metaData.links.id_WoRMS = '1047579'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Branchinecta_gigas}}';
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
bibkey = 'Mura1991'; type = 'Article'; bib = [ ... 
'author = {Graziella Mura}, ' ... 
'year = {1991}, ' ...
'title = {Life history and interspecies relationships of \emph{Chirocephalus diaphanus} Pr\''{e}vost and \emph{Tanymastix stagnalis} ({L}.), ({C}rustacea, {A}nostraca) inhabiting a group of mountain ponds in {L}atium, {I}taly}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {212}, ' ...
'pages = {45-59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
