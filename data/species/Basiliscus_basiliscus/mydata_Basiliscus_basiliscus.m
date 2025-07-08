function [data, auxData, metaData, txtData, weights] = mydata_Basiliscus_basiliscus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Corytophanidae';
metaData.species    = 'Basiliscus_basiliscus'; 
metaData.species_en = 'Common basilisk'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 15];

%% set data
% zero-variate data

data.ab = 3*30.5;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'Wiki';   
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 20*30.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Deve1978';   
  temp.tp = C2K(28); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 16*30.5;  units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'Deve1978';   
  temp.tpm = C2K(28); units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 7*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 13.5;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'Deve1978';  
data.Lpm  = 13.0;    units.Lpm = 'cm';  label.Lpm = 'SVL at puberty for males';  bibkey.Lpm  = 'Deve1978';
data.Li  = 15.9;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'Deve1978';  
data.Lim  = 22.8;    units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Deve1978';  

data.Wwb = 2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Wiki';
data.Wwi = 160.1;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'Deve1978';
data.Wwim = 416.5;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';       bibkey.Wwim = 'Deve1978';

data.Ri  = 3.5*15/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(28);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10 to 20 eggs per clutch: 3 to 4 clutches per yr';

% univariate data
% time -  length data
data.tL_f = [ ... % age (month),  SVL (am)
4.031	5.140
4.452	5.193
4.603	5.670
4.921	5.591
5.234	5.830
6.431	6.943
7.056	7.447
7.367	7.845
7.639	7.288
8.937	8.667
9.248	9.064
9.307	8.640
9.832	8.826
10.749	10.973
11.033	9.621
11.406	12.909
11.465	12.511
11.866	10.390
11.995	12.326
12.720	9.727
12.819	13.652
13.201	12.830
13.203	12.697
13.248	13.227
13.296	13.545
13.552	14.076
13.698	11.371
13.748	11.557
13.929	13.545
13.991	12.936
14.046	12.750
14.179	10.947
14.306	13.015
14.355	13.307
15.423	12.432
15.567	13.413
15.598	11.345
16.037	13.731
16.145	10.019
16.243	14.023
16.331	11.742
16.415	13.148
17.019	15.083
17.038	13.837
17.257	13.254
17.286	14.871
18.194	14.102
18.567	13.864
18.615	14.182
18.942	13.545
19.045	13.652
19.428	12.803
19.573	13.625
19.616	14.288
20.142	14.420
20.286	11.848
20.411	14.076
20.827	14.500
20.830	14.261
21.042	14.208
21.516	14.288
21.935	14.473
22.311	14.049
22.420	13.811
22.517	14.394
22.589	13.121
22.831	14.553
22.992	14.394
24.429	13.572
24.463	14.818
24.655	12.538
24.732	14.420
26.189	15.773
26.723	15.348
26.935	15.295
27.202	15.110
27.580	14.553
28.578	14.845
28.804	13.864
28.992	15.348
29.788	15.030
30.306	15.693
32.971	13.943
34.941	16.250
36.648	15.030
39.178	15.163
39.848	16.250
45.698	16.674];
data.tL_f(:,1) = 30.5 * data.tL_f(:,1); % convert month to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL'};  
temp.tL_f   = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Deve1978';
comment.tL_f = 'Data for females';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '68CY9'; % Cat of Life
metaData.links.id_ITIS = '1056919'; % ITIS
metaData.links.id_EoL = '795614'; % Ency of Life
metaData.links.id_Wiki = 'Basiliscus_basiliscus'; % Wikipedia
metaData.links.id_ADW = 'Basiliscus_basiliscus'; % ADW
metaData.links.id_Taxo = '49095'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Basiliscus&species=basiliscus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Basiliscus_basiliscus}}';
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
bibkey = 'Deve1978'; type = 'Article'; bib = [ ... 
'author = {Robert Wayne Van Devender}, ' ... 
'year = {1978}, ' ...
'title = {GROWTH ECOLOGY OF A TROPICAL LIZARD, \emph{Basiliscus basiliscus}}, ' ...
'pages = {1031-1038}, ' ...
'volume = {59(5)}, ' ...
'journal = {Ecology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
