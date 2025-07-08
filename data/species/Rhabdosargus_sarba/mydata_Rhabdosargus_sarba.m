function [data, auxData, metaData, txtData, weights] = mydata_Rhabdosargus_sarba

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Rhabdosargus_sarba'; 
metaData.species_en = 'Goldlined seabream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'bjMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2018 12 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 14]; 

%% set data
% zero-variate data

data.am = 10*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23.7;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 80;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*.08^3';
data.Wwp = 232;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02042*Lp^2.95, see F1';
data.Wwi = 8.4e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02042*Li^2.95, see F1';

data.Ri  = 1e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), fork length (cm)
0.007	9.302
0.028	9.809
0.047	7.949
0.050	12.008
0.090	10.824
0.092	13.361
0.919	26.544
0.938	24.684
0.939	25.360
0.978	23.161
0.994	16.734
0.994	17.241
0.995	18.932
0.996	19.947
0.997	20.455
0.997	20.793
1.018	22.146
1.034	15.549
1.038	21.131
1.925	32.284
1.927	34.145
1.936	19.599
1.950	37.527
1.957	20.783
1.958	21.459
1.962	27.548
1.963	28.732
1.964	29.916
1.977	19.429
1.979	22.981
1.980	23.658
1.981	25.180
1.981	25.856
1.982	26.533
1.983	27.548
2.001	24.334
2.001	24.672
2.035	42.938
2.933	41.237
2.945	29.736
2.951	38.024
2.952	39.039
2.953	39.884
2.953	40.561
2.965	29.060
2.966	30.751
2.967	31.766
2.967	32.442
2.968	33.288
2.968	33.288
2.968	33.795
2.969	33.964
2.969	34.472
2.969	34.641
2.969	34.641
2.970	36.501
2.982	24.324
2.990	35.486
3.001	22.970
3.952	37.337
3.956	43.087
3.958	45.117
3.971	34.969
3.971	35.814
3.974	39.028
3.975	41.226
3.976	41.903
3.990	33.954
4.001	47.653
4.002	49.683
4.008	30.232
4.957	42.569
4.958	43.922
4.960	46.121
4.961	46.797
4.961	47.981
4.962	49.165
4.963	50.180
4.975	38.510
4.975	39.186
4.976	40.539
4.977	41.385
5.941	46.956
5.942	47.802
5.963	48.647
5.964	49.155
5.964	49.662
5.964	50.000
5.965	50.677
5.966	51.861
6.011	57.611
6.019	41.205
6.019	42.051
6.986	49.990
6.987	51.174
6.988	52.527
6.989	53.372
6.991	57.093
7.006	49.313
7.970	53.700
7.971	54.884
7.971	56.068
7.973	58.267
7.974	59.620
7.980	41.184
8.007	49.302
8.976	59.947
9.035	56.733
10.013	54.017
10.014	55.370
11.003	65.169
11.040	60.771
12.964	64.303
16.032	68.668]; 
data.tL(:,1) = (0.75 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) * 1.06; % convertfork length to total length from photo
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RadeMann2002';

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
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02042*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase';
F2 = 'protogynous sequential hermaphrodite';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4RW83'; % Cat of Life
metaData.links.id_ITIS = '647978'; % ITIS
metaData.links.id_EoL = '46580010'; % Ency of Life
metaData.links.id_Wiki = 'Rhabdosargus_sarba'; % Wikipedia
metaData.links.id_ADW = 'Rhabdosargus_sarba'; % ADW
metaData.links.id_Taxo = '185878'; % Taxonomicon
metaData.links.id_WoRMS = '218621'; % WoRMS
metaData.links.id_fishbase = 'Rhabdosargus-sarba'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhabdosargus_sarba}}';
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
bibkey = 'RadeMann2002'; type = 'article'; bib = [ ...  
'author = {P. V. Radebe and B. Q. Mann and L. E. Beckley and A. Govender}, ' ...
'year = {2002}, ' ...
'title  = {Age and growth of \emph{Rhabdosargus sarba} ({P}isces: {S}paridae), from {K}waZulu-{N}atal, {S}outh {A}frica}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {58}, ' ...
'pages = {193-201}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Rhabdosargus-sarba.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

