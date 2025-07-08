function [data, auxData, metaData, txtData, weights] = mydata_Nerodia_harteri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Nerodia_harteri'; 
metaData.species_en = 'Brazos watersnake'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg','0iFm'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'L-dL'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 07];

%% set data
% zero-variate data

data.ab = 79;     units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'guess';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Nerodia_sipedon: 122*17.5/26.8';
data.am = 9.6*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Nerodia_sipedon';

data.Lb  = 17.5;    units.Lb  = 'cm';  label.Lb  = 'SVL at birth';      bibkey.Lb  = 'RossRoss2000';
data.Lp  = 46;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';      bibkey.Lp  = 'GreeDixo1999';
data.Lpm  = 38;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';      bibkey.Lpm  = 'GreeDixo1999';
data.Li  = 82.3;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'GreeDixo1999';
data.Lim  = 65.8;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';  bibkey.Lim  = 'guess';
  comment.Lim = 'based on Nerodia_sipedon: (82.3/103)*82.3';

data.Wwb = 3.8;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'RossRoss2000';
data.Wwi = 380;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Nerodia_sipedon: (82.3/103)^3*745';
  
data.dLb = 5/30.5;  units.dLb  = 'cm/d';  label.dLb  = 'change in SVL at birth';  bibkey.dLb  = 'RossRoss2000';
  temp.dLb = C2K(20); units.temp.dLb = 'K'; label.temp.dLb = 'temperature'; 

% univariate data
% length-fecundity
data.LN = [ ... % SVL (cm), yearly fecundity (#)
46.471	6.993
47.285	6.996
47.557	4.881
48.100	5.942
48.643	5.027
48.643	4.039
48.778	8.203
48.846	8.980
49.186	4.112
49.253	8.064
49.457	4.113
49.593	6.090
49.661	5.032
50.136	11.032
50.204	9.974
50.271	4.258
50.543	11.034
50.814	12.023
50.814	9.059
51.086	9.907
51.086	8.073
51.222	7.086
51.290	11.955
51.290	5.957
51.425	9.062
51.425	5.040
51.900	11.040
51.900	7.018
52.036	8.077
52.104	9.912
52.172	9.066
52.443	8.079
52.443	6.033
52.443	6.950
52.647	9.915
52.647	9.068
52.715	5.046
52.851	9.916
52.986	8.082
52.986	6.035
52.986	7.094
53.054	12.104
53.054	11.187
53.258	9.071
53.258	3.990
53.462	8.084
53.529	4.979
53.665	9.002
53.665	7.097
53.801	11.261
53.801	9.920
53.937	7.945
54.140	11.051
54.140	7.099
54.208	13.098
54.344	11.899
54.344	9.005
54.548	13.029
54.683	9.924
54.683	7.102
54.819	15.994
54.887	12.113
54.955	17.194
55.158	14.090
55.362	10.915
55.430	12.115
55.430	4.847
55.430	7.105
55.498	14.162
55.498	12.962
55.701	8.094
55.837	5.978
55.905	12.964
55.905	11.130
55.973	9.930
55.973	9.154
56.109	7.038
56.244	14.166
56.244	12.966
56.244	11.978
56.312	11.061
56.312	9.156
56.516	11.062
56.584	14.167
56.652	5.982
56.719	10.005
56.787	9.158
56.855	12.122
56.923	10.005
56.923	6.901
57.059	15.016
57.127	13.111
57.195	14.170
57.195	9.089
57.262	8.172
57.330	10.149
57.398	19.111
57.534	11.067
57.602	12.196
57.602	9.091
57.738	5.987
57.873	10.222
57.873	8.387
58.077	16.997
58.145	11.140
58.145	12.199
58.213	15.092
58.348	12.976
58.348	8.036
58.416	11.212
58.416	9.095
58.484	10.154
58.891	20.105
58.891	12.202
58.959	13.049
59.231	11.075
59.434	9.029
59.502	12.276
59.638	14.958
59.638	13.123
59.774	14.253
59.977	15.947
60.317	5.152
60.317	12.844
60.385	16.161
60.385	14.185
60.385	12.068
60.520	14.962
60.860	10.024
61.063	12.918
61.063	14.047
61.131	5.086
61.131	8.896
61.335	8.050
61.403	11.932
61.471	16.166
61.538	18.213
61.674	9.040
61.742	11.228
61.946	19.132
61.946	16.168
61.946	8.124
62.149	16.169
62.217	13.135
62.489	15.183
62.489	11.937
62.692	5.164
62.760	14.126
62.760	13.208
62.828	12.150
62.896	10.175
62.964	15.185
63.032	20.054
63.439	6.014
63.575	10.178
63.710	15.894
64.118	16.108
64.118	11.098
64.253	15.050
64.796	15.123
65.000	18.158
65.271	8.986
65.339	8.069
65.475	19.007
65.475	17.173
65.475	14.138
65.543	18.232
66.018	20.139
66.290	12.025
66.290	14.001
66.629	15.061
66.833	21.201
67.172	16.969
68.190	14.081
68.258	15.210
68.937	14.084
69.208	21.142
69.548	11.123
69.751	21.074
70.498	21.077
70.905	18.045
71.041	15.082
72.805	14.243
73.348	12.270
73.552	13.118
74.095	29.209
74.231	15.168
79.593	21.261
82.308	25.155];
units.LN  = {'d', '#'};  label.LN = {'time since birth', 'yearly fecundity'};  
temp.LN   = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'GreeDixo1999'; 

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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '476BM'; % Cat of Life
metaData.links.id_ITIS = '174249'; % ITIS
metaData.links.id_EoL = '791371'; % Ency of Life
metaData.links.id_Wiki = 'Nerodia_harteri'; % Wikipedia
metaData.links.id_ADW = 'Nerodia_harteri'; % ADW
metaData.links.id_Taxo = '485010'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Nerodia&species=harteri'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nerodia_harteri}}';
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
bibkey = 'GreeDixo1999'; type = 'article'; bib = [ ... 
'author = {Brian D. Greene and James R. Dixon and Martin J. Whiting and James M. Mueller}, ' ... 
'year = {1986}, ' ...
'title = {Reproductive Ecology of the {C}oncho Water Snake, \emph{Nerodia harteri paucimaculata}}, ' ...
'journal = {Copeia}, ' ...
'volune = {1999(2)}, ' ...
'pages = {701-709}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RossRoss2000'; type = 'article'; bib = [ ... 
'howpublished = {\url{https://cdn.ymaws.com/arav.site-ym.com/resource/resmgr/Files/Proceedings_2000/2000_31.pdf}}, ' ...
'author = {John Rossi and Roxanne Rossi}, ' ... 
'year = {2000}, ' ...
'title = {PRELIMINARY REPORT ON THE SURVIVAL, GROWTH, AND PROBLEMS OF CAPTIVE BORN BRAZOS WATER SNAKES, \emph{Nerodia harter harter}, RELEASED IN THE WILD, WITH IMPLICATIONS FOR HEAD STARTING AND SPECIES SURVIVAL}, ' ...
'journal = {2000 Proceedings Association of Reptilian and Amphibian veterinarians}, ' ...
'pages = {99-100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

