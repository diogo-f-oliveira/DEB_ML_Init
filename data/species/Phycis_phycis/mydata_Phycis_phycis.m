function [data, auxData, metaData, txtData, weights] = mydata_Phycis_phycis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Phycidae';
metaData.species    = 'Phycis_phycis'; 
metaData.species_en = 'Forkbeard'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};           
metaData.date_subm = [2019 01 10]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 10]; 

%% set data
% zero-variate data;

data.tp = 4.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty';     bibkey.tp = 'VieiNeve2014';   
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 18*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'VieiNeve2014';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 37;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'VieiNeve2014';
  comment.Lp = 'based on tL data at 4.5 yr';
data.Li  = 67.5;     units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'VieiNeve2014';

data.Wwb  = 2.7e-4;   units.Wwb  = 'g';   label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp  = 567;  units.Wwp  = 'g';   label.Wwp  = 'ultimate wet weight';    bibkey.Wwp  = 'VieiNeve2014';
  comment.Wwp = 'based on W = 0.0049*Lp^3.2286, see F1';
data.Wwi  = 3.9e3;  units.Wwi  = 'g';   label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'VieiNeve2014';
  comment.Wwi = 'based on W = 0.0049*Li^3.2286, see F1';

data.Ri = 2e6/365;   units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Pseudophycis bachus';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
1.012	19.408
1.988	20.298
1.988	21.169
1.988	22.040
1.988	23.021
1.988	24.110
1.988	24.873
1.988	25.308
1.988	25.635
1.988	26.071
1.988	26.507
1.988	26.725
1.988	27.705
1.988	28.359
1.988	29.448
1.988	30.537
1.988	31.191
1.988	32.280
1.988	33.260
2.972	37.418
2.972	38.289
2.991	32.080
2.991	33.061
2.991	33.497
2.991	33.932
2.991	34.368
2.991	34.804
2.991	36.656
3.000	27.179
3.000	28.268
3.000	31.427
3.009	29.031
3.009	29.902
3.009	30.556
3.009	35.567
3.975	37.872
3.975	38.307
3.975	38.743
3.975	38.743
3.975	38.961
3.985	37.327
3.985	39.833
3.994	32.534
3.994	35.693
4.979	45.079
4.988	39.960
4.997	45.733
5.006	41.812];
data.tL_f(:,1) = (0.75 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};   label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MatiFerr2011';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
0.995	16.231
0.995	17.647
1.005	9.804
1.005	13.943
2.000	13.617
2.000	16.449
2.000	17.429
2.000	18.301
2.000	31.590
2.009	19.499
2.009	20.370
2.009	20.915
2.009	29.412
2.018	21.351
2.018	21.678
2.018	22.222
2.018	22.549
2.018	27.342
2.018	28.431
2.028	23.856
2.028	24.946
2.028	25.926
2.028	26.580
2.037	23.420
2.986	31.481
2.986	33.878
2.995	25.817
2.995	27.124
2.995	28.214
2.995	29.739
2.995	30.065
2.995	30.392
2.995	30.828
2.995	35.185
2.995	36.492
3.005	28.867
3.005	32.571
3.991	37.364
3.991	37.908
3.991	38.562
4.000	32.571
4.000	33.769
4.000	34.314
4.000	34.858
4.000	35.621
4.995	40.850];
data.tL_m(:,1) = (0.75 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};   label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MatiFerr2011';
comment.tL_m = 'Data for males';

data.tL = [ ...
   0 15.5 
   1 21.5 
   2 25.9 
   3 29.8 
   4 35.1 
   5 39.3 
   6 43.1 
   7 46.2 
   8 48.5 
   9 51.0 
  10 53.1 
  11  54.8 
  12  57.4 
  13  60.6 
  14  61.6 
  16  65.9 
  17  65.7 
  18  67.1];
data.tL(:,1) = (0.75 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'};   label.tL = {'time since birth', 'total length', 'sexes combined'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VieiNeve2014';
comment.tL = 'Sexes combined';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL','tL_m'}; subtitle1 = {'Data for females, combined, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: wet weight in g = 0.0049*(TL in cm)^3.2286';
metaData.bibkey.F1 = 'VieiNeve2014';
F2 = 'no sexual dimorphism';
metaData.bibkey.F2 = 'VieiNeve2014';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4GYHV'; % Cat of Life
metaData.links.id_ITIS = '164752'; % ITIS
metaData.links.id_EoL = '46565096'; % Ency of Life
metaData.links.id_Wiki = 'Phycis_phycis'; % Wikipedia
metaData.links.id_ADW = 'Phycis_phycis'; % ADW
metaData.links.id_Taxo = '44348'; % Taxonomicon
metaData.links.id_WoRMS = '126502'; % WoRMS
metaData.links.id_fishbase = 'Phycis-phycis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phycis_phycis}}';
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
bibkey = 'MatiFerr2011'; type = 'Article'; bib = [ ... 
'author = {Sanja Mati\''{c}-Skoko and Josipa Ferri and Frane \v{S}keljo and Vlasta Bartulovi''{c} and Katarina Glavi\''{c} and Branko Glamuzina}, ' ... 
'year = {2011}, ' ...
'title = {Age, growth and validation of otolith morphometrics as predictors of age in the forkbeard, \emph{Phycis phycis} ({G}adidae)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {112}, ' ...
'pages = {52-58}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VieiNeve2014'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0025315413001549}, ' ...
'author = {Ana Rita Vieira and Ana Neves and Vera Sequeira and Rafaela Barros Paiva and Leonel Serrano Gordo}, ' ... 
'year = {2014}, ' ...
'title = {Age and growth of forkbeard, \emph{Phycis phycis}, in {P}ortuguese continental waters}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {94}, ' ...
'pages = {623-630}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://www.fishbase.se/summary/Phycis-phycis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
