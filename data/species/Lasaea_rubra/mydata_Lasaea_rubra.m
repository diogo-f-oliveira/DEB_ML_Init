function [data, auxData, metaData, txtData, weights] = mydata_Lasaea_rubra
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Galeommatida'; 
metaData.family     = 'Lasaeidae';
metaData.species    = 'Lasaea_rubra'; 
metaData.species_en = 'Bivalve'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Ap'};

metaData.T_typical  = C2K(5.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L_T'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 08]; 

%% set data
% zero-variate data

data.ab = 60; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'GratFoig1986';   
  temp.ab = C2K(11);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'GratFoig1986';   
  temp.am = C2K(11);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb  = 0.06; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'GratFoig1986';
data.Lp  = 0.11; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'GratFoig1986';
data.Li  = 0.32;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'GratFoig1986';

data.Wwi = 23e-3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Sphaerium corneum: 2.32*(0.32/1.486)^3';

% uni-variate data

% time-length 
data.tL = [ ... % time since 1 Aug (d), shell length (cm)
0.000	0.061
61.601	0.080
152.564	0.097
183.869	0.098
245.346	0.095
272.675	0.110
303.033	0.118
337.485	0.121];
data.tL(:,1) = data.tL(:,1) + 25; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'shell length'};  
temp.tL    = C2K(11);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GratFoig1986';
comment.tL = 'Data from Carnsore Point in south-east Ireland; temperature varies between 7 and 15 C';

% length-fecundity
data.LN = [ ... % shell length (cm), fecundity (#)
0.135	4.989
0.135	2.211
0.145	11.144
0.145	5.033
0.145	5.033
0.145	5.033
0.145	1.107
0.145	3.219
0.150	6.185
0.152	8.149
0.154	6.151
0.156	13.078
0.159	8.154
0.159	5.081
0.164	8.121
0.164	8.121
0.164	8.121
0.164	5.121
0.164	7.122
0.164	7.122
0.164	7.084
0.165	6.085
0.165	12.085
0.165	12.085
0.165	9.122
0.165	9.085
0.165	10.011
0.169	8.236
0.169	8.236
0.169	8.236
0.169	8.236
0.170	5.125
0.170	6.126
0.170	6.126
0.172	7.127
0.175	8.092
0.175	8.092
0.175	8.092
0.175	7.129
0.175	11.092
0.175	11.092
0.175	10.167
0.175	10.167
0.175	10.167
0.179	8.132
0.179	3.207
0.180	11.096
0.180	11.096
0.180	7.133
0.180	7.133
0.180	14.133
0.180	14.133
0.180	12.133
0.180	10.170
0.180	10.170
0.180	10.170
0.180	9.096
0.181	13.022
0.184	10.136
0.184	10.136
0.184	6.099
0.184	11.136
0.185	9.099
0.185	12.137
0.185	12.137
0.189	13.029
0.190	10.066
0.190	10.066
0.190	14.029
0.190	14.029
0.190	12.141
0.190	12.141
0.190	12.103
0.190	11.141
0.190	11.141
0.190	8.141
0.190	16.104
0.191	9.141
0.191	9.141
0.194	7.254
0.195	8.144
0.195	14.070
0.195	14.070
0.195	10.107
0.195	10.107
0.195	9.107
0.195	8.107
0.195	13.144
0.195	13.144
0.195	13.107
0.195	13.107
0.195	12.070
0.195	12.070
0.199	14.999
0.199	14.999
0.199	14.962
0.199	11.073
0.199	13.110
0.199	11.073
0.200	17.111
0.200	15.185
0.200	14.148
0.200	14.111
0.200	16.148
0.200	16.148
0.201	12.111
0.201	12.111
0.201	9.148
0.204	17.151
0.205	13.188
0.205	18.115
0.205	10.004
0.206	15.115
0.210	17.118
0.214	15.010
0.215	17.122
0.219	21.125
0.219	11.162
0.229	13.132
0.240	19.103];
units.LN   = {'cm', '#'};  label.LN = {'shell length', 'fecundity'};  
temp.LN    = C2K(11);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'GratFoig1986';
comment.LN = 'Data from Carnsore Point in south-east Ireland';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 3 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% discussion
D1 = 'Temerature in C for tL data varies with time in d as T(t)=11+4*sin(2*pi*(t+8)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'ovoviviparous hermaphrodite';
metaData.bibkey.F1 = 'GratFoig1986'; 
F2 = 'Seems to occur in the Antarctic as well';
metaData.bibkey.F2 = 'sealifebase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3SBTT'; % Cat of Life
metaData.links.id_ITIS = '80611'; % ITIS
metaData.links.id_EoL = '46470999'; % Ency of Life
metaData.links.id_Wiki = 'Lasaea_rubra'; % Wikipedia
metaData.links.id_ADW = 'Lasaea_rubra'; % ADW
metaData.links.id_Taxo = '432934'; % Taxonomicon
metaData.links.id_WoRMS = '140176'; % WoRMS
metaData.links.id_molluscabase = '140176'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lasaea_rubra}}';
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
bibkey = 'GratFoig1986'; type = 'Article'; bib = [ ... 
'author = {David Mc Grath and Diarmaid O Foighil}, ' ... 
'year = {1986}, ' ...
'title = {Population dynmaics and reproduction of hermaphrodotoc \emph{Lasaea rubra} ({M}ontagu) ({B}ivalvia, {G}aleommatacea}, ' ...
'journal = {Ophelia}, ' ...
'volume = {25(3)}, ' ...
'pages = {209-219}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Lasaea-rubra.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

