function [data, auxData, metaData, txtData, weights] = mydata_Pomacanthus_paru
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pomacanthiformes'; 
metaData.family     = 'Pomacanthidae';
metaData.species    = 'Pomacanthus_paru'; 
metaData.species_en = 'French angelfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCis', 'jiCit'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 22];

%% set data
% zero-variate data

data.am = 27*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(26.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 23.3; units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 41.1;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.1e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'reefbuilders';
  comment.Wwb = 'based on assumed egg diameter of 0.6 mm : 4/3*pi*0.03^3, motivated by being less then 0.9 mm for P. annularis'; 
data.Wwp = 370.6; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.03890*Lp^2.91, see F1';
data.Wwi = 1933; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.03890*Li^2.91, see F1';

data.Ri = 5.5e5/365; units.Ri = '#/d';   label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(26.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'guess based on kap = 0.95';

% uni-variate data
% time-length
data.tL = [ ... % age group (yr), total length (cm)
1.013	9.552
1.936	8.196
1.979	9.011
2.017	5.684
2.022	9.826
2.064	10.370
2.155	16.346
2.902	7.383
2.988	9.489
2.998	19.540
3.887	25.314
3.920	16.622
3.922	18.387
3.925	21.715
3.926	22.802
3.932	28.303
3.965	20.221
3.993	6.639
4.002	14.585
4.003	15.603
4.037	7.929
4.124	10.850
4.887	17.371
4.927	15.469
4.928	16.624
4.930	18.322
4.935	22.804
4.973	19.001
4.978	24.230
4.982	28.169
5.017	21.174
5.023	26.879
5.059	20.903
5.133	12.006
5.906	28.035
5.907	28.443
5.973	10.922
5.973	11.261
5.981	18.596
5.981	19.411
5.982	19.954
5.984	22.195
5.990	27.628
6.018	13.842
6.020	16.083
6.024	20.022
6.026	21.652
6.027	22.942
6.031	26.406
6.044	39.309
6.105	16.966
6.119	30.141
6.139	9.700
6.949	20.635
6.949	20.839
6.951	22.265
7.028	15.338
7.040	26.680
7.045	31.977
7.916	20.909
7.916	21.249
7.916	21.385
7.962	25.188
7.966	28.991
7.968	30.417
7.970	32.726
8.001	21.792
8.005	25.527
8.031	10.858
8.060	37.752
8.166	18.804
8.841	21.387
8.967	21.930
8.969	23.221
8.969	23.696
8.972	26.277
8.976	29.944
9.061	31.370
9.065	34.766
9.067	36.464
9.104	31.710
9.905	34.903
9.939	27.094
9.940	27.569
9.948	35.583
9.972	18.876
9.982	27.909
10.025	28.588
10.025	29.335
10.058	20.710
10.060	21.865
10.071	32.323
10.072	33.681
10.153	30.422
10.904	25.602
10.934	14.668
10.940	19.626
10.949	28.794
10.984	21.731
10.988	25.330
11.028	23.497
11.038	33.412
11.081	34.227
11.106	17.725
11.919	32.124
11.952	23.295
11.991	20.036
12.038	25.536
12.041	28.253
12.043	29.951
12.082	27.234
12.088	33.143
12.092	36.335
12.092	36.810
12.126	29.000
12.215	33.890
12.922	26.693
12.957	20.445
13.000	20.785
13.002	22.822
13.016	36.472
13.104	39.665
13.138	32.466
13.141	35.318
13.970	24.047
13.974	27.986
14.016	28.461
14.019	31.585
14.102	30.499
14.147	33.215
14.984	29.550
15.062	24.049
15.065	26.562
15.068	30.161
15.069	30.840
15.103	23.167
15.148	25.747
15.935	15.426
16.036	31.590
16.074	27.583
16.080	33.288
16.125	35.733
16.958	28.672
16.965	36.210
16.998	27.517
17.006	34.648
17.008	36.549
17.044	31.388
17.048	35.055
17.094	38.655
17.130	32.407
18.051	29.489
18.099	35.737
18.182	33.971
18.945	40.900
18.979	32.955
19.022	34.041
19.024	36.350
19.063	33.498
19.069	38.388
20.108	28.135
20.997	34.182
21.036	31.058
22.045	32.011
22.049	35.610
23.009	29.432
23.102	38.125
23.984	37.788
24.063	33.441
24.993	38.265
24.995	40.031
25.074	35.413
25.960	38.607
25.994	31.341
26.116	27.606
27.137	39.221];
data.tL(:,1) = 365* (data.tL(:,1) + 0); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length','females'};  
temp.tL   = C2K(26.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FeitArau2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to not differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.03890*(TL in cm)^2.91';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LQ6S'; % Cat of Life
metaData.links.id_ITIS = '169633'; % ITIS
metaData.links.id_EoL = '46581145'; % Ency of Life
metaData.links.id_Wiki = 'Pomacanthus_paru'; % Wikipedia
metaData.links.id_ADW = 'Pomacanthus_paru'; % ADW
metaData.links.id_Taxo = '45411'; % Taxonomicon
metaData.links.id_WoRMS = '276025'; % WoRMS
metaData.links.id_fishbase = 'Pomacanthus-paru'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomacanthus_paru}}';
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
bibkey = 'FeitArau2016'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.13246}, ' ...
'author = {C. V. Feitosa and M. E. Ara\''{u}jo and B. P. Ferreira}, ' ... 
'year = {2016}, ' ...
'title = {Estimates on age, growth and mortality of the {F}rench angelfish \emph{Pomacanthus paru} ({B}loch, 1787) ({T}eleostei: {P}omacanthidae) in the southwestern {A}tlantic}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {26(3)}, ' ...
'pages = {381–389}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Summary/Pomacanthus-paru}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

