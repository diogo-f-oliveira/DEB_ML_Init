function [data, auxData, metaData, txtData, weights] = mydata_Odontocymbiola_magellanica

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Volutidae';
metaData.species    = 'Odontocymbiola_magellanica'; 
metaData.species_en = 'Magellanic volute'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCim'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 02]; 

%% set data
% zero-variate data

data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'BigaPenc2007';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.69; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'ArriPenc2018';
  comment.Lb = 'based on same relative length, compared to Adelomelon beckii: 1.72*20/49.5';
data.Lp  = 10.3; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty for female'; bibkey.Lp  = 'guess';
  comment.Lb = 'based on same relative length, compared to Adelomelon beckii: 25.6*20/49.5';
data.Li  = 20;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';              bibkey.Li  = 'BigaPenc2007';

data.Wwi = 410;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'BigaPenc2007';
  comment.Wwi = 'based on 10^(-4.7960+3.2201*log10(10*Li)), see F1';

data.Ri  = 1033/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on kap = 0.8';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
1.013	2.600
1.040	2.360
1.041	1.687
1.094	1.976
2.002	3.085
2.028	3.374
2.082	2.893
2.083	2.365
3.016	4.291
3.016	4.051
3.017	3.667
3.017	3.330
3.018	2.658
3.950	5.689
4.033	3.479
4.058	4.921
4.058	4.585
4.966	5.887
4.966	5.502
4.967	5.070
4.992	6.271
5.072	6.752
5.980	7.766
5.982	5.507
6.007	7.429
6.008	6.132
6.061	6.901
6.940	9.068
6.941	8.299
6.942	8.059
6.943	7.242
6.970	6.953
7.927	10.947
7.930	9.072
7.931	8.063
7.982	9.842
7.983	9.505
8.010	9.313
8.971	10.519
8.971	10.087
8.998	9.894
8.998	9.702
8.999	9.126
9.023	11.336
9.075	12.922
9.934	10.139
10.009	14.368
10.038	12.543
10.039	11.485
10.039	11.101
10.040	10.861
10.944	14.902
10.999	13.556
11.000	12.451
11.001	12.115
12.014	13.946
12.040	14.763
12.042	13.465
12.042	13.225
12.096	12.793
13.028	15.632
13.054	16.353
13.056	14.527
13.963	16.262
14.018	15.637
14.071	15.397
15.005	17.084
15.033	16.026
15.033	15.786
15.913	18.145
15.941	17.376
15.941	16.752
16.982	18.823
16.983	17.862
17.970	19.212
17.998	18.636
18.959	19.553
19.013	19.121
20.001	19.991];
data.tL(:,1) = 365*(0+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BigaPenc2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: log10(SFWM in g) = -4.7960 + 3.2201*log10(SL in mm)';
metaData.bibkey.F1 = 'BigaPenc2007';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '48PVZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4845755'; % Ency of Life
metaData.links.id_Wiki = 'Odontocymbiola_magellanica'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3972566'; % Taxonomicon
metaData.links.id_WoRMS = '384729'; % WoRMS
metaData.links.id_molluscabase = '384729'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Odontocymbiola_magellanica}}';
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
bibkey = 'BigaPenc2007'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00227-006-0401-6}, ' ...
'author = {Gregorio Bigatti and Pablo E. Penchaszadeh  and Maximiliano Cled\''{o}n}, ' ... 
'year = {2007}, ' ...
'title = {Age and growth in \emph{Odontocymbiola magellanica} ({G}astropoda: {V}olutidae) from {G}olfo {N}uevo, {P}atagonia, {A}rgentina}, ' ...
'journal = {Mar Biol}, ' ...
'volume = {150}, ' ...
'pages = {1199-1204}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArriPenc2018'; type = 'Article'; bib = [ ... 
'author = {Florencia Arrighetti and Pablo E. Penchaszadeh}, ' ... 
'year = {2018}, ' ...
'title = {Biology and conservation of the giant marine snail \emph{Adelomelon beckii} in {A}rgentina}, ' ...
'journal = {Tentacle}, ' ...
'volume = {26}, ' ...
'pages = {19-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
