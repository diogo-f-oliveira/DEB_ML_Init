function [data, auxData, metaData, txtData, weights] = mydata_Litopenaeus_stylirostris

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Penaeidae';
metaData.species    = 'Litopenaeus_stylirostris'; 
metaData.species_en = 'Blue shrimp'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0bMb', 'bjMpe', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 28]; 

%% set data
% zero-variate data

data.am = 1.7*365;  units.am = 'd';     label.am = 'life span';                bibkey.am = 'LopeRaba2005';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 10.9;   units.Lp  = 'cm'; label.Lp  = 'abdominal length at puberty for females'; bibkey.Lp  = 'LopeRaba2005';
  comment.Lp = 'sealifebase gives total length 17 cm at puberty';
data.Lpm  = 10.9;   units.Lpm  = 'cm'; label.Lpm  = 'abdominal length at puberty for males'; bibkey.Lpm  = 'LopeRaba2005';
data.Li  = 16.15;   units.Li  = 'cm'; label.Li  = 'ultimate abdominal length for female';   bibkey.Li  = 'LopeRaba2005';
  comment.Li = 'sealifebase gives max total length 23 cm';
data.Lim  = 15.25;   units.Lim  = 'cm'; label.Lim  = 'ultimate abdominal length for male';   bibkey.Lim  = 'LopeRaba2005';

data.Wwb = 2.74e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on value for Palaemonetes varians';
data.Wwp = 34.9; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'sealifebase';
  comment.Wwp = 'based on 0.0071*(TL in cm)^3 for TL = 17 cm, see F1';
data.Wwi = 86.4;     units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'sealifebase';
  comment.Wwi = 'based on 0.0071*(TL in cm)^3 for TL = 23 cm, see F1';

data.GSI  = 0.14; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(28); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Haliporoides sibogae';
  
% uni-variate data
% time-length data
data.tL = [ ... % time since sept 1996 (mnth), abdomial length (cm)
    0 10.7
    1 11.2
    2 11.0
    3 11.4
    4 12.4
    5 12.3
    6 13.0
    7 14.0];
data.tL(:,1) = data.tL(:,1) * 30.5; % convert mnth to d
units.tL   = {'d', 'cm'};  label.tL = {'time since sept 1996', 'median abdomial length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LopeRaba2005';

% time-weight data
data.tW = [ ... % time (Wk), wet weight (g)
0.055	0.850
0.055	1.000
0.055	1.200
0.941	1.550
0.997	1.800
1.965	2.400
1.965	2.550
1.965	2.800
2.962	4.300
2.990	2.950
2.990	3.650
3.986	4.400
3.986	6.200
4.014	5.200
4.014	5.300
4.983	7.050
4.983	7.850
4.983	8.150
5.010	5.400
5.010	6.300
5.979	8.350
5.979	10.000
6.035	7.100
6.893	9.900
6.948	10.750
6.948	12.550
7.003	11.600
7.059	8.600
7.917	13.850
7.917	13.850
7.945	11.600
7.945	12.400
7.945	14.600
7.972	10.400];
data.tW(:,1) = data.tW(:,1) * 7; % convert wk to d
units.tW   = {'d', 'g'};  label.tW = {'time', 'average wet weight'};  
temp.tW    = C2K(28);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'KumaSure2009';
%
data.tW1 = [ ... % time (Wk), wet weight (g)
0.000	4.284
0.000	4.284
0.055	4.284
0.963	8.550
0.964	7.791
1.957	10.256
1.958	9.687
2.011	11.109
3.005	12.720
3.006	12.246
3.058	14.237
4.023	17.175
4.026	14.995
4.054	15.280
4.055	14.427
4.940	14.711
5.020	16.891
5.022	15.469
5.023	14.995
5.935	15.848
5.936	15.469
5.960	17.649
5.962	16.512
6.013	19.545
6.927	19.166
6.928	18.502
6.929	18.028
6.954	19.829
6.979	21.441
7.922	20.019
7.949	20.682
7.973	23.716
7.975	21.725];
data.tW1(:,1) = data.tW1(:,1) * 7; % convert wk to d
units.tW1   = {'d', 'g'};  label.tW1 = {'time', 'average wet weight'};  
temp.tW1    = C2K(28);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'KumaSure2009';

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

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.0071*(TL in cm)^3';
metaData.bibkey.F1 = 'sealifebase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '551681'; % ITIS
metaData.links.id_EoL = '1021452'; % Ency of Life
metaData.links.id_Wiki = 'Litopenaeus'; % Wikipedia
metaData.links.id_ADW = 'Litopenaeus_stylirostris'; % ADW
metaData.links.id_Taxo = '446645'; % Taxonomicon
metaData.links.id_WoRMS = '584982'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Litopenaeus}}';
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
bibkey = 'LopeRaba2005'; type = 'Article'; bib = [ ...
'author = {Juana L\''{o}pez-Mart\''{i}nez and Carlos R\''{a}bago-Quiroz and Manuel O. Nev\''{a}rez-Mart\''{a}nez and Alma Rosa Garc\''{i}a-Ju\''{a}rezc and Gabriel Rivera-Parrac and Jorge Ch\''{a}vez-Villalba}, ' ...
'year = {2005}, ' ...
'title = {Growth, reproduction, and size at first maturity of blue shrimp, \emph{Litopenaeus stylirostris} ({S}timpson, 1874) along the east coast of the {G}ulf of {C}alifornia, {M}exico}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {71}, ' ...
'pages = {93-102}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KumaSure2009'; type = 'Article'; bib = [ ...
'doi = {doi:10.1016/j.aquaculture.2009.02.028}, ' ...
'author = {K.P. Kumaraguru vasagam and A. Victor Suresh and George W. Chamberlain}, ' ...
'year = {2009}, ' ...
'title = {Growth performance of blue shrimp, \emph{Litopenaeus stylirostris} in self-cleaning microcosm tanks}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {290}, ' ...
'pages = {236-242}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Litopenaeus-stylirostris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
