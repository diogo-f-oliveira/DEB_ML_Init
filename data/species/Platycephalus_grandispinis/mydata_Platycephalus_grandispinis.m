function [data, auxData, metaData, txtData, weights] = mydata_Platycephalus_grandispinis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Platycephalidae';
metaData.species    = 'Platycephalus_grandispinis'; 
metaData.species_en = 'Longspine flathead'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW', 'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 04];

%% set data
% zero-variate data

data.ab = 8.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 18*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CoulHall2017';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 17.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 38;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 0.9 mm of P indicus: pi/6*0.09^3'; 
data.Wwi = 333.2; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^3.04, see F1';

data.GSI  = 0.04;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'CoulHall2017';   
  temp.GSI = C2K(22);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.536	17.229
0.670	19.647
0.670	9.370
0.937	10.882
1.071	15.718
1.205	18.741
1.338	21.159
1.339	14.509
1.473	13.904
1.607	16.776
2.009	23.728
2.277	21.008
2.678	26.599
2.679	24.786
2.680	19.496
2.681	17.229
2.946	23.426
2.947	21.763
3.214	25.239
3.348	27.657
3.349	18.136
3.616	23.577
3.750	22.217
3.751	20.252
4.286	26.902
4.553	24.181
4.554	21.763
4.555	20.856
4.821	28.715
5.223	29.471
5.224	27.204
5.357	25.088
5.358	23.728
6.295	27.960
6.296	26.448
6.429	30.680
6.830	27.657
6.964	32.191
6.965	33.552
6.966	26.146
6.967	25.390
6.968	29.320
7.366	30.529
8.170	31.738
8.438	27.506
8.838	28.564
8.839	25.995
9.643	28.111
9.777	31.436
10.313	27.204
11.250	31.738];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CoulHall2017';
comment.tL_f = 'data for females';
% males
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.585	9.078
0.734	12.549
0.737	13.152
0.754	16.921
1.010	14.363
1.035	19.791
1.126	10.295
1.149	15.421
1.161	18.135
1.709	20.860
1.959	16.794
2.235	18.760
2.353	15.144
2.781	21.032
2.889	15.306
3.044	19.831
3.056	22.545
3.303	18.027
3.728	23.162
3.843	18.792
3.855	21.657
4.130	23.170
4.372	17.446
4.514	19.107
4.536	24.082
5.740	23.805
5.994	20.795
6.137	22.758
6.388	18.994
6.932	20.814
7.083	24.586
7.330	19.917
7.608	22.184
8.535	19.791
8.541	21.299
8.805	20.399
8.961	25.377
9.477	21.016
9.776	27.806
9.871	19.064
10.147	21.029
10.299	25.103
10.699	24.659
10.824	22.550
10.953	21.498
12.438	24.090];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CoulHall2017';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00525*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4JP49'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '213350'; % Ency of Life
metaData.links.id_Wiki = 'Platycephalus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4867990'; % Taxonomicon
metaData.links.id_WoRMS = '1019878'; % WoRMS
metaData.links.id_fishbase = 'Platycephalus-grandispinis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platycephalus}}';
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
bibkey = 'CoulHall2017'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.ecss.2017.03.028}, ' ...
'author = {Peter G. Coulson and Norman G. Hall and Ian C. Potter}, ' ... 
'year = {2017}, ' ...
'title = {Variations in biological characteristics of temperate gonochoristic species of {P}latycephalidae and their implications: {A} review}, ' ...
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {190(5)}, ' ...
'pages = {50-68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Platycephalus-grandispinis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
