function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_borbonicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_borbonicus'; 
metaData.species_en = 'Snubnose emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MINE'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K( 27.2 ); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 20];

%% set data
% zero-variate data

data.am = 19*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K( 27.2 );  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 21.3; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'DegoAli2013';
  comment.Wwb = 'value for L. mahsena, based egg diameter of 0.335 mm : pi/6*0.0335^3'; 
data.Wwp = 137.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01514*Lp^2.98, see F1';
data.Wwi = 900;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^2.98, see F1';

data.Ri  = 227e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'DegoAli2013';   
  temp.Ri = C2K( 27.2 ); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for L. mahsena; size is not specified';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.986	19.830
0.999	20.372
1.011	21.592
1.960	18.832
1.973	26.015
1.973	25.383
1.973	19.554
1.973	22.039
1.985	20.051
1.985	17.702
1.985	22.581
1.985	23.078
1.985	20.819
2.010	21.135
2.010	20.277
2.971	20.544
2.971	21.854
2.984	17.065
2.984	22.984
2.996	18.601
2.996	25.875
2.996	22.215
3.021	21.041
3.021	22.577
3.059	24.068
3.958	21.488
3.970	24.199
3.995	21.036
4.007	22.211
4.007	20.946
4.007	19.545
4.032	22.753
4.981	19.541
4.981	23.110
4.981	22.523
4.994	20.851
5.019	23.516
5.943	26.042
6.005	22.021
6.017	21.117
6.017	22.247
6.017	23.693
6.017	21.524
6.966	23.146
7.029	20.842
7.990	21.199
8.002	20.521
8.002	22.780
8.015	21.967
8.015	24.407];
data.tL_f(:,1) = 365 * (0.9+data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f    = C2K(27.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GranAlAb2010';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.974	20.869
0.999	21.908
1.024	19.513
1.973	24.253
1.973	19.871
1.985	24.795
1.985	23.982
1.985	23.621
1.985	18.605
2.010	27.687
2.959	23.978
2.971	18.827
2.984	21.493
2.984	24.926
2.996	27.547
3.970	24.696
3.995	23.566
4.007	23.792
4.007	24.018
4.007	22.392
4.020	18.958
4.020	19.952
4.020	21.533
4.956	19.902
4.981	24.827
4.981	24.511
4.981	24.330
4.981	22.206
4.994	18.592
4.994	21.800
5.006	28.441
5.006	25.414
5.968	19.717
5.980	19.084
5.980	22.112
5.980	22.880
5.993	23.602
6.005	24.145
6.005	20.395
6.030	24.777
6.105	25.364
6.979	20.481
6.991	23.598
6.991	23.914
6.991	25.586
6.991	22.739
7.004	19.486
7.004	21.203
7.004	23.327
7.004	21.791
7.016	20.887
7.016	23.010
7.054	19.983
7.990	22.780
8.015	23.187
8.027	24.813
8.027	21.876
9.026	21.601];
data.tL_m(:,1) = 365 * (0.9 + data.tL_m(:,1));  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','males'};  
temp.tL_m    = C2K(27.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GranAlAb2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.p_M = weights.psd.p_M * 8;

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

%% Discussion
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww ing g = 0.01514*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protogynous hermaphrodite';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6Q2MX'; % Cat of Life
metaData.links.id_ITIS = '550900'; % ITIS
metaData.links.id_EoL = '46580941'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_borbonicus'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_borbonicus'; % ADW
metaData.links.id_Taxo = '178732'; % Taxonomicon
metaData.links.id_WoRMS = '212064'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-borbonicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_borbonicus}}';
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
bibkey = 'GranAlAb2010'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2009.01380.x}, ' ...
'author = {Grandcourt, E. and Al Abdessalaam, T. Z. and Francis, F. and Al Shamsi, A.}, ' ... 
'year = {2010}, ' ...
'title = {Age-based life history parameters and status assessments of by-catch species (\emph{Lethrinus borbonicus}, \emph{Lethrinus microdon}, \emph{Pomacanthus maculosus} and \emph{Scolopsis taeniatus}) in the southern {A}rabian {G}ulf}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {26(3)}, ' ...
'pages = {381–389}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-borbonicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
