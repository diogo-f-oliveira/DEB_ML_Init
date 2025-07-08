function [data, auxData, metaData, txtData, weights] = mydata_Acanthurus_nigrofuscus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Acanthurus_nigrofuscus'; 
metaData.species_en = 'Brown surgeonfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 02];

%% set data
% zero-variate data

data.am = 25*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'ToshFuku2023';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'all temperatures are guessed';
  
data.Lp  = 12; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 21;  units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.7 mm: 4/3*pi*0.035^3'; 
data.Wwp = 39.3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02512*Lp^2.96, see F1';
data.Wwi = 206; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02512*Li^2.96, see F1';

data.GSI = 0.09; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'ToshFuku2023';
  temp.GSI = C2K(16.7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
0.000	6.105
0.000	9.137
0.000	4.758
0.000	9.811
0.035	7.832
0.035	7.495
0.071	4.590
0.071	10.569
0.141	8.674
0.141	8.253
0.141	5.306
0.883	10.024
0.989	10.614
0.989	8.719
0.989	8.172
1.024	11.582
1.024	13.730
1.060	12.298
1.060	7.877
1.837	13.438
1.837	12.048
1.943	12.849
2.049	11.417
2.120	14.575
2.967	12.641
3.921	14.581
3.992	12.939
3.992	12.645
4.133	16.687
4.946	13.027
5.016	12.690
5.087	13.743
5.193	14.712
6.041	12.988
6.959	13.875
7.030	15.012
7.065	15.307
7.101	14.213
7.948	13.205
7.984	16.068
8.125	13.753
8.973	15.313
9.008	13.419
9.008	14.892
9.043	13.250
9.114	13.714
9.927	15.948
9.962	14.348
9.997	13.885
10.916	13.888
10.986	14.183
11.022	15.404
11.057	14.857
11.092	15.152
11.905	14.607
12.929	17.053
13.247	14.022
13.989	14.782
14.024	15.330
15.049	14.659
16.003	15.252
16.957	15.802
16.992	15.339
16.992	14.455
18.052	15.343
19.995	16.823
20.984	16.026
23.986	17.594
24.976	16.460
25.011	17.176];
data.tL_f(:,1) = (0.8+data.tL_f(:,1))*365; % convert yr to d
for i=2:size(data.tL_f,1);if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f = C2K(27.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ToshFuku2023';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
0.071	10.863
0.141	10.148
0.883	12.298
0.918	10.445
0.918	11.372
0.918	11.835
0.989	11.035
1.024	12.719
1.024	13.140
1.872	11.711
1.908	13.648
1.943	12.849
1.943	11.164
1.978	12.091
2.014	13.270
2.014	12.512
2.049	11.375
2.932	13.020
2.967	13.315
3.003	13.610
3.003	14.199
3.038	13.820
3.886	13.107
3.957	13.908
4.027	13.571
4.027	14.287
4.098	15.550
4.910	14.795
4.981	14.458
4.981	13.532
5.016	13.869
5.016	13.364
5.052	14.122
5.087	15.848
5.829	13.282
5.899	14.546
5.935	13.619
5.935	14.840
5.970	14.083
6.005	15.346
6.924	14.212
6.959	14.044
7.030	14.633
7.065	15.602
7.065	15.012
7.171	13.539
7.878	13.962
7.948	14.342
8.054	15.689
8.090	14.721
8.090	15.226
8.973	15.313
8.973	14.934
8.973	14.640
9.008	14.008
9.043	16.114
9.043	13.714
9.927	14.601
9.927	14.895
9.927	15.401
10.986	15.909
10.986	15.615
11.022	14.478
11.057	16.373
11.092	14.773
11.905	14.312
11.905	14.944
11.976	15.744
11.976	16.123
12.046	15.408
12.929	15.874
12.965	14.526
13.000	15.200
13.035	15.495
13.035	14.863
13.035	14.358
13.989	16.466
14.024	16.761
14.060	15.456
14.872	15.375
14.872	16.554
14.908	15.922
14.943	16.259
15.932	17.020
15.967	16.347
16.003	16.052
16.003	15.589
16.038	16.726
16.992	16.897
17.027	16.266
18.052	16.985
18.899	17.282
18.899	15.935
18.935	16.314
18.970	15.935
19.959	16.275
20.030	16.065];
data.tL_m(:,1) = (0.8+data.tL_m(:,1))*365; % convert yr to d
for i=2:size(data.tL_m,1);if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m = C2K(27.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ToshFuku2023';

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: W in g = 0.02512*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 0 - 15 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '92PZ'; % Cat of Life
metaData.links.id_ITIS = '172266'; % ITIS
metaData.links.id_EoL = '46577063'; % Ency of Life
metaData.links.id_Wiki = 'Acanthurus_nigrofuscus'; % Wikipedia
metaData.links.id_ADW = 'Acanthurus_nigrofuscus'; % ADW
metaData.links.id_Taxo = '159963'; % Taxonomicon
metaData.links.id_WoRMS = '219640'; % WoRMS
metaData.links.id_fishbase = 'Acanthurus-nigrofuscus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthurus_nigrofuscus}}';
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
bibkey = 'ToshFuku2023'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10228-023-00928-y}, ' ...
'author = {Harumi Toshida and Ifue Fukuchi and Yohei Nakamura and Katsunori Tachihara}, ' ... 
'year = {2023}, ' ...
'title = {Age, growth and maturation of the brown surgeonfish \emph{Acanthurus nigrofuscus} at {O}kinawa-jima {I}sland, {J}apan}, ' ...
'journal = {Ichthyological Research}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Acanthurus-nigrofuscus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

